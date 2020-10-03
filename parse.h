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
			this->Y=(int)json_get_number(X); \
			continue;} \
		else{PARSE_EMSG(X,"value is not a number\n");}}

#define parseVarint64_t(X,Y) if(strcmp(#Y,str)==0){ \
		if(json_next(X)==JSON_NUMBER){ \
			this->Y=(int64_t)json_get_number(X); \
			continue;} \
		else{PARSE_EMSG(X,"value is not a number\n");}}

#define parseVarUINT(X,Y) if(strcmp(#Y,str)==0){ \
		if(json_next(X)==JSON_NUMBER){ \
			this->Y=(unsigned int)json_get_number(X); \
			continue;} \
		else{PARSE_EMSG(X,"value is not a number\n");}}

#define parseVarBOOL(X,Y) if(strcmp(#Y,str)==0){ \
		switch(json_next(X)){ \
			case(JSON_TRUE): this->Y=true; continue; \
			case(JSON_FALSE): this->Y=false; continue; \
			default: PARSE_EMSG(X,"value is not a number\n"); break;}}

#define parseVarSTR(X,Y) if(strcmp(#Y,str)==0){ \
		if(json_next(X)==JSON_STRING){ \
			strncpy(this->Y,json_get_string(X,NULL),SSTRLENG); \
			continue;} \
		else{PARSE_EMSG(X,"value is not a string\n");}}


#define parseARRobj(Z,Y,X,W,U)	if(strcmp(#Y,str)==0){ \
			if((type=json_next(Z))!=JSON_ARRAY)continue; \
			while(arrloop){ \
				type=json_next(Z); \
				var=false; \
				switch(type){ \
					case JSON_ERROR: \
						PARSE_EMSG(Z,json_typename[type]); \
						fprintf(stderr,"json ERR %s\n", \
							json_get_error(Z)); \
						break; \
					case JSON_OBJECT: \
						var=true; \
						break; \
					case JSON_DONE: \
					case JSON_ARRAY_END: \
						arrloop=false; \
						continue; \
					default: \
						fprintf(stderr,"arr parse err\n"); \
						PARSE_EMSG(Z,json_typename[type]); \
					    break; \
						} \
				if(var){ \
					X=TEMPLATE3(arr,append,X)(U); \
					if(!X)return(2); \
					W(X,Z);}} \
			continue;} 



#define parseOBJ(Z,X,Y) if(strcmp(#Y,str)==0){ \
		if(json_next(Z)==JSON_OBJECT){ \
			X(&this->Y,Z); \
			continue;} \
		else{PARSE_EMSG(Z,"value is not an obj ");}}



#define parseARR_SKIP(Z,Y) if(strcmp(#Y,str)==0){ \
		if(json_next(Z)==JSON_ARRAY){ \
			json_skip_until(Z,JSON_ARRAY_END); \
			continue;} \
		else{PARSE_EMSG(Z,"value is not a number\n");}}

#endif // _PARSE_H
