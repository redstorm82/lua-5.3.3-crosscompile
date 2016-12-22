/*
 * qqpostdata.c
 *
 *  Created on: 2016年11月3日
 *      Author: flyzebra
 */
#include "qqpostdata.h"
/**
 * 返回的字符串如果不再使用需要释放内存
 */
char * getPostData1(char *data, char *vurl, char *cmid, char *pid) {
	int len;
	char *retstr;
	char bf_retstr[256];

	char bf_str_time[128];
	char *tmp_str_time;

	strcat(data, "tpid=");

	//播放页面地址
	strcat(data, "&url=");
	memset(bf_retstr, 0, strlen(bf_retstr));
	retstr = url_encode(vurl, bf_retstr, strlen(vurl), &len);
	strcat(data, retstr);

	//32位随机字符串
	strcat(data, "&cmid=");
	strcat(data, cmid);

	strcat(data, "&ptag=");

	strcat(data, "&emsg=%24%24");

	strcat(data, "&diaonlen=0%240%240");

	strcat(data, "&version=TencentPlayerV3%2E2%2E19%2E382");

	strcat(data, "&vurl=%24%24");

	strcat(data, "&pfversion=LNX%2E11%2E2");

	strcat(data, "&isfocustab=0%240%240");

	strcat(data, "&vid=%24%24");

	strcat(data, "&type=0%240%240");

	strcat(data, "&buffersize=0%240%240");

	strcat(data, "&preformat=0%240%240");

	strcat(data, "&isvisible=0%240%240");

	strcat(data, "&platform=1");

	strcat(data, "&rid=%24%24");

	strcat(data,
			"&ua=Mozilla%252F5%2E0%2520%28X11%253B%2520Ubuntu%253B%2520Linux%2520x86%5F64%253B%2520rv%253A49%2E0%29%2520Gecko%252F20100101%2520Firefox%252F49%2E0");

	strcat(data, "&loadwait=0%240%240");

	strcat(data, "&bi=0%240%240");

	strcat(data, "&predefn=0%240%240");

	strcat(data, "&bufferwait=0%240%240");

	//32位随机字符串
	strcat(data, "&pid");
	strcat(data, pid);

	strcat(data, "&cpay=0");

	strcat(data, "&autoformat=1%241%241");

	strcat(data, "&pversion=");

	strcat(data, "&tpay=%24%24");

	strcat(data, "&val1=1%241%241");

	strcat(data, "&index=0%241%242");

	strcat(data, "&bt=0");

	strcat(data, "&val2=0%240%240");

	strcat(data, "&dltype=1%241%241");

	strcat(data, "&level=0%240%240");

	strcat(data, "&step=400%24401%24402");

	strcat(data, "&clspeed=0%240%240");

	strcat(data, "&adid=");

	strcat(data, "&iformat=%24%24");

	//时间相关格式 ctime=2016-11-01 15:39:50 516$2016-11-01 15:39:50 662$2016-11-01 15:39:51 067
	//2016%2D11%2D03%2010%3A36%3A46%20168%242016%2D11%2D03%2010%3A36%3A46%20367%242016%2D11%2D03%2010%3A36%3A46%20758
	strcat(data, "&ctime=");
	memset(bf_retstr, 0, strlen(bf_retstr));
	tmp_str_time = get_current_time(bf_str_time, 128, "%Y-%m-%d %H:%M:%S 416");
	retstr = url_encode(tmp_str_time, bf_retstr, strlen(tmp_str_time), &len);
	strcat(data, retstr);
	memset(bf_retstr, 0, strlen(bf_retstr));
	tmp_str_time = get_current_time(bf_str_time, 128, "$%Y-%m-%d %H:%M:%S 562");
	retstr = url_encode(tmp_str_time, bf_retstr, strlen(tmp_str_time), &len);
	strcat(data, retstr);
	memset(bf_retstr, 0, strlen(bf_retstr));
	tmp_str_time = get_current_time(bf_str_time, 128, "$%Y-%m-%d %H:%M:%S 967");
	retstr = url_encode(tmp_str_time, bf_retstr, strlen(tmp_str_time), &len);
	strcat(data, retstr);

	strcat(data, "&exid=0%240%240");

	strcat(data, "&BossId=2577");

	strcat(data, "&defn=%24%24");

	strcat(data, "&idx=0%240%240");

	strcat(data, "&ptime=0%240%240");

	strcat(data, "&head%5Fref=");

	strcat(data, "&vt=0%240%240");

	strcat(data, "&ispac=0%240%240");

	strcat(data, "&isvip=%2D1%24%2D1%24%2D1");

//	printf("data1=%s",data);

	return data;
}

