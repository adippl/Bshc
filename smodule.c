#include "smodule.h"

obj_smodule*
TEMPLATE(obj_smodule,finalize)(obj_smodule* this){
	this->finalize=TEMPLATE(obj_smodule,finalize);
	this->free=TEMPLATE(obj_smodule,free);
	this->clean=TEMPLATE(obj_smodule,clean);
	//this->copy=TEMPLATE(obj_smodule,copy);
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


void
TEMPLATE(obj_smodule,copy)(obj_smodule* this, obj_smodule* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);
	strncpy(dest->name,this->name,SSTRLENG);
	STRUCTCOPPIER(dest,this,posx);
	STRUCTCOPPIER(dest,this,posy);
	STRUCTCOPPIER(dest,this,hp);
	STRUCTCOPPIER(dest,this,armor);
	STRUCTCOPPIER(dest,this,hitChance);
	STRUCTCOPPIER(dest,this,ap);
	STRUCTCOPPIER(dest,this,apGen);
	STRUCTCOPPIER(dest,this,external);
	STRUCTCOPPIER(dest,this,curr_hp);
	STRUCTCOPPIER(dest,this,curr_armor);
	return;}


obj_smodule*
TEMPLATE(obj_smodule,print)(obj_smodule* this){
	NULL_P_CHECK(this);
	fprintf(stderr,"\ndumping smodule\n");
	DUMP_STRUCT_int(this,smodType);
	DUMP_STRUCT_string(this,name);
	DUMP_STRUCT_int(this,posx);
	DUMP_STRUCT_int(this,posy);
	DUMP_STRUCT_int(this,hp);
	DUMP_STRUCT_int(this,armor);
	DUMP_STRUCT_int(this,powergen);
	DUMP_STRUCT_int(this,hitChance);
	DUMP_STRUCT_int(this,ap);
	DUMP_STRUCT_int(this,curr_hp);
	DUMP_STRUCT_int(this,curr_armor);
	fprintf(stderr,"\textermal %d\n",this->external);
	
	return(NULL);}



int
smoduleParse(obj_smodule* this, json_stream* js){
	NULL_P_CHECK(this);
	NULL_P_CHECK(js);
	enum json_type type;
	const char* str=json_get_string(js,NULL);
	bool var=false;
	printf("FIRST STRING %s\n",str);
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
				exit(3);
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
				fprintf(stderr,"SMODULE END l=%ld\n",json_get_lineno(js));
				return(0);}
		if(var){
			parseVarINT(js,smodType)
			parseVarINT(js,posx)
			parseVarINT(js,posy)
			parseVarINT(js,hp)
			parseVarINT(js,armor)
			parseVarINT(js,powergen)
			parseVarINT(js,hitChance)
			parseVarINT(js,ap)
			parseVarINT(js,apGen)
			
			parseVarSTR(js,name)
			parseVarBOOL(js,external);
			
			parseVarINT(js,curr_hp)
			parseVarINT(js,curr_armor)
			}
		}
	return(1);}
