#include "conf.h"
#include "mth.h"

int16_t
vec_angle_between(vec* bgn, vec* end){

	float dx=end->x - bgn->x;
	float dy=end->y - bgn->y;
	
	int16_t ret_var=(int16_t)tanf(dy/dx);
	
	return(ret_var);
}



vec
vec_from_points(vec* p1, vec* p2){
	vec ret_v={.x=p2->x-p1->x,.y=p2->y-p1->y};
	return(ret_v);
}
float
vec_angle(vec* vec_p){
	float ret_val=0;
	int dx=0;
	int dy=0;
	int8_t quater=0;

	dx=vec_p->x;
	dy=vec_p->y;

	if((vec_p->x==0)||(vec_p->y==0)){
		     if((vec_p->x==0) && (vec_p->y==0))	{return(0);}
		else if((vec_p->x==0) && (vec_p->y>0))	{return(0);}
		else if((vec_p->x>0)  && (vec_p->y==0))	{return(M_PI_2);}
		else if((vec_p->x==0) && (vec_p->y<0))	{return(M_PI);}
		else if((vec_p->x>0)  && (vec_p->y==0))	{return(M_PI_2*3);}
	}

	     if((vec_p->x>=0)&(vec_p->y>=0))	{ quater=0; }
	else if((vec_p->x>=0)&(vec_p->y<=0))	{ quater=1; }
	else if((vec_p->x<=0)&(vec_p->y<=0))	{ quater=2; }
	else if((vec_p->x<=0)&(vec_p->y>=0))	{ quater=3; }

	ret_val=atanf(dy/dx);

	switch(quater){
		case 1:
			ret_val=ret_val+M_PI;
			break;
		case 2:
			ret_val=ret_val+M_PI;
			break;
		case 3:
			ret_val=ret_val+M_PI*2;
			break;
	}


	return(ret_val);
}

//vec* 
//vec_gen_line(vec* bgn, vec* end){
//	vec vec=vec_from_points(bgn, end);
//	int16_t asize=0;	//size of returned array
//
//	if    (vec.x==vec.y)		asize=vec.x;
//	else if(vec.x>vec.y)	asize=vec.x;
//	else if(vec.x<vec.y)	asize=vec.y;
//
//	struct vec* vec_a=malloc(sizeof(vec)*asize);
//	if(!vec_a)return(NULL);
//	struct vec (*vec_c)[asize]=(void*)vec_a;
//
//
//	return(NULL);
//}

