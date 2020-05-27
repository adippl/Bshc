#include "state.h"


//obj_resources* 
//resources_init(){
//	return(calloc(1,sizeof(obj_resources)));}

obj_resources*
obj_resourcesFinalize(obj_resources* this){
	//this->free=(void (*)(obj_resources*))objFree;
	this->free=resourcesFree;
	//CAT(obj,T)* (*copy)(CAT(obj,T)* p_struct);
	this->copy=resourcesCopy;
	//CAT(obj,T)* (*copyDeep)(CAT(obj,T)* p_struct);
	this->copyDeep=NULL;
	this->objSize=sizeof(obj_resources);
	//uint16_t objName;
	this->temp=0;
	return(this);}

void resourcesFree(obj_resources* this){
	NULL_P_CHECK(this);
	free(this);
	return;}


obj_resources*
resourcesCopy(obj_resources* this){
	NULL_P_CHECK(this);
	obj_resources* ptr=calloc(1,sizeof(obj_resources));
	NULL_P_CHECK(ptr);
	return(ptr);}
//obj_resources* (*copyDeep)(obj_resources* p_struct);

