#ifndef _PARSE_H
#define _PARSE_H

#include "conf.h"

const char json_typename[12][16];

const char* skipToNextObj(json_stream* jstream, size_t* r_length);
int skipToArrEnd(json_stream* js);


#define PARSE_EMSG(X,Y) fprintf(stderr,"json parse error in func %s pos %ld %ld %s",__func__,json_get_lineno(X),json_get_position(X),(Y))

/*
#define parseVar(X,Y) if(strcmp(#Y,str)==0){ \
		if(json_next(X)==JSON_NUMBER){ \
			this->Y=(int)json_get_number(X);} \
		else{PARSE_EMSG(X,"value of "##X##" is not a number"\n);}}
*/
#define parseVarINT(X,Y) if(strcmp(#Y,str)==0){ \
		if(json_next(X)==JSON_NUMBER){ \
			this->Y=(int)json_get_number(X);} \
		else{PARSE_EMSG(X,"value is not a number\n");}}

#define parseVarBOOL(X,Y) if(strcmp(#Y,str)==0){ \
		switch(json_next(X)==JSON_NUMBER){ \
			case(JSON_TRUE): this->Y=true; break; \
			case(JSON_FALSE): this->Y=false; break; \
			default: PARSE_EMSG(X,"value is not a number\n"); break;}}

#define parseVarSTR(X,Y) if(strcmp(#Y,str)==0){ \
		if(json_next(X)==JSON_STRING){ \
			strncpy(this->Y,json_get_string(X,NULL),SSTRLENG);} \
		else{PARSE_EMSG(X,"value is not a string\n");}}


#endif // _PARSE_H
