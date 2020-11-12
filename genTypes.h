#ifndef _GEN_TYPES_H_
#define _GEN_TYPES_H_

#include "conf.h"



int* OBJF(int,finalize)(int* this);
void OBJF(int,clean)(int* this);
void OBJF(int,copy)(int* this, int* dest);
void OBJF(int,print)(int* this);

#endif // _GEN_TYPES_H_

