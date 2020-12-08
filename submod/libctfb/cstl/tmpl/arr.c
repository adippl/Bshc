#ifdef T
#include "arr.h"

arrStrctT*
TEMPLATE3(arr,Alloc,T)(){
	arrStrctT* p_ret=calloc(1,sizeof(arrStrctT)); 
	
	return(p_ret);}

arrStrctT*
TEMPLATE3(arr,Finalize,T)(arrStrctT* ap_struct){
	NULL_P_CHECK(ap_struct);
	arrStrctT* p_ret=ap_struct; 
	p_ret->objSize=sizeof(arrStrctT);
	p_ret->init=TEMPLATE3(arr,Init,T);
	p_ret->finalize=TEMPLATE3(arr,Finalize,T);
	p_ret->free=TEMPLATE3(arr,Free,T);
	p_ret->copy=TEMPLATE3(arr,Copy,T);
	
	p_ret->objFinalize=NULL;
	p_ret->objCopy=NULL;
	p_ret->objFree=NULL;
	p_ret->objCopy=NULL;
	p_ret->objPrint=NULL;
	
	p_ret->_typeSize=sizeof(T);
	p_ret->allocationSize=ARR_DEF_ALLOCSIZE;
	p_ret->iterIndex=0;
	p_ret->startPosition=0;
	p_ret->capacity=0;
	p_ret->usedCapacity=0;
	
	#ifdef DEBUG
	p_ret->_resizeCounter=0;
	#endif
	
	#ifdef DEBUG
	fprintf(stderr,"!!DEBUG arrStrctT size %ld\n",sizeof(arrStrctT));
	fprintf(stderr,"!!DEBUG _typeSize %ld\n",p_ret->_typeSize);
	fprintf(stderr,"!!DEBUG allocationSize %d\n",p_ret->allocationSize);
	#endif
	
	p_ret->p_array=calloc(ARR_DEF_ALLOCSIZE,sizeof(T));
	return(p_ret);}

arrStrctT*
TEMPLATE3(arr,Init,T)(){
	arrStrctT* p_allocatedMem=TEMPLATE3(arr,Alloc,T)(); 
	if(!p_allocatedMem)return(NULL);

	return(TEMPLATE3(arr,Finalize,T)(p_allocatedMem));}

void
TEMPLATE3(arr,Free,T)(arrStrctT* ap_struct){
	NULL_P_CHECK(ap_struct);
	free(ap_struct->p_array);
	free(ap_struct);
	ap_struct=NULL;
	return;}

arrStrctT*
TEMPLATE3(arr,Copy,T)(arrStrctT* ap_struct){
	NULL_P_CHECK(ap_struct);
	arrStrctT* p_ret=ap_struct->init();
	NULL_P_CHECK(p_ret);
	free(p_ret->p_array);	//very stupid
	memcpy(p_ret,ap_struct,ap_struct->objSize);
	return(p_ret);}


int
TEMPLATE3(arr,_resize,T)(arrStrctT* ap_struct, uint16_t ai_newsize){
	arrStrctT* p_reallocated=NULL;
	uint16_t i_capacityBackup=ap_struct->capacity;
	uint16_t i_capacityDelta=ai_newsize-ap_struct->capacity;
	ap_struct->capacity=ai_newsize;
	#ifdef DEBUG
	fprintf(stderr,"%s _resize relloc\n",__func__);
	fprintf(stderr,"p=%p size=%ld\n",(void*)ap_struct->p_array,ap_struct->capacity*sizeof(T));
	#endif
	if((p_reallocated=realloc(ap_struct->p_array,ap_struct->capacity*sizeof(T)))==NULL){
	//if((p_reallocated=reallocarray(ap_struct->p_array,ap_struct->capacity,ap_struct->_typeSize))==NULL){	// TODO replace realloc with reallocarray
		ap_struct->capacity=i_capacityBackup;
		return(1);}
	memset(ap_struct->p_array+i_capacityBackup,0,sizeof(T)*i_capacityDelta);
	ap_struct->p_array=(T*)p_reallocated;
	
	return(0);}

int
TEMPLATE3(arr,_autoextend,T)(arrStrctT* ap_struct){
	if(TEMPLATE3(arr,_resize,T)(ap_struct,ap_struct->capacity+ap_struct->allocationSize)){
		return(1);}
	ap_struct->_resizeCounter++;
	return(0);}

