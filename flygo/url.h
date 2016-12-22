#ifndef URL_H
#define URL_H


#ifdef __cplusplus
extern "C" {
#endif

int url_decode(char *str, int len);
char *url_encode(char const *s,char *buffer, int len, int *new_length);

#ifdef __cplusplus
}
#endif

#endif /* URL_H */
