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


char*
obj_cvlarr_getStr(obj_cvlarr* this, unsigned int index){
	NULL_P_CHECK(this);
	char* retPtr=NULL;
	
	if(this->noStrings<1 || index>this->noStrings)
		return(NULL);
	#ifdef DEBUG
	if(index>this->indexArrSize){
		fprintf(stderr,"ERR %s inder over indexArrSize limit in obj %p\n",\
			__func__,(void*)this); 
		return(NULL);}
	#endif
	retPtr=*(this->indexArr+index);
	#ifdef DEBUG
	if(retPtr>=this->mem+this->memSize){
		fprintf(stderr,"ERR %s retPtr over memSize limit in obj %p\n",\
			__func__,(void*)this); 
		return(NULL);}
	#endif
	return(retPtr);}

int
obj_cvlarr__resize_mem(obj_cvlarr* this, unsigned int to){
	//if(this->memSize<=to)
	//	return(1);
	if(realloc(this->mem,this->memSize+to)==NULL)
		return(1);
	memset(this->mem+this->memSize,0,to);
	return(0);}

int
obj_cvlarr__resize_indexArr(obj_cvlarr* this, size_t to){
	//if(this->indexArrSize<=to)
	//	return(2);
	if(realloc(this->indexArr,this->indexArrSize+to)==NULL)
		return(1);
	memset(this->indexArr+this->indexArrSize,0,to);
	return(0);}

void
obj_cvlarr_resize(obj_cvlarr* this, size_t charArrSize, unsigned int indexArrSize){
	NULL_P_CHECK(this);
	obj_cvlarr__resize_mem(this,charArrSize);
	obj_cvlarr__resize_indexArr(this,indexArrSize);
	}


int
obj_cvlarr__autoExtend(obj_cvlarr* this, size_t nextString){
	if(this->noStrings>=this->indexArrSize)
		if(obj_cvlarr__resize_indexArr(this,this->indexArrSize+CVLARR_DEF_SIZE)){
			#ifdef DEBUG
			fprintf(stderr,"ERR %s failed to reallocate this->\n",__func__);
			#endif
			return(1);}
			
	if(nextString<1||nextString>CVLARR_STRL_MAX)
		return(1);
	/* memsize - (freespace-strlen) */
	if((this->mem+this->memSize)-this->endOfLastString+nextString<=0){	
		if(obj_cvlarr__resize_mem(this,this->memSize+nextString+1)){
			#ifdef DEBUG
			fprintf(stderr,"ERR %s failed to reallocate this->mem\n",__func__);
			#endif
			return(1);}}
	return(0);}

char*
obj_cvlarr_insert(obj_cvlarr* this, char* string){
	NULL_P_CHECK(this);
	char* retptr=NULL;
	size_t strl=strnlen(string,CVLARR_STRL_MAX);
	if(obj_cvlarr__autoExtend(this,strl))
		return(NULL);

	retptr=(this->endOfLastString+1);
	this->noStrings++;
	*(this->indexArr+this->noStrings)=retptr;
	this->endOfLastString=retptr+1;
	memcpy(retptr,string,strl);
	/* just in case... */
	*this->endOfLastString='\0';
	return(retptr);}


