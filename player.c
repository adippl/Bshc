#include "player.h"


obj_player*
OBJF(obj_player,finalize)(obj_player* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty constructor on %p\n",__func__,(void*)this);
	#endif
	this->playerId=-1;
	this->playerName=calloc(SSTRLENG,sizeof(char));
	TEMPLATE3(arr,Finalize,obj_ship)(&this->ships);
	TEMPLATE3(arr,Finalize,int)(&this->shipIDs);
	return(this);}

void
OBJF(obj_player,clean)(obj_player* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty destructor on %p\n",__func__,(void*)this);
	#endif
	free(this->playerName);
	TEMPLATE3(arr,Finalize,obj_ship)(&this->ships);
	TEMPLATE3(arr,Finalize,int)(&this->shipIDs);}

void
OBJF(obj_player,copy)(obj_player* this, obj_player* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);
	strncpy(dest->playerName,this->playerName,SSTRLENG);
	TEMPLATE3(arr,Copyto,obj_ship)(&this->ships,&dest->ships);
	TEMPLATE3(arr,Copyto_memcpy,int)(&this->shipIDs,&dest->shipIDs);}
	
void
OBJF(obj_player,print)(obj_player* this){
	NULL_P_CHECK(this);
	fprintf(stderr,"\ndumping obj_player %p\n",(void*)this);
	DUMP_STRUCT_string(this,playerName);
	fprintf(stderr,"\nEND of obj_player %p\n",(void*)this);
	TEMPLATE3(arr,dump,obj_ship)(&this->ships);
	TEMPLATE3(arr,dump,int)(&this->shipIDs);}
