/*
 * fly.c
 *
 *  Created on: 2016年11月3日
 *      Author: flyzebra
 */
#include "fly.h"
#include <unistd.h>

void post_data(char *vurl, char *vid, char *url, int loopsum, int looptime) {
	int i;
	int ret1;
	int ret2;

	char bf_cmid[128] = { 0 };
	char bf_pid[128] = { 0 };

	char *cmid;
	char *pid;

	char bf_data1[4096] = { 0 };
	char bf_data2[4096] = { 0 };

	char *data1;
	char *data2;

	srand(clock());
	printf("start refresh %s,count = %d\n", vurl, loopsum);

	for (i = 0; i < loopsum; i++) {

		memset(bf_cmid, 0, strlen(bf_cmid));
		cmid = getRandomString(bf_cmid, 32);

		memset(bf_pid, 0, strlen(bf_pid));
		pid = getRandomString(bf_pid, 32);

		memset(bf_data1, 0, strlen(bf_data1));
		data1 = getPostData1(bf_data1, vurl, cmid, pid);

		memset(bf_data2, 0, strlen(bf_data2));
		data2 = getPostData2(bf_data2, vurl, cmid, pid, vid);

		ret1 = http_post(url, data1, "flygo1.tmp");

		printf("%d", ret1);
		sleep(0.5);

		ret2 = http_post(url, data2, "flygo2.tmp");
		printf("%d", ret2);
		printf(" -- sleep %d --current url=%s --%d pid=%d %s %s \n", looptime, vurl, i + 1,getpid(),cmid,pid);

		sleep(looptime);
	}

	printf("finish refresh %s\n", vurl);
}
