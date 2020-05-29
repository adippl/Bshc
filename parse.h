
#ifndef _PARSE_H
#define _PARSE_H

#include "conf.h"
#include "state.h"

const char json_typename[12][16];

const char* skipToNextObj(json_stream* jstream, size_t* r_length);
int skipToArrEnd(json_stream* js);


#define PARSE_EMSG(X,Y) fprintf(stderr,"json parse error in func %s pos %ld %ld %s",__func__,json_get_lineno(X),json_get_position(X),(Y))

#endif // _PARSE_H
