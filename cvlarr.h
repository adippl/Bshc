#ifndef _CVLARR_H_
#define _CVLARR_H_

#include "conf.h"

#ifndef CVLARR_DEF_ALLOC_SIZE
	#define CVLARR_DEF_ALLOC_SIZE 128
	#endif 

#ifndef CVLARR_DEF_SIZE
	#define CVLARR_DEF_SIZE 10
	#endif

#ifndef CVLARR_DEF_SIZE
	#define CVLARR_DEF_SIZE 10
	#endif

#ifndef CVLARR_STRL_MAX
	#define CVLARR_STRL_MAX 512
	#endif

typedef struct cvlarr{
	char* mem;
	size_t endOfLastString;
	size_t memSize;
	
	size_t* indexArr;
	size_t indexArrSize;
	unsigned int noStrings;
	unsigned int iterPos;
	#ifdef DEBUG
	unsigned int _debug_resizeCount;
	#endif
	}obj_cvlarr;


obj_cvlarr*		OBF(cvlarr,finalize)(obj_cvlarr* this);
void			OBF(cvlarr,clean)(obj_cvlarr* this);
void			OBF(cvlarr,copy)(obj_cvlarr* this, obj_cvlarr* dest);
void			OBF(cvlarr,print)(obj_cvlarr* this);

char*	obj_cvlarr_getStr(obj_cvlarr* this, unsigned int index);
int		obj_cvlarr_resize(obj_cvlarr* this, size_t charArrSize, size_t indexArrSize);
char*	obj_cvlarr_insert(obj_cvlarr* this, char* string);

#endif // _CVLARR_H_
