#include "smodule.h"

obj_smodule*
TEMPLATE(obj_smodule,finalize)(obj_smodule* this){
	this->finalize=TEMPLATE(obj_smodule,finalize);
	this->free=TEMPLATE(obj_smodule,free);
	this->clean=TEMPLATE(obj_smodule,clean);
	this->copy=TEMPLATE(obj_smodule,copy);
	this->objSize=sizeof(obj_smodule);
	//uint16_t objName;
	this->smodType=0;
	this->name=calloc(SSTRLENG,sizeof(char));
	return(this);}

void
TEMPLATE(obj_smodule,free)(obj_smodule* this){
	NULL_P_CHECK(this);
	free(this);
	return;}

void
TEMPLATE(obj_smodule,clean)(obj_smodule* this){
	//NULL_P_CHECK(this);
	free(this->name);
	return;}



obj_smodule*
TEMPLATE(obj_smodule,copy)(obj_smodule* this){
	NULL_P_CHECK(this);
	obj_smodule* ptr=calloc(1,sizeof(obj_smodule));
	NULL_P_CHECK(ptr);
	return(ptr);}



obj_smodule*
TEMPLATE(obj_smodule,print)(obj_smodule* this){
	NULL_P_CHECK(this);
	fprintf(stderr,"dumping smodule.h");
	DUMP_STRUCT_int(this,smodType);
	DUMP_STRUCT_string(this,name);
	DUMP_STRUCT_int(this,hp);
	DUMP_STRUCT_int(this,powergen);
	DUMP_STRUCT_int(this,hitChance);
	DUMP_STRUCT_int(this,ap);
	return(NULL);}



int
smoduleParse(obj_smodule* this, json_stream* js){
	NULL_P_CHECK(this);
	NULL_P_CHECK(js);
	enum json_type type=json_peek(js);
	const char* str=json_get_string(js,NULL);
	bool var=false;
	printf("FIRST STRING %s\n",str);
	while(true){
		switch(type){
			case JSON_NULL:
			case JSON_TRUE:
			case JSON_FALSE:
			case JSON_NUMBER:
				printf("\t yARRLOOP BB %s\n",json_typename[type]);
			    break;
			case JSON_STRING:
				var=true;
			    break;
			case JSON_ARRAY:
			case JSON_OBJECT:
			case JSON_ERROR:
			case JSON_DONE:
				PARSE_EMSG(js,"unexpected JSON ERROR");
			    break;
			case JSON_ARRAY_END:
				PARSE_EMSG(js,"unexprcted array end");
				return(1);
			case JSON_OBJECT_END:
				return(0);}
		if(var){
			parseVarINT(js,smodType)
			parseVarINT(js,hp)
			parseVarINT(js,powergen)
			parseVarINT(js,hitChance)
			parseVarINT(js,ap)
			parseVarINT(js,apGen)
			parseVarSTR(js,name)
			}

		type=json_next(js);
		}
		
	
	return(1);}


