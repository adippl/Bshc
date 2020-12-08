#ifdef T
#include "arr.h"

arrStrctT*
TEMPLATE3(arr,Finalize,T)(arrStrctT* this){
	NULL_P_CHECK(this);
	arrStrctT* p_ret=this; 
	p_ret->objSize=sizeof(arrStrctT);
	//p_ret->init=TEMPLATE3(arr,Init,T);
	p_ret->finalize=TEMPLATE3(arr,Finalize,T);
	//p_ret->free=TEMPLATE3(arr,Free,T);
	//p_ret->copy=TEMPLATE3(arr,Copyto,T);
	p_ret->copy=NULL;
	#ifdef CTFB_INIT_WITH_FUNCTIONS
	#endif
	
	p_ret->_typeSize=sizeof(T);
	p_ret->allocationSize=ARR_DEF_ALLOCSIZE;

	p_ret->capacity=0;
	p_ret->mem=NULL;
	p_ret->start=NULL;
	p_ret->end=NULL;
	p_ret->iter=NULL;
	
	#ifdef DEBUG
	p_ret->_resizeCounter=0;
	#endif
	
	#ifdef DEBUG
	fprintf(stderr,"!!DEBUG arrStrctT size %ld\n",sizeof(arrStrctT));
	fprintf(stderr,"!!DEBUG _typeSize %ld\n",p_ret->_typeSize);
	fprintf(stderr,"!!DEBUG allocationSize %d\n",p_ret->allocationSize);
	#endif
	
	p_ret->mem=calloc(ARR_DEF_ALLOCSIZE,sizeof(T));
	p_ret->start=this->mem;
	p_ret->end=this->mem;
	p_ret->end=this->mem;
	p_ret->iter=this->mem;
	return(p_ret);}

arrStrctT*
TEMPLATE3(arr,Init,T)(){
	arrStrctT* p_allocatedMem=calloc(1,sizeof(arrStrctT)); 
	if(!p_allocatedMem)return(NULL);

	return(TEMPLATE3(arr,Finalize,T)(p_allocatedMem));}

arrStrctT*
TEMPLATE3(arr,Copyto,T)(arrStrctT* this, arrStrctT* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);

	/*
	 * old version, doesn't resize before copying	
	 * T* p_tmp=NULL;
	 * TEMPLATE3(arr,iterResetStart,T)(this);
	 * while((p_tmp=TEMPLATE3(arr,iterNext,T)(this))){
	 * 	printf("DEBUG COPY %p\n",(void*)p_tmp);
	 * 	OBJF(T,copy)(p_tmp,TEMPLATE3(arr,append,T)(dest));}
	 */

	TEMPLATE3(arr,_resize,T)(dest,this->capacity);
	T *obj_src=NULL, *obj_dest=NULL;
	TEMPLATE3(arr,iterResetStart,T)(this);
	TEMPLATE3(arr,iterResetStart,T)(dest);
	while((obj_src=TEMPLATE3(arr,iterNext,T)(this))){
		if((obj_dest=TEMPLATE3(arr,iterNext,T)(dest)))
		OBJF(T,copy)(obj_src,obj_dest);}
	return(NULL);}

arrStrctT*
TEMPLATE3(arr,Copyto_memcpy,T)(arrStrctT* this, arrStrctT* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);
	TEMPLATE3(arr,_resize,T)(dest,this->capacity);
	dest->_typeSize=this->_typeSize;
	dest->allocationSize=this->allocationSize;
	dest->capacity=this->capacity;
	memcpy(dest->mem,this->mem,this->capacity*sizeof(T));
	dest->start= this->start - this->mem+dest->mem;
	dest->end= this->end - this->mem+dest->mem;
	return(NULL);}

void
TEMPLATE3(arr,Free,T)(arrStrctT* this){
	NULL_P_CHECK(this);
	TEMPLATE3(arr,Clean,T)(this);
	free(this);
	return;}

void*
TEMPLATE3(arr,Clean,T)(arrStrctT* this){
	NULL_P_CHECK(this);
	
	T* p_obj=NULL;
	TEMPLATE3(arr,iterResetStart,T)(this);
	while((p_obj=TEMPLATE3(arr,iterNext,T)(this))){
		OBJF(T,clean)(p_obj);
		#ifdef DEBUG
		printf("cleaning obj at %p\n",(void*)p_obj);
		#endif
		}
	free(this->mem);
	#ifdef DEBUG
	this->_typeSize=0;
	this->allocationSize=0;
	#endif
	return(NULL);}