int
TEMPLATE3(arr,extendBy,T)(arrStrctT* ap_struct, uint16_t ai_addedsize){
	NULL_P_CHECK(ap_struct);
	if(ai_addedsize>=INT16_MAX-ap_struct->capacity)return(2);
	if(TEMPLATE3(arr,_resize,T)(ap_struct,ap_struct->capacity+ai_addedsize)){
		return(1);}
	return(0);}

T*
TEMPLATE3(arr,indexToPtr,T)(arrStrctT* ap_struct,uint16_t ai_index){
	NULL_P_CHECK(ap_struct);
	if(ai_index>=ap_struct->capacity)return(NULL);
	return(ap_struct->p_array+ap_struct->startPosition+ai_index);}


T*
TEMPLATE3(arr,append,T)(arrStrctT* ap_struct){
	NULL_P_CHECK(ap_struct);
	T* ret_ptr=NULL;
	
	if(ap_struct->usedCapacity>=ap_struct->capacity){	//test if full
		if(TEMPLATE3(arr,_autoextend,T)(ap_struct)){
			#ifdef DEBUG
			fprintf(stderr,"%s _autoextend failed",__func__);
			#endif
			return(NULL);}}
	if((ret_ptr=TEMPLATE3(arr,indexToPtr,T)(ap_struct,ap_struct->usedCapacity))==NULL){
		#ifdef DEBUG
		fprintf(stderr,"%s intedToPtr failed,  probably out of bounds",__func__);
		#endif
		return(NULL);}
	ap_struct->usedCapacity++;
	if(ap_struct->objFinalize)
		if(ap_struct->objFinalize(ret_ptr)){
		#ifdef DEBUG
		fprintf(stderr,"%s objInitInPlace failed",__func__);
		#endif
		return(NULL);}
	return(ret_ptr);}

T*
TEMPLATE3(arr,execOnAll,T)(arrStrctT* ap_struct, void* (*p_function)(void* p_obj)){
	NULL_P_CHECK(ap_struct);
	NULL_P_CHECK(p_function);
	T* p_array=ap_struct->p_array+ap_struct->startPosition;
	for(int i=0;i<ap_struct->usedCapacity;i++){
		p_function(p_array+i);		
		}
	return(NULL);}

void
TEMPLATE3(arr,iterResetStart,T)(arrStrctT* ap_struct){
	NULL_P_CHECK(ap_struct);
	ap_struct->iterIndex=0;
	return;}
void
TEMPLATE3(arr,iterResetEnd,T)(arrStrctT* ap_struct){
	NULL_P_CHECK(ap_struct);
	ap_struct->iterIndex=ap_struct->usedCapacity;
	return;}
T*
TEMPLATE3(arr,iterNext,T)(arrStrctT* ap_struct){
	NULL_P_CHECK(ap_struct);
	if(ap_struct->iterIndex>=ap_struct->usedCapacity)return(NULL);
	return(ap_struct->p_array+(ap_struct->iterIndex++)+ap_struct->startPosition);}
T*
TEMPLATE3(arr,iterPrev,T)(arrStrctT* ap_struct){
	NULL_P_CHECK(ap_struct);
	ap_struct->iterIndex--;
	if(ap_struct->iterIndex>=ap_struct->usedCapacity)return(NULL);
	return(ap_struct->p_array+ap_struct->iterIndex+ap_struct->startPosition);}

T*
TEMPLATE3(arr,_getRawPtr,T)(arrStrctT* this){
	NULL_P_CHECK(this);
	return(this->p_array+this->startPosition);}


#ifdef DEBUG
void TEMPLATE3(arr,dump,T)(arrStrctT* ap_struct){
	fprintf(stderr,"\n_typeSize %ld\n",ap_struct->_typeSize);
	fprintf(stderr,"allocationSize %d\n",ap_struct->allocationSize);
	fprintf(stderr,"iterIndex %d\n",ap_struct->iterIndex);
	fprintf(stderr,"capacity %d\n",ap_struct->capacity);
	fprintf(stderr,"usedCapacity %d\n",ap_struct->usedCapacity);
	fprintf(stderr,"_resizeCounter %d\n",ap_struct->_resizeCounter);
	
	if(ap_struct->objPrint){
		for(int i=0;i<ap_struct->capacity;i++){
			ap_struct->objPrint((void*)TEMPLATE3(arr,indexToPtr,T)(ap_struct,i));}}
	return;}
#endif

#endif
