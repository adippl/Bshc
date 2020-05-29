#include "smodule.h"

obj_smodule*
smoduleFinalize(obj_smodule* this){
	//this->free=(void (*)(obj_smodule*))objFree;
	this->free=smoduleFree;
	//CAT(obj,T)* (*copy)(CAT(obj,T)* p_struct);
	this->copy=smoduleCopy;
	this->objSize=sizeof(obj_smodule);
	//uint16_t objName;
	this->smodType=0;
	return(this);}

void smoduleFree(obj_smodule* this){
	NULL_P_CHECK(this);
	free(this);
	this=NULL;
	return;}

void smoduleClean(obj_smodule* this){
	NULL_P_CHECK(this);
	this=NULL;
	return;}



obj_smodule*
smoduleCopy(obj_smodule* this){
	NULL_P_CHECK(this);
	obj_smodule* ptr=calloc(1,sizeof(obj_smodule));
	NULL_P_CHECK(ptr);
	return(ptr);}
//obj_smodule* (*copyDeep)(obj_smodule* p_struct);
