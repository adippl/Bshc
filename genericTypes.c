#include "genericTypes.h"


int*
OBJF(int,finalize)(int* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty constructor on %p\n",__func__,(void*)this);
	#endif
	return(this);}

void
OBJF(int,clean)(int* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty destructor on %p\n",__func__,(void*)this);
	#endif
	}

void
OBJF(int,copy)(int* this, int* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);
	*dest=*this;}
	
void
OBJF(int,print)(int* this){
	NULL_P_CHECK(this);
	fprintf(stderr,"\ndumping int %p\n",(void*)this);
	printf("int= %d/n",*this);
	fprintf(stderr,"\nEND of int %p\n",(void*)this);}
