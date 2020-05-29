#include "state.h"


//obj_resources* 
//resources_init(){
//	return(calloc(1,sizeof(obj_resources)));}

obj_resources*
resourcesFinalize(obj_resources* this){
	this->finalize=resourcesFinalize;
	this->free=resourcesFree;
	//this->copy=resourcesCopy;
	//CAT(obj,T)* (*copyDeep)(CAT(obj,T)* p_struct);
	this->copyDeep=NULL;
	this->objSize=sizeof(obj_resources);
	//uint16_t objName;
	
	this->vers=1;
	
	TEMPLATE3(arr,Finalize,obj_ship)(&this->shipTeplates);
	return(this);}

void resourcesFree(obj_resources* this){
	NULL_P_CHECK(this);
	TEMPLATE3(arr,Clean,obj_ship)(&this->shipTeplates);
	free(this);
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
	const char* str=NULL;
	//double number;
	//bool loop=true;
	type=json_next(js);
	if(type!=JSON_OBJECT)return(2);
	while(true){
		type=json_next(js);
		switch(type){
			case(JSON_OBJECT_END):
				return(0);
			case(JSON_ERROR):
			case(JSON_DONE):
			case(JSON_OBJECT):
				return(3);
			case(JSON_STRING):
				str=json_get_string(js,NULL);
				break;
			//case(JSON_NUMBER):
			//	number=json_get_number(js);
			//	break;
			case(JSON_ARRAY):
				skipToArrEnd(js);
				break;
			default:
				break;}
	
	if(strcmp("vers",str)==0){
		if(json_next(js)==JSON_NUMBER){
			this->vers=(int)json_get_number(js);}
		else{
			PARSE_EMSG(js,"vers alue is not a number");}}
			

	}
	}

