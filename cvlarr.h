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
	char* endOfLastString;
	size_t memSize;
	
	char** indexArr;
	size_t indexArrSize;
	unsigned int noStrings;
	unsigned int iterPos;
	#ifdef DEBUG
	unsigned int _debug_resizeCount;
	#endif
	}obj_cvlarr;


obj_cvlarr*		OBJF(obj_cvlarr,finalize)(obj_cvlarr* this);
void			OBJF(obj_cvlarr,clean)(obj_cvlarr* this);
void			OBJF(obj_cvlarr,copy)(obj_cvlarr* this, obj_cvlarr* dest);
void		OBJF(obj_cvlarr,print)(obj_cvlarr* this);

char*	obj_cvlarr_getStr(obj_cvlarr* this, unsigned int index);
int		obj_cvlarr__resize_mem(obj_cvlarr* this, unsigned int to);
int		obj_cvlarr__resize_indexArr(obj_cvlarr* this, size_t to);
void	obj_cvlarr_resize(obj_cvlarr* this, size_t charArrSize, unsigned int indexArrSize);
int		obj_cvlarr__autoExtend(obj_cvlarr* this, size_t nextString);
char*	obj_cvlarr_insert(obj_cvlarr* this, char* string);

#endif // _CVLARR_H_
