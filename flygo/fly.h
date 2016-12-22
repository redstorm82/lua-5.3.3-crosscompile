/*
 * fly.h
 *
 *  Created on: 2016年11月3日
 *      Author: flyzebra
 */

#ifndef FLY_H_
#define FLY_H_

#include <stdio.h>
#include <stdlib.h>
#include "curlutil.h"
#include "utils.h"
#include "url.h"
#include "qqpostdata.h"

#ifdef __cplusplus
extern "C" {
#endif

void post_data(char *vurl, char *vid, char *url, int loopsum, int looptime);

#ifdef __cplusplus
}
#endif


#endif /* FLY_H_ */
