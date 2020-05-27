#include "conf.h"

const int FSIZE_X=161,FSIZE_Y=60;
const int SIZE_X=80,SIZE_Y=24;
const int SIZE_Y_CORRECTION=7;

const int SH3L=3,SH4L=4,SH5L=5;
const int MAX_NSH3=3,MAX_NSH4=2,MAX_NSH5=1;

const char DPLYCOL[4]={31,32,33,34};

const char SPREAD_DEF=1;
const char SH3_NOSH=2,SH4_NOSH=3,SH5_NOSH=4;



void
objFree(void* p_obj){	//generic destructor
	NULL_P_CHECK(p_obj);
	free(p_obj);
	p_obj=NULL;
	return;}
