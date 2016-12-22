/*
 ============================================================================
 Name        : FlyGo.c
 Author      : FlyZebra
 Version     :
 Copyright   : FlyZebra
 Description : Hello World in C, Ansi-style
 ============================================================================
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "fly.h"

int main(int argc, char** argv) {
	char vurl[256] = "http://v.qq.com/x/cover/0hz4v8bthevafrz/a0021tweo8p.html";
	char vid[256] = "a0021tweo8p";
	char url[256] = "http://btrace.video.qq.com/kvcollect";

	int loopsum = 0;
	int looptime = 0;

	if(argc==1){
		printf("请输入地址,ID,次数，间隔时间！\n");
	}
	if(argc>4){
		looptime = atoi(argv[4]);
		printf("looptime=%s;\n",argv[4]);
	}
	if(argc>3){
		loopsum = atoi(argv[3]);
		printf("loopsum=%s;\n",argv[3]);
	}

	if(argc>2){
		memset(vid,0,256);
		memcpy(vid,argv[2],strlen(argv[2]));
		printf("vid=%s;\n",argv[2]);
	}
	if(argc>1){
		memset(vurl,0,256);
		memcpy(vurl,argv[1],strlen(argv[1]));
		printf("vurl=%s;\n",argv[1]);
	}

//	if (argc < 3) {
//		printf("请输入次数和间隔时间,使用默认值\r\n");
//		sleep(2);
//		//return 0;
//
//	} else {
//		if (argv[1] != NULL) {
//			count = atoi(argv[1]);
//		}
//		if (argv[2] != NULL) {
//			count = atoi(argv[2]);
//		}
//	}

	if (vurl == NULL) {
		printf("please input refresh url!\n");
		return EXIT_SUCCESS;
	}

	if (vid == NULL) {
		printf("please input refresh vid!\n");
		return EXIT_SUCCESS;
	}

	if (1 > loopsum) {
		loopsum = 10000;
	}

	if (1 > looptime) {
		looptime = 1;
	}

	post_data(vurl, vid, url, loopsum, looptime);

	return EXIT_SUCCESS;
}
