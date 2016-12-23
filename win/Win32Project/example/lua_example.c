#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
//luaͷ�ļ�
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
//lua�е��õ�c��������,ʵ�ּӷ�
int csum(lua_State* l)
{
	int a = lua_tointeger(l, 1);
	int b = lua_tointeger(l, 2);
	/* push result */
	lua_pushinteger(l, a + b);

	/* ������Կ�����C���Է��ظ�Lua��������
	* ͨ����ε���lua_push*()��֮��return���ؽ����������
	*/
	return 1;  /* number of results */
}

int main(int argc, char** argv)
{
	lua_State * l = luaL_newstate();        //����lua���л���
	/* open standard libraries */
	luaL_openlibs(l);
	.(l);
	if (l == NULL) err_return(-1, "luaL_newstat() failed","");
	int ret = 0;
	ret = luaL_loadfile(l, "func.lua");      //����lua�ű��ļ�
	if (ret != 0) err_return(-1, "luaL_loadfile failed", "");
	ret = lua_pcall(l, 0, 0, 0);
	if (ret != 0) err_return(-1, "lua_pcall failed:%s", lua_tostring(l, -1));

	lua_getglobal(l, "width");              //��ȡlua�ж���ı���
	lua_getglobal(l, "height");
	int width = lua_tointeger(l, -1);
	int height = lua_tointeger(l, -2);
	printf("height:%ld width:%ld\n", height, width);
	lua_pop(l, 1);                        //�ָ�lua��ջ

	int a = width;
	int b = height;
	lua_getglobal(l, "sum");               //����lua�еĺ���sum
	lua_pushinteger(l, a);
	lua_pushinteger(l, b);
	ret = lua_pcall(l, 2, 1, 0);
	if (ret != 0) err_return(-1, "lua_pcall failed:%s", lua_tostring(l, -1));
	printf("sum:%d + %d = %ld\n", a, b, lua_tointeger(l, -1));
	lua_pop(l, 1);

	const char str1[] = "call lua func mystrcat";
	const char str2[] = " from C code";
	
	lua_getglobal(l, "mystrcat");          //����lua�еĺ���mystrcat
	lua_pushstring(l, str1);
	lua_pushstring(l, str2);
	ret = lua_pcall(l, 2, 1, 0);
	if (ret != 0) err_return(-1, "lua_pcall failed:%s", lua_tostring(l, -1));
	printf("call mystrcat(%s + %s ) = %s\n", str1, str2, lua_tostring(l, -1));
	lua_pop(l, 1);

	/* �����仰���и��򵥵ķ�����
	* lua_register(l, "csum", csum)
	* ��C����"csum"����ΪLua��ȫ�ֱ���"csum"��
	* ��ʵ�������º꣺
	* #define lua_register(L,n,f) \
	*      (lua_pushcfunction(L, f), lua_setglobal(L, n))
	*/
	lua_pushcfunction(l, csum);         //ע����lua��ʹ�õ�c����
	lua_setglobal(l, "csum");           //�󶨵�lua�е�����csum
	

	lua_getglobal(l, "mysum");           //����lua�е�mysum�������ú������ñ������ж����csum����ʵ�ּӷ�
	lua_pushinteger(l, a);
	lua_pushinteger(l, b);
	ret = lua_pcall(l, 2, 1, 0);
	if (ret != 0) err_return(-1, "lua_pcall failed:%s", lua_tostring(l, -1));
	printf("mysum:%d + %d = %ld \n", a, b, lua_tointeger(l, -1));
	lua_pop(l, 1);
	
	//����lua�е�main_start�������ú���Ϊlua�ű�����ں�������������ҵ��ִ���߼���
	lua_getglobal(l, "main_start");         
	lua_pushinteger(l, a);
	lua_pushinteger(l, b);
	printf("will call main_start:%d + %d\n", a, b);
	ret = lua_pcall(l, 2, 1, 0);
	if (ret != 0) err_return(-1, "lua_pcall failed:%s", lua_tostring(l, -1));
	printf("mysum:result %ld \n",lua_tointeger(l, -1));
	lua_pop(l, 1);

	lua_close(l);                     //�ͷ�lua���л���
	return 0;
}



