/*
 * utils.c
 *
 *  Created on: 2016年11月3日
 *      Author: flyzebra
 */
#include "utils.h"

char* getRandomString(char *str,int length) {
	int flag;
    int i;
	for (i = 0; i < length; i++) {
		flag = rand() % 3;
		switch (flag) {
		case 0:
			str[i] = 'A' + random() % 26;
			break;
		case 1:
			str[i] = 'a' + random() % 26;
			break;
		case 2:
			str[i] = '0' + random() % 10;
			break;
		default:
			str[i] = 'x';
			break;
		}
	}
	str[length] = '\0';
	return str;
}
