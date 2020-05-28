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
	
	
	this->shipTeplates=TEMPLATE3(arr,Init,obj_ship)();
	return(this);}

void resourcesFree(obj_resources* this){
	NULL_P_CHECK(this);
	free(this);
	return;}


//obj_resources*
//resourcesCopy(obj_resources* this){
//	NULL_P_CHECK(this);
//	obj_resources* ptr=calloc(1,sizeof(obj_resources));
//	NULL_P_CHECK(ptr);
//	return(ptr);}
//obj_resources* (*copyDeep)(obj_resources* p_struct);

