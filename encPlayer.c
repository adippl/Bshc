#include "encPlayer.h"


obj_encPlayer*
OBJF(obj_encPlayer,finalize)(obj_encPlayer* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty constructor on %p\n",__func__,(void*)this);
	#endif
	this->playerName=calloc(SSTRLENG,sizeof(char));
	TEMPLATE3(arr,Finalize,obj_ship)(&this->ships);
	return(this);}

void
OBJF(obj_encPlayer,clean)(obj_encPlayer* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty destructor on %p\n",__func__,(void*)this);
	#endif
	free(this->playerName);
	TEMPLATE3(arr,Finalize,obj_ship)(&this->ships);
	return;}

void
OBJF(obj_encPlayer,copy)(obj_encPlayer* this, obj_encPlayer* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);
	strncpy(dest->playerName,this->playerName,SSTRLENG);
	TEMPLATE3(arr,Copyto,obj_ship)(&this->ships,&dest->ships);}
	
void
OBJF(obj_encPlayer,print)(obj_encPlayer* this){
	NULL_P_CHECK(this);
	fprintf(stderr,"\ndumping obj_encPlayer %p\n",(void*)this);
	DUMP_STRUCT_string(this,playerName);
	fprintf(stderr,"\nEND of obj_encPlayer %p\n",(void*)this);
	TEMPLATE3(arr,dump,obj_ship)(&this->ships);}
