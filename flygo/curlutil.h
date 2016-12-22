/*
 * curlutil.h
 *
 *  Created on: 2016年11月3日
 *      Author: flyzebra
 */

#ifndef CURLUTIL_H_
#define CURLUTIL_H_

#include <stdio.h>
#include <curl/curl.h>

#ifdef __cplusplus
extern "C" {
#endif

int http_get(char *url,char *savefile);
int http_post(char *url,char *data,char *savefile);

#ifdef __cplusplus
}
#endif
#endif /* CURLUTIL_H_ */
