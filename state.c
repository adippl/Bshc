#include "state.h"


//obj_resources* 
//resources_init(){
//	return(calloc(1,sizeof(obj_resources)));}

obj_resources*
resourcesFinalize(obj_resources* this){
	this->finalize=resourcesFinalize;
	this->free=resourcesFree;
	this->clean=resourcesClean;
	//this->copy=resourcesCopy;
	//CAT(obj,T)* (*copyDeep)(CAT(obj,T)* p_struct);
	this->copyDeep=NULL;
	this->objSize=sizeof(obj_resources);
	//uint16_t objName;
	
	this->vers=1;
	
	TEMPLATE3(arr,Finalize,obj_ship)(&this->shipTeplates);
	return(this);}

void
resourcesFree(obj_resources* this){
	NULL_P_CHECK(this);
	TEMPLATE3(arr,Clean,obj_ship)(&this->shipTeplates);
	free(this);
	return;}


void
resourcesClean(obj_resources* this){
	NULL_P_CHECK(this);
	TEMPLATE3(arr,Clean,obj_ship)(&this->shipTeplates);
	return;}

obj_resources*
resourcesCopy(obj_resources* this){
	NULL_P_CHECK(this);
	obj_resources* ptr=calloc(1,sizeof(obj_resources));
	NULL_P_CHECK(ptr);
	TEMPLATE3(arr,Finalize,obj_ship)(&ptr->shipTeplates);
	TEMPLATE3(arr,Copyto,obj_ship)(&this->shipTeplates,&ptr->shipTeplates);
	return(ptr);}


int
resourcesParse(obj_resources* this, json_stream* js){
	NULL_P_CHECK(this);
	NULL_P_CHECK(js);
	
	enum json_type type;
	const char* str=json_get_string(js,NULL);
	obj_ship* obj_ship=NULL;
	bool value,arrloop=true,var=false;
	//double number;
	//bool loop=true;
	type=json_next(js);
	if(type!=JSON_OBJECT)return(2);
	while(true){
		type=json_next(js);
		value=false;
		switch(type){
			case(JSON_DONE):
				return(0);
			case JSON_ERROR:
				PARSE_EMSG(js,json_typename[type]);
				fprintf(stderr,"JSON ERR %s\n",\
					json_get_error(js));
				break;
			case(JSON_OBJECT_END):
			case(JSON_NULL):
			case(JSON_ARRAY):
			case(JSON_OBJECT):
				PARSE_EMSG(js,json_typename[type]);
				exit(1);
				break;
			case(JSON_STRING):
				value=true;
				break;
				//skipToArrEnd(js);
				break;
			default:
				fprintf(stderr,"parsErr %s wrong node type %s\n" \
					,__func__,json_typename[type]);
				break;}
	if(value){
		parseVarINT(js,vers);
		
		parseARRobj(js,shipTeplates,obj_ship,shipParse,&this->shipTeplates);
				}}}

	
int
resources_Dump(obj_resources* this){
	NULL_P_CHECK(this);
	fprintf(stderr,"\n\ndumping obj_resources at %p :\n",(void*)this);
	fprintf(stderr,"vers: %d\n",this->vers);
	fprintf(stderr,"shipTeplates arr at %p:\n",(void*)&this->shipTeplates);
	TEMPLATE3(arr,dump,obj_ship)(&this->shipTeplates);
	fprintf(stderr,"\nEND of obj_resources at %p :\n",(void*)this);
	return(0);}
