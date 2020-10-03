#ifndef _VEC2INT64_H
#define _VEC2INT64_H

#include "conf.h" 

typedef struct vec2int64 vec2ll; 
struct vec2int64{
	 int64_t x;
	 int64_t y;
	 };



void vec2llSum(vec2ll* a, vec2ll* b);

#endif /* _VEC2DOUBLE_H */
