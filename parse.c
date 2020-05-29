#include "parse.h"

const char json_typename[][16] = {
	[JSON_ERROR]      = "ERROR",
	[JSON_DONE]       = "DONE",
	[JSON_OBJECT]     = "OBJECT",
	[JSON_OBJECT_END] = "OBJECT_END",
	[JSON_ARRAY]      = "ARRAY",
	[JSON_ARRAY_END]  = "ARRAY_END",
	[JSON_STRING]     = "STRING",
	[JSON_NUMBER]     = "NUMBER",
	[JSON_TRUE]       = "TRUE",
	[JSON_FALSE]      = "FALSE",
	[JSON_NULL]       = "NULL",
	};


const char*
skipToNextObj(json_stream* jstream, size_t* r_length){
	const char* retStr=NULL;
	enum json_type type;
	bool prevIsObj;
	while((type=json_next(jstream))!=JSON_DONE){
		if(prevIsObj&&type==JSON_STRING){
			retStr=json_get_string(jstream,r_length);
			if(retStr){
				return(retStr);}
			else{
				break;}}
		if(type==JSON_OBJECT)prevIsObj=true;
		else prevIsObj=false;}
	return(NULL);}

int
skipToArrEnd(json_stream* js){
	enum json_type type;
	uint_fast32_t arrDepth=1;
	while(true){
		type=json_next(js);
		if(!arrDepth)return(0);
		switch(type){
			case(JSON_ARRAY):
				arrDepth++;
				break;
			case(JSON_ARRAY_END):
				arrDepth--;
				break;
			default:
				continue;}}}
	

/*
int
parseArr(json_stream* js){
	enum json_type type;
	uint_fast32_t arrDepth=1;
	while(true){
		type=json_next(js);
		if(!arrDepth)return(0);
		switch(type){
			case(JSON_ARRAY):
				arrDepth++;
				break;
			case(JSON_ARRAY_END):
				arrDepth--;
				break;
			default:
				continue;}}}
*/	


/*
	FILE* res_conf_json=fopen(F_MAIN_CONF,"r");
	bool error=false;
	if(!res_conf_json){
		fprintf(stderr,"test %s failed to open %s",__func__,F_MAIN_CONF);
		return(1);}
	else{
		json_stream JS={0};
		json_open_stream(&JS, res_conf_json);
		json_set_streaming(&JS,true);
		//enum json_type type;
		const char* str=NULL;
		size_t strLength=0;
		if(	json_next(&JS)==JSON_OBJECT && \
			json_next(&JS)==JSON_STRING && \
			(str=json_get_string(&JS,&strLength))!=NULL && \
			strcmp("resources",str)==0){
			printf("successss!!!!\n");}
		else{
			goto error;}
			
		
		printf("peek %s\n",json_typename[json_peek(&JS)]);
		printf("next %s\n",json_typename[json_next(&JS)]);
		printf("next %s\n",json_typename[json_next(&JS)]);
		printf("next %s\n",json_typename[json_next(&JS)]);
		printf("next %s\n",json_typename[json_next(&JS)]);
		printf("next %s\n",json_typename[json_next(&JS)]);
		//printf("next %s\n",json_typename[json_next(&JS)]);
		//printf("next %s\n",json_typename[json_next(&JS)]);
		//printf("next %s\n",json_typename[json_next(&JS)]);
		//printf("next %s\n",json_typename[json_next(&JS)]);
		
		if(error){
			error:
			fprintf(stderr,"PARISING ERROR %s\n",__func__);}
		json_close(&JS);
		fclose(res_conf_json);
		return(0);}}
*/