int
TEMPLATE3(arr,_resize,T)(arrStrctT* this, size_t ai_newsize){
	#ifdef DEBUG
	fprintf(stderr,"%s _resize relloc\n",__func__);
	fprintf(stderr,"p=%p size=%ld\n",(void*)this->mem,ai_newsize*sizeof(T));
	#endif
	if(this->capacity>=ai_newsize){
		#ifdef DEBUG
		fprintf(stderr,"%s resize arg >= than current size, returning without operations\n",__func__);
		#endif
		return(0);}
	
	T* p_reallocated=NULL;
	size_t i_capacityBackup=this->capacity;
	size_t i_capacityDelta=ai_newsize-this->capacity;
	size_t startoffset=this->start-this->mem;

	this->capacity=ai_newsize;
	if((p_reallocated=realloc(this->mem,ai_newsize*sizeof(T)))==NULL){
		this->capacity=i_capacityBackup;
		return(1);}
	memset(p_reallocated+i_capacityBackup,0,sizeof(T)*i_capacityDelta);
	this->mem=p_reallocated;
	this->start=this->mem+startoffset;
	//this->end=this->start+this->usedCapacity;
	
	return(0);}

int
TEMPLATE3(arr,_autoextend,T)(arrStrctT* this){
	if(TEMPLATE3(arr,_resize,T)(this,this->capacity+this->allocationSize)){
		return(1);}
	this->_resizeCounter++;
	return(0);}

int
TEMPLATE3(arr,extendBy,T)(arrStrctT* this, size_t ai_addedsize){
	NULL_P_CHECK(this);
	if(ai_addedsize>=INT16_MAX-this->capacity)return(2);
	if(TEMPLATE3(arr,_resize,T)(this,this->capacity+ai_addedsize)){
		return(1);}
	return(0);}

T*
TEMPLATE3(arr,indexToPtr,T)(arrStrctT* this, size_t ai_index){
	NULL_P_CHECK(this);
	if(ai_index>=this->capacity)return(NULL);
	return(this->start+ai_index);}


T*
TEMPLATE3(arr,append,T)(arrStrctT* this){
	NULL_P_CHECK(this);
	T* ret_ptr=NULL;
	size_t usedCap=this->end-this->start;
	
	if(usedCap>=this->capacity){	//test if full
		if(TEMPLATE3(arr,_autoextend,T)(this)){
			#ifdef DEBUG
			fprintf(stderr,"%s _autoextend failed",__func__);
			#endif
			return(NULL);}}
	if((ret_ptr=TEMPLATE3(arr,indexToPtr,T)(this,usedCap))==NULL){
		#ifdef DEBUG
		fprintf(stderr,"%s intedToPtr failed,  probably out of bounds" \
			,__func__);
		#endif
		return(NULL);}
	this->end++;
	if(!OBJF(T,finalize)(ret_ptr)){
	#ifdef DEBUG
	fprintf(stderr,"%s OBJF(T,finalize) failed\n",__func__);
	#endif
	return(NULL);}
	return(ret_ptr);}

T*
TEMPLATE3(arr,execOnAll,T)(arrStrctT* this, void* (*p_function)(void* p_obj)){
	NULL_P_CHECK(this);
	NULL_P_CHECK(p_function);
	for(T* mem=this->start;mem<this->end;mem++){
		p_function(mem);		
		}
	return(NULL);}

void
TEMPLATE3(arr,iterResetStart,T)(arrStrctT* this){
	NULL_P_CHECK(this);
	this->iter=this->start;
	return;}
void
TEMPLATE3(arr,iterResetEnd,T)(arrStrctT* this){
	NULL_P_CHECK(this);
	this->iter=this->end;
	return;}
T*
TEMPLATE3(arr,iterNext,T)(arrStrctT* this){
	NULL_P_CHECK(this);
	if(this->iter>=this->end)return(NULL);
	return(this->iter++);}
T*
TEMPLATE3(arr,iterPrev,T)(arrStrctT* this){
	NULL_P_CHECK(this);
	this->iter--;
	if(this->iter<=this->start)return(NULL);
	return(this->iter);}

T*
TEMPLATE3(arr,_getRawPtr,T)(arrStrctT* this){
	NULL_P_CHECK(this);
	return(this->start);}


#ifdef DEBUG
void TEMPLATE3(arr,dump,T)(arrStrctT* this){
	fprintf(stderr,"\n_typeSize %ld\n",this->_typeSize);
	fprintf(stderr,"allocationSize %d\n",this->allocationSize);
	fprintf(stderr,"capacity %ld\n",this->capacity);
	fprintf(stderr,"usedCapacity %ld (computed)\n",(this->end-this->start)/sizeof(T));
	fprintf(stderr,"_resizeCounter %d\n",this->_resizeCounter);
	
	fprintf(stderr,"mem %p\n",(void*)this->mem);
	fprintf(stderr,"start %p\n",(void*)this->start);
	fprintf(stderr,"end %p\n",(void*)this->end);
	fprintf(stderr,"iter %p\n",(void*)this->iter);

	
	for(size_t i=0;i<this->capacity;i++){
		OBJF(T,print)(TEMPLATE3(arr,indexToPtr,T)(this,i));}
	return;}
#endif

#endif
