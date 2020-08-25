#include "encounter.h"

obj_encounter*
TEMPLATE(obj_encounter,finalize)(obj_encounter* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty constructor on %p\n",__func__,(void*)this);
	#endif
	this->encounterName=calloc(SSTRLENG,sizeof(char));
	TEMPLATE3(arr,Finalize,obj_encPlayer)(&this->players);
	return(this);}

void
TEMPLATE(obj_encounter,clean)(obj_encounter* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty destructor on %p\n",__func__,(void*)this);
	#endif
	free(this->encounterName);
	TEMPLATE3(arr,Finalize,obj_encPlayer)(&this->players);
	return;}

void
TEMPLATE(obj_encounter,copy)(obj_encounter* this, obj_encounter* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);
	strncpy(dest->encounterName,this->encounterName,SSTRLENG);
	TEMPLATE3(arr,Copyto,obj_encPlayer)(&this->players,&dest->players);}
	
void
TEMPLATE(obj_encounter,print)(obj_encounter* this){
	NULL_P_CHECK(this);
	fprintf(stderr,"\ndumping obj_encounter %p\n",(void*)this);
	DUMP_STRUCT_string(this,encounterName);
	fprintf(stderr,"\nEND of obj_encounter %p\n",(void*)this);
	TEMPLATE3(arr,dump,obj_encPlayer)(&this->players);}
