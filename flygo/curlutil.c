#include "curlutil.h"

int http_get(char *url, char *savefile) {
	CURL *curl;
	CURLcode res = CURL_LAST;
    struct curl_slist *headers = NULL;
	FILE *fp= fopen(savefile, "w");
	if (fp == NULL){
        return res;
    }
	
	curl = curl_easy_init();    
    if (curl) {
    	curl_easy_setopt(curl, CURLOPT_COOKIEFILE, "cookie.txt");
		curl_easy_setopt(curl, CURLOPT_URL, url);
		curl_easy_setopt(curl, CURLOPT_TIMEOUT,60);
		curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp); 
		curl_easy_setopt(curl, CURLOPT_HEADERDATA, fp); 
        res = curl_easy_perform(curl); 
    }
	curl_slist_free_all(headers);
	curl_easy_cleanup(curl);
	fclose(fp);
	return res;
}


int http_post(char *url, char *data, char *savefile) {
	CURL *curl;
	CURLcode res = -1;
	FILE *fp;
	if ((fp = fopen(savefile, "w")) == NULL)
		return res;
	curl = curl_easy_init();
	if (curl) {
		curl_easy_setopt(curl, CURLOPT_COOKIEFILE, "cookie.txt");
        curl_easy_setopt(curl, CURLOPT_POSTFIELDS, data);
        curl_easy_setopt(curl, CURLOPT_URL, url); 
        curl_easy_setopt(curl, CURLOPT_TIMEOUT,60);
		curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp);
		res = curl_easy_perform(curl);
	}
	curl_easy_cleanup(curl);
	fclose(fp);
	return res;
}