/**
 * 返回的字符串如果不再使用需要释放内存
 */
char * getPostData2(char *data, char *vurl, char *cmid, char *pid, char *vid) {
	int len;
	char *retstr;
	char bf_retstr[256];

	char bf_str_time[128];
	char *tmp_str_time;

	strcat(data, "tpid=");

	strcat(data, "&url=");
	memset(bf_retstr, 0, strlen(bf_retstr));
	retstr = url_encode(vurl, bf_retstr, strlen(vurl), &len);
	strcat(data, retstr);

	strcat(data, "&cmid=");
	strcat(data, cmid);

	strcat(data, "&ptag=");

	strcat(data, "&emsg=");

	strcat(data, "&diaonlen=1273");

	strcat(data, "&version=TencentPlayerV3%2E2%2E19%2E382");

	strcat(data, "&vurl=");

	strcat(data, "&pfversion=LNX%2E11%2E2");

	strcat(data, "&isfocustab=1");

	strcat(data, "&vid=");
	strcat(data, vid);

	strcat(data, "&type=0");

	strcat(data, "&buffersize=0");

	strcat(data, "&preformat=0");

	strcat(data, "&isvisible=1");

	strcat(data, "&platform=1");

	strcat(data, "&rid=");

	strcat(data,
			"&ua=Mozilla%252F5%2E0%2520%28X11%253B%2520Ubuntu%253B%2520Linux%2520x86%5F64%253B%2520rv%253A49%2E0%29%2520Gecko%252F20100101%2520Firefox%252F49%2E0");

	strcat(data, "&loadwait=0");

	strcat(data, "&bi=0");

	strcat(data, "&predefn=0");

	strcat(data, "&bufferwait=0");

	strcat(data, "&pid=");
	strcat(data, pid);

	strcat(data, "&cpay=0");

	strcat(data, "&autoformat=1");

	strcat(data, "&pversion=");

	strcat(data, "&tpay=");

	strcat(data, "&val1=0");

	strcat(data, "&index=3");

	strcat(data, "&bt=0");

	strcat(data, "&val2=0");

	strcat(data, "&dltype=1");

	strcat(data, "&level=0");

	strcat(data, "&step=3");

	strcat(data, "&clspeed=0");

	strcat(data, "&adid=");

	strcat(data, "&iformat=");

	//时间相关格式 ctime=2016-11-01 15:39:51 123
	//2016%2D11%2D03%2010%3A36%3A46%20770
	strcat(data, "&ctime=");
	memset(bf_retstr, 0, strlen(bf_retstr));
	tmp_str_time = get_current_time(bf_str_time, 128, "%Y-%m-%d %H:%M:%S 123");
	retstr = url_encode(tmp_str_time, bf_retstr, strlen(tmp_str_time), &len);
	strcat(data, retstr);

	strcat(data, "&exid=0");

	strcat(data, "&BossId=2577");

	strcat(data, "&defn=");

	strcat(data, "&idx=0");

	strcat(data, "&ptime=0");

	strcat(data, "&head%5Fref=");

	strcat(data, "&vt=0");

	strcat(data, "&ispac=0");

	strcat(data, "&isvip=%2D1");
	//此处目前为硬编码，将来需进一步修改增强功能

//	printf("data2=%s",data);

	return data;
}
