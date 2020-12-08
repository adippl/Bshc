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
	
	arrStrctT* (*init)();
	arrStrctT* (*finalize)();
	void (*free)(arrStrctT* this);
	void (*clean)(arrStrctT* this);
	arrStrctT* (*copy)(arrStrctT* this);
	arrStrctT* (*copyTo)(arrStrctT* this);
	size_t objSize;
	uint16_t objName;
	
	//uint8_t	growthMethod; /* ==1 lineraly, >2 exponential */ //planned feature
	size_t _typeSize;
	uint16_t allocationSize;	/* size of memory added duuring automatic extend */
	
	size_t capacity;
	T* mem;
	T* start;
	T* end;
	T* iter;

	#ifdef DEBUG
	uint16_t _resizeCounter;
	#endif
	};

arrStrctT*	TEMPLATE3(arr,Finalize,T)(arrStrctT* this);
arrStrctT*	TEMPLATE3(arr,Init,T)();
arrStrctT*	TEMPLATE3(arr,Copyto,T)(arrStrctT* this, arrStrctT* dest);
arrStrctT*	TEMPLATE3(arr,Copyto_memcpy,T)(arrStrctT* this, arrStrctT* dest);
void	TEMPLATE3(arr,Free,T)(arrStrctT* this);
void*	TEMPLATE3(arr,Clean,T)(arrStrctT* this);

int		TEMPLATE3(arr,_resize,T)(arrStrctT* this, size_t ai_newsize);
int		TEMPLATE3(arr,_autoextend,T)(arrStrctT* this);
int		TEMPLATE3(arr,extendBy,T)(arrStrctT* this, size_t ai_addedsize);
T*		TEMPLATE3(arr,indexToPtr,T)(arrStrctT* this, size_t ai_index);
T*		TEMPLATE3(arr,append,T)(arrStrctT* this);
T*		TEMPLATE3(arr,execOnAll,T)(arrStrctT* this, void* (*p_function)(void* p_obj));

void	TEMPLATE3(arr,iterResetStart,T)(arrStrctT* this);	/* just for completeness sake */
void	TEMPLATE3(arr,iterResetEnd,T)(arrStrctT* this);	/* changes iterIndex to end position*/
T*		TEMPLATE3(arr,iterNext,T)(arrStrctT* this);
T*		TEMPLATE3(arr,iterPrev,T)(arrStrctT* this);
	
T*	TEMPLATE3(arr,_getRawPtr,T)(arrStrctT* this);

#ifdef DEBUG
void TEMPLATE3(arr,dump,T)(arrStrctT* this);
#endif

#endif
