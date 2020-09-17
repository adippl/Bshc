#include "map.h"

obj_map*
OBJF(obj_map,finalize)(obj_map* this){
	this->mapsx=0;
	this->mapsy=0;
	/* solar system radius 143730642000000.0 m */
	this->mapName=calloc(SSTRLENG,sizeof(char));
	TEMPLATE3(arr,Finalize,obj_ship)(&this->ships);
	return(this);}

void
OBJF(obj_map,clean)(obj_map* this){
	//NULL_P_CHECK(this);
	TEMPLATE3(arr,Clean,obj_ship)(&this->ships);
	free(this->mapName);
	return;}


void
OBJF(obj_map,copy)(obj_map* this, obj_map* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);
	strncpy(dest->mapName,this->mapName,SSTRLENG);
	TEMPLATE3(arr,Copyto_memcpy,obj_ship)(&this->ships,&dest->ships);
	STRUCTCOPPIER(dest,this,mapsx);
	STRUCTCOPPIER(dest,this,mapsy);
	return;}


obj_map*
OBJF(obj_map,print)(obj_map* this){
	NULL_P_CHECK(this);
	fprintf(stderr,"\ndumping obj_map\n");
	DUMP_STRUCT_string(this,mapName);
	DUMP_STRUCT_int64(this,mapsx);
	DUMP_STRUCT_int64(this,mapsy);
	TEMPLATE3(arr,dump,obj_ship)(&this->ships);
	return(NULL);}

int
mapParse(obj_map* this, json_stream* js){
	NULL_P_CHECK(this);
	NULL_P_CHECK(js);
	
	enum json_type type;
	const char* str=json_get_string(js,NULL);
	//bool arrloop=true;
	printf("FIRST %s	 STRING %s\n",__func__,str);

	bool var=false;
	while(true){
		type=json_next(js);
		switch(type){
			case JSON_ERROR:
				PARSE_EMSG(js,json_typename[type]);
				fprintf(stderr,"JSON ERR %s\n",\
					json_get_error(js));
				break;
			case JSON_NULL:
			case JSON_TRUE:
			case JSON_FALSE:
			case JSON_NUMBER:
				break;
			case JSON_STRING:
				var=true;
			    break;
			case JSON_ARRAY:
			case JSON_OBJECT:
			case JSON_DONE:
				PARSE_EMSG(js,json_typename[type]);
			    break;
			case JSON_ARRAY_END:
				PARSE_EMSG(js,json_typename[type]);
				return(1);
			case JSON_OBJECT_END:
				fprintf(stderr,"SHIP END l=%ld\n",json_get_lineno(js));
				return(0);}
		if(var){
			parseVarSTR(js,mapName);
			}
		}
	return(1);}

