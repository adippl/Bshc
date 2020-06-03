#ifndef _PARSE_H
#define _PARSE_H

#include "conf.h"

const char json_typename[12][16];

const char* skipToNextObj(json_stream* jstream, size_t* r_length);
int skipToArrEnd(json_stream* js);


#define PARSE_EMSG(X,Y) fprintf(stderr,"json parse error in func %s pos %ld %ld unexpected %s\n",__func__,json_get_lineno(X),json_get_position(X),(Y))

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


#define parseARRobj(Z,Y,X,W,U)	if(strcmp(#Y,str)==0){ \
			if(json_next(Z)!=JSON_ARRAY)continue; \
			while(arrloop){ \
				var=false; \
				switch(type){ \
					case JSON_ERROR: \
						PARSE_EMSG(js,json_typename[type]); \
						fprintf(stderr,"JSON ERR %s\n", \
							json_get_error(js)); \
						break; \
					case JSON_NULL: \
					case JSON_TRUE: \
					case JSON_FALSE: \
					case JSON_NUMBER: \
					case JSON_STRING: \
					case JSON_OBJECT_END: \
					case JSON_ARRAY: \
						PARSE_EMSG(Z,json_typename[type]); \
					    break; \
					case JSON_OBJECT: \
						var=true; \
						break; \
					case JSON_DONE: \
					case JSON_ARRAY_END: \
						PARSE_EMSG(Z,json_typename[type]); \
						arrloop=false; \
						break;} \
				if(var){ \
					X=TEMPLATE3(arr,append,X)(U); \
					if(!X)return(2); \
					W(X,Z); \
					if(json_peek(Z)==JSON_OBJECT)continue; \
					} \
				type=json_next(Z);}} 


#endif // _PARSE_H
