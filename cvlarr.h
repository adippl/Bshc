#ifndef _CVLARR_H_
#define _CVLARR_H_

#include "conf.h"

#ifndef CVLARR_DEF_ALLOC_SIZE
	#define CVLARR_DEF_ALLOC_SIZE 64
	#endif // CVLARR_DEF_ALLOC_SIZE 

#ifndef CVLARR_DEF_SIZE
	#define CVLARR_DEF_SIZE 10
	#endif // CVLARR_DEF_SIZE

//#ifndef CVLARR_DEF_SIZE
//	#define CVLARR_DEF_SIZE 64
//	#endif // CVLARR_DEF_SIZE

typedef struct cvlarr{
	char* mem;
	size_t memSize;
	
	int* indexArr;
	size_t indexArrSize;
	int noStrings;
	int iterPos;
	#ifdef DEBUG
	int _debug_resizeCount;
	#endif
	}obj_cvlarr;


obj_cvlarr*		OBJF(obj_cvlarr,finalize)(obj_cvlarr* this);
void			OBJF(obj_cvlarr,clean)(obj_cvlarr* this);
void			OBJF(obj_cvlarr,copy)(obj_cvlarr* this, obj_cvlarr* dest);
void		OBJF(obj_cvlarr,print)(obj_cvlarr* this);


#endif // _CVLARR_H_
