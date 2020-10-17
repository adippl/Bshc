#ifndef _GENERIC_TYPES_H_
#define _GENERIC_TYPES_H_

#include "conf.h"



int* OBJF(int,finalize)(int* this);
void OBJF(int,clean)(int* this);
void OBJF(int,copy)(int* this, int* dest);
void OBJF(int,print)(int* this);

#endif // _GENERIC_TYPES_H_

