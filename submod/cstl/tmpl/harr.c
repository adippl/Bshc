#ifdef T
#include "harr.h"

Tstrct*
TEMPLATE3(harr,Init,T)(){
	//Tstrct* p_ret=calloc(1,sizeof(T)); 
	Tstrct* p_ret=calloc(1,sizeof(Tstrct)); 
	NULL_P_CHECK(p_ret);
	p_ret->objSize=sizeof(Tstrct);
	p_ret->init=TEMPLATE3(harr,Init,T);
	p_ret->free=TEMPLATE3(harr,Free,T);
	p_ret->copy=TEMPLATE3(harr,Copy,T);
	
	p_ret->objCopy=NULL;
	//p_ret->objCopyDeep=NULL;
	p_ret->objPrint=NULL;

	/* initiazlizing variables */
	//p_ret->growthMethod=1; 
	p_ret->typeSize=sizeof(T);
	p_ret->disableListAppending=0;
	p_ret->allocationSize=HARR_DEF_ALLOCSIZE;
	p_ret->iterIndex=-1;
	p_ret->writeIndex=-1;
	//p_ret->p_itr=NULL;
	//p_ret->p_witr=NULL;
	p_ret->capacity=0;
	p_ret->usedCapacity=0;
	p_ret->tableCapacity=0;
	p_ret->tableUsedCapacity=0;

	p_ret->tableOfMemSegmentInfo=calloc(HARR_DEF_MAPALLOCSIZE,sizeof(harrMapStrct));


	p_ret->_tableResizeCounter=0;
	p_ret->_tableMapResizeCounter=0;

	#ifdef DEBUG
	printf("!!DEBUG Tstrct size %ld\n",sizeof(Tstrct));
	printf("!!DEBUG typeSize %ld\n",p_ret->typeSize);
	printf("!!DEBUG allocationSize %d\n",p_ret->allocationSize);
	#endif
	
	/* TEMPLATE3(harr,extend,T)(p_ret); */

	return(p_ret);}

void
TEMPLATE3(harr,Free,T)(Tstrct** pp_struct){
	NULL_P_CHECK(*pp_struct);
	free(*pp_struct);
	*pp_struct=NULL;
	return;}

Tstrct*
TEMPLATE3(harr,Copy,T)(Tstrct* p_struct){
	NULL_P_CHECK(p_struct);
	Tstrct* p_ret=p_struct->init();
	NULL_P_CHECK(p_ret);
	memcpy(p_ret,p_struct,p_struct->objSize);
	return(p_ret);}

int
TEMPLATE3(harr,extendMap,T)(Tstrct* ap_struct){ /* generic TODO */
		NULL_P_CHECK(ap_struct);
		ap_struct->tableCapacity+=HARR_DEF_MAPALLOCSIZE;
		
		harrMapStrct* p_newinfmap=NULL;
		#ifdef DEBUG
		fprintf(stderr,"!!DEBUG extendMap realloc(%p,%ld(%ld*%d)\n",(void* )ap_struct->tableOfMemSegmentInfo,sizeof(harrMapStrct)*ap_struct->tableCapacity,sizeof(harrMapStrct),ap_struct->tableCapacity);
		#endif
		p_newinfmap=realloc(ap_struct->tableOfMemSegmentInfo,sizeof(harrMapStrct)*ap_struct->tableCapacity);

		#ifdef DEBUG
		fprintf(stderr,"\n!!DEBUG realloc returned pointer %p\n",(void*)p_newinfmap);
		#endif
		if(!p_newinfmap)return(1);
		ap_struct->tableOfMemSegmentInfo=p_newinfmap;
	
		ap_struct->_tableMapResizeCounter++;
		return(0);}

int
TEMPLATE3(harr,extend,T)(Tstrct* ap_struct){
	NULL_P_CHECK(ap_struct);
	if(ap_struct->tableCapacity<=(ap_struct->tableUsedCapacity+1))
		if(TEMPLATE3(harr,extendMap,T)(ap_struct))return(1);
		
	ap_struct->tableUsedCapacity++;
	harrMapStrct* p_tempStruct=ap_struct->tableOfMemSegmentInfo+ap_struct->tableUsedCapacity-1; //-1 starts from 0
	
	#ifdef DEBUG
	fprintf(stderr,"!!DEBUG extend calloc %d %ld\n",ap_struct->allocationSize,sizeof(T));
	#endif
	p_tempStruct->seg=calloc(ap_struct->allocationSize,sizeof(T));
	ap_struct->capacity+=ap_struct->allocationSize;

	p_tempStruct->segSize=ap_struct->allocationSize;
	p_tempStruct->segContent=0;
	p_tempStruct->segStartingIndex=-1;

	TEMPLATE3(harr,updateIndexAll,T)(ap_struct); /*temp, to be replace with simple updateIndex*/
	
	
	ap_struct->_tableResizeCounter++;
	return(0);}

/*
int
TEMPLATE3(harr,updateIndex,T)(Tstrct* ap_struct, uint16_t index, uint16_t* ap_prevIndex){
	//for(int i=0;i<ap_struct->tableUsedCapacity){
	//	}
	int i_ret=0;

	NULL_P_CHECK(ap_prevIndex);
	if(index<0)return(-1);

	(ap_struct->tableOfMemSegmentInfo+index)->segStartingIndex=*ap_prevIndex+1;
	*ap_prevIndex=(ap_struct->tableOfMemSegmentInfo+index)->segContent+*ap_prevIndex;
		
	return(i_ret);}
*/

