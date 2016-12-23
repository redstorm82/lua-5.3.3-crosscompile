#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
//lua头文件
#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>

#define err_exit(num,fmt,args)  \
    do{printf("[%s:%d]"fmt"\n",__FILE__,__LINE__,##args);getch();exit(num);} while(0)
#define err_return(num,fmt,args)  \
    do{printf("[%s:%d]"fmt"\n",__FILE__,__LINE__,##args);getch();return(num);} while(0)
#define lua_register(L,n,f) \
	(lua_pushcfunction(L, f), lua_setglobal(L, n))
extern int luaopen_cjson(lua_State *l);
//lua中调用的c函数定义,实现加法
int csum(lua_State* l)
{
	int a = lua_tointeger(l, 1);
	int b = lua_tointeger(l, 2);
	/* push result */
	lua_pushinteger(l, a + b);

	/* 这里可以看出，C可以返回给Lua多个结果，
	* 通过多次调用lua_push*()，之后return返回结果的数量。
	*/
	return 1;  /* number of results */
}

int main(int argc, char** argv)
{
	lua_State * l = luaL_newstate();        //创建lua运行环境
	/* open standard libraries */
	luaL_openlibs(l);
	.(l);
	if (l == NULL) err_return(-1, "luaL_newstat() failed","");
	int ret = 0;
	ret = luaL_loadfile(l, "func.lua");      //加载lua脚本文件
	if (ret != 0) err_return(-1, "luaL_loadfile failed", "");
	ret = lua_pcall(l, 0, 0, 0);
	if (ret != 0) err_return(-1, "lua_pcall failed:%s", lua_tostring(l, -1));

	lua_getglobal(l, "width");              //获取lua中定义的变量
	lua_getglobal(l, "height");
	int width = lua_tointeger(l, -1);
	int height = lua_tointeger(l, -2);
	printf("height:%ld width:%ld\n", height, width);
	lua_pop(l, 1);                        //恢复lua的栈

	int a = width;
	int b = height;
	lua_getglobal(l, "sum");               //调用lua中的函数sum
	lua_pushinteger(l, a);
	lua_pushinteger(l, b);
	ret = lua_pcall(l, 2, 1, 0);
	if (ret != 0) err_return(-1, "lua_pcall failed:%s", lua_tostring(l, -1));
	printf("sum:%d + %d = %ld\n", a, b, lua_tointeger(l, -1));
	lua_pop(l, 1);

	const char str1[] = "call lua func mystrcat";
	const char str2[] = " from C code";
	
	lua_getglobal(l, "mystrcat");          //调用lua中的函数mystrcat
	lua_pushstring(l, str1);
	lua_pushstring(l, str2);
	ret = lua_pcall(l, 2, 1, 0);
	if (ret != 0) err_return(-1, "lua_pcall failed:%s", lua_tostring(l, -1));
	printf("call mystrcat(%s + %s ) = %s\n", str1, str2, lua_tostring(l, -1));
	lua_pop(l, 1);

	/* 这两句话还有更简单的方法：
	* lua_register(l, "csum", csum)
	* 将C函数"csum"定义为Lua的全局变量"csum"。
	* 其实现是如下宏：
	* #define lua_register(L,n,f) \
	*      (lua_pushcfunction(L, f), lua_setglobal(L, n))
	*/
	lua_pushcfunction(l, csum);         //注册在lua中使用的c函数
	lua_setglobal(l, "csum");           //绑定到lua中的名字csum
	

	lua_getglobal(l, "mysum");           //调用lua中的mysum函数，该函数调用本程序中定义的csum函数实现加法
	lua_pushinteger(l, a);
	lua_pushinteger(l, b);
	ret = lua_pcall(l, 2, 1, 0);
	if (ret != 0) err_return(-1, "lua_pcall failed:%s", lua_tostring(l, -1));
	printf("mysum:%d + %d = %ld \n", a, b, lua_tointeger(l, -1));
	lua_pop(l, 1);
	
	//调用lua中的main_start函数，该函数为lua脚本的入口函数，控制所有业务执行逻辑。
	lua_getglobal(l, "main_start");         
	lua_pushinteger(l, a);
	lua_pushinteger(l, b);
	printf("will call main_start:%d + %d\n", a, b);
	ret = lua_pcall(l, 2, 1, 0);
	if (ret != 0) err_return(-1, "lua_pcall failed:%s", lua_tostring(l, -1));
	printf("mysum:result %ld \n",lua_tointeger(l, -1));
	lua_pop(l, 1);

	lua_close(l);                     //释放lua运行环境
	return 0;
}



