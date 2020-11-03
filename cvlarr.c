#include "cvlarr.h"

obj_cvlarr*
OBJF(obj_cvlarr,finalize)(obj_cvlarr* this){
	NULL_P_CHECK(this);
	this->mem=calloc(CVLARR_DEF_ALLOC_SIZE,sizeof(char));
	this->memSize=CVLARR_DEF_ALLOC_SIZE;
	this->indexArr=calloc(CVLARR_DEF_SIZE,sizeof(int));
	this->indexArrSize=CVLARR_DEF_SIZE;
	this->noStrings=0;
	this->iterPos=0;
	#ifdef DEBUG
	this->_debug_resizeCount=0;
	#endif
	return(this);}
	

void
OBJF(obj_cvlarr,clean)(obj_cvlarr* this){
	NULL_P_CHECK(this);
	free(this->mem);
	free(this->indexArr);}

void
OBJF(obj_cvlarr,copy)(obj_cvlarr* this, obj_cvlarr* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);
	
	//resize
	//memcpy(dest->mem,this->mem);
	//resize
	//memcpy(dest->indexArr,this->indexArr);
	STRUCTCOPPIER(dest,this,memSize);
	STRUCTCOPPIER(dest,this,indexArrSize);
	STRUCTCOPPIER(dest,this,noStrings);
	STRUCTCOPPIER(dest,this,iterPos);
	#ifdef DEBUG
	STRUCTCOPPIER(dest,this,_debug_resizeCount);
	#endif
	}

//void
//OBJF(obj_cvlarr,print)(obj_cvlarr* this){
//	NULL_P_CHECK(this);
//	
//	printf("DUMPING %s obj_cvlarr at %p\n",__func__,(void*)this);
//	DUMP_STRUCT_voidPtr(this,mem);
//	DUMP_STRUCT_size_t(this,memSize);
//	DUMP_STRUCT_voidPtr(this,indexArr);
//	DUMP_STRUCT_size_t(this,indexArrSize);
//	#ifdef DEBUG
//	DUMP_STRUCT_int(this,_debug_resizeCount);
//	#endif
//	for(int i=0;i<this->noStrings;i++){
//		printf("string no. %i=%s\n",i,obj_cvlarr_getStr(obj_cvlarr* this,i));}}
