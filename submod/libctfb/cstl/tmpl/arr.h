#ifdef T
#include "tmpl.h"

#ifdef DEBUG
#include <stdio.h>
#endif

#ifndef _ARR_GENERIC_
#define _ARR_GENERIC_

#endif

#ifdef arrStrctT
#undef arrStrctT
#endif
#define arrStrctT TEMPLATE3(arr,arrStrct,T)

typedef struct arrStrctT arrStrctT;

struct arrStrctT{
	//stright include draft
	//#ifdef T
	//#undef T
	//#endif
	//#define T arrStrctT
	//#include "obj.h"
	//#undef T
	
	arrStrctT* (*init)();
	arrStrctT* (*finalize)();
	void (*free)(struct arrStrctT* p_struct);
	arrStrctT* (*copy)(arrStrctT* p_struct);
	arrStrctT* (*copyDeep)(arrStrctT* p_struct);
	size_t objSize;
	uint16_t objName;
	
	//void* p_Class; //potential idea
	//if function pointers are set to NULL objects are treated as simple types, memcpy, free, and calloc will be used
	void* (*objFinalize)(void* p_obj);
	void* (*objFree)(void* p_obj);
	void* (*objCopy)(void* p_obj);
	//void* (*objCopyDeep)(struct void* p_obj); //inea
	void* (*objPrint)(void* p_obj);
	
	//uint8_t	growthMethod; /* ==1 lineraly, >2 exponential */ //planned feature
	size_t _typeSize;
	uint16_t allocationSize;	/* size of memory added duuring automatic extend */
	
	uint16_t iterIndex;
	uint16_t startPosition;	/* memory can be reserver to push objects in front of the array quickly*/
	uint16_t capacity;
	int16_t usedCapacity;
	#ifdef DEBUG
	uint16_t _resizeCounter;
	#endif
	T* p_array;
	};

arrStrctT*	TEMPLATE3(arr,Alloc,T)();
arrStrctT*	TEMPLATE3(arr,Finalize,T)(arrStrctT* ap_struct);
arrStrctT*	TEMPLATE3(arr,Init,T)();
arrStrctT*	TEMPLATE3(arr,Copy,T)(arrStrctT* ap_struct);
void	TEMPLATE3(arr,Free,T)(arrStrctT* ap_struct);

int		TEMPLATE3(arr,_resize,T)(arrStrctT* ap_struct, uint16_t ai_newsize);
int		TEMPLATE3(arr,_autoextend,T)(arrStrctT* ap_struct);
int		TEMPLATE3(arr,extendBy,T)(arrStrctT* ap_struct, uint16_t ai_addedsize);
T*		TEMPLATE3(arr,indexToPtr,T)(arrStrctT* ap_struct,uint16_t ai_index);
T*		TEMPLATE3(arr,append,T)(arrStrctT* ap_struct);
T*		TEMPLATE3(arr,execOnAll,T)(arrStrctT* ap_struct, void* (*p_function)(void* p_obj));

void	TEMPLATE3(arr,iterResetStart,T)(arrStrctT* ap_struct);	/* just for completeness sake */
void	TEMPLATE3(arr,iterResetEnd,T)(arrStrctT* ap_struct);	/* changes iterIndex to end position*/
T*		TEMPLATE3(arr,iterNext,T)(arrStrctT* ap_struct);
T*		TEMPLATE3(arr,iterPrev,T)(arrStrctT* ap_struct);
	
T*	TEMPLATE3(arr,_getRawPtr,T)(arrStrctT* this);

#ifdef DEBUG
void TEMPLATE3(arr,dump,T)(arrStrctT* ap_struct);
#endif

#endif