int
TEMPLATE3(harr,updateIndexAll,T)(Tstrct* ap_struct){
	NULL_P_CHECK(ap_struct);
	int i_ret=0;
	int i_lastIndex=-1;
	harrMapStrct* p_curSegment=NULL;

	ap_struct->tableOfMemSegmentInfo->segStartingIndex=0;
	for(int i=0;i<ap_struct->tableUsedCapacity;i++){
		p_curSegment=ap_struct->tableOfMemSegmentInfo+i;
		if(p_curSegment->segContent==0){
			p_curSegment->segStartingIndex=-1;}
		else{
			(ap_struct->tableOfMemSegmentInfo+i)->segStartingIndex=i_lastIndex+1;
			i_lastIndex=(ap_struct->tableOfMemSegmentInfo+i)->segContent+i_lastIndex;}}
	ap_struct->tableOfMemSegmentInfo->segStartingIndex=0;
		
	return(i_ret);}


T*
TEMPLATE3(harr,getPtrToIndex,T)(Tstrct* ap_struct, uint16_t index, int_fast8_t mode){
	//int biggestIndexFound=0;
	harrMapStrct* p_currentSegment=NULL;
	if(index>=ap_struct->usedCapacity){
		if(mode==0)return(NULL); /*out of bounds*/
		if(mode==1&&ap_struct->usedCapacity>=ap_struct->capacity){
			TEMPLATE3(harr,extend,T)(ap_struct);}}

	for(int i=0;i<ap_struct->tableUsedCapacity;i++){
		p_currentSegment=(ap_struct->tableOfMemSegmentInfo+i);
		if(p_currentSegment->segStartingIndex==index)
			return(p_currentSegment->seg);	/* lucky hit */
		if(p_currentSegment->segStartingIndex>index){
			if(p_currentSegment->segStartingIndex+p_currentSegment->segContent<=index){
				int i_calculatedIndex=index-p_currentSegment->segStartingIndex; /* unsure */
				return(p_currentSegment->seg+i_calculatedIndex);}}}
	return(NULL);}

T*
TEMPLATE3(harr,iterNext,T)(Tstrct* ap_struct){
	T* p_ret=NULL;
	NULL_P_CHECK(ap_struct);
	if((++(ap_struct->iterIndex))>ap_struct->usedCapacity){
		ap_struct->iterIndex--;
		return(NULL);}
	p_ret=TEMPLATE3(harr,getPtrToIndex,T)(ap_struct, ap_struct->iterIndex,0);
	//ap_struct->p_itr=p_ret;
	/*
	if(!p_ret)return(NULL);
	*/
	return(p_ret);}

T*
TEMPLATE3(harr,append,T)(Tstrct* ap_struct){
	NULL_P_CHECK(ap_struct);
	T* p_ret=NULL;
	harrMapStrct* p_currentSegment=NULL;
	uint16_t index=ap_struct->usedCapacity;

	if(index>=ap_struct->usedCapacity){
		if(ap_struct->usedCapacity>=ap_struct->capacity)
			TEMPLATE3(harr,extend,T)(ap_struct);}

	for(int i=0;i<ap_struct->tableUsedCapacity;i++){
		p_currentSegment=(ap_struct->tableOfMemSegmentInfo+i);
		if(p_currentSegment->segStartingIndex==index){	/* lucky hit */
			p_ret=p_currentSegment->seg;
			break;}
		if(p_currentSegment->segStartingIndex>index){
			if(p_currentSegment->segStartingIndex+p_currentSegment->segContent<=index){
				int i_calculatedIndex=index-p_currentSegment->segStartingIndex; /* unsure */
				p_ret=p_currentSegment->seg+i_calculatedIndex;
				break;}}}
	p_currentSegment->segContent++;
	ap_struct->usedCapacity++;
	return(p_ret);}

#ifdef DEBUG
void
TEMPLATE3(harr,dump,T)(Tstrct* ap_struct){
	harrMapStrct* p_currentSegment=NULL;
	fprintf(stderr,"typeSize %ld\n",ap_struct->typeSize);
	fprintf(stderr,"disableListAppending %d\n",ap_struct->disableListAppending);
	fprintf(stderr,"allocationSize %d\n",ap_struct->allocationSize);
	//fprintf(stderr,"p_itr %d\n",ap_struct->p_itr);
	fprintf(stderr,"capacity %d\n",ap_struct->capacity);
	fprintf(stderr,"usedCapacity %d\n",ap_struct->usedCapacity);
	fprintf(stderr,"tableCapacity %d\n",ap_struct->tableCapacity);
	fprintf(stderr,"tableUsedCapacity %d\n",ap_struct->tableUsedCapacity);
	fprintf(stderr,"_tableResizeCounter %d\n",ap_struct->_tableResizeCounter);
	fprintf(stderr,"_tableMapResizeCounter %d\n",ap_struct->_tableMapResizeCounter);
	for(int i=0;i<ap_struct->tableCapacity;i++){
		p_currentSegment=(ap_struct->tableOfMemSegmentInfo+i);
		printf("mapsegment %p\n",(void*)p_currentSegment);
		printf("\tsegsize %d\n",p_currentSegment->segSize);
		printf("\tsegContent %d\n",p_currentSegment->segContent);
		printf("\tsegStartingIndex %d\n",p_currentSegment->segStartingIndex);
		printf("\tseg %p\n",(void*)p_currentSegment->seg);
		}
	}
#endif


/*
T* 
TEMPLATE3(harr,IterReset,T)(Tstrct* ap_struct){
	return(NULL);}
T* 
TEMPLATE3(harr,IterGet,T)(Tstrct* ap_struct){
	return(NULL);}

int8_t	TEMPLATE3(harr,insEnd,T)(T arg){}
*/

#endif
