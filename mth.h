
#ifndef MTH_H
#define MTH_H

#include "conf.h"

struct vec {int16_t x; int16_t y;};	//simple 2d intiger vector
typedef struct vec vec;



int16_t	vec_angle_between(vec* bgn, vec* end);

vec	vec_from_points(vec* p1, vec* p2);
float	vec_angle(vec* vec_ptr);
vec*	vec_gen_line(vec* bgn, vec* end);

#endif // STATE_H
