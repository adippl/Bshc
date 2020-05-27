#include "module.h"

obj_module*
obj_moduleFinalize(obj_module* this){
	//this->free=(void (*)(obj_module*))objFree;
	this->free=moduleFree;
	//CAT(obj,T)* (*copy)(CAT(obj,T)* p_struct);
	this->copy=moduleCopy;
	//CAT(obj,T)* (*copyDeep)(CAT(obj,T)* p_struct);
	this->copyDeep=NULL;
	this->objSize=sizeof(obj_module);
	//uint16_t objName;
	this->temp=0;
	return(this);}

void moduleFree(obj_module* this){
	NULL_P_CHECK(this);
	free(this);
	return;}


obj_module*
moduleCopy(obj_module* this){
	NULL_P_CHECK(this);
	obj_module* ptr=calloc(1,sizeof(obj_module));
	NULL_P_CHECK(ptr);
	return(ptr);}
//obj_module* (*copyDeep)(obj_module* p_struct);

//#ifdef T
//#undef T
//#endif
//#define T obj_module
//#include "submod/cstl/tmpl/arr.c"
