#include "mapChunk.h"

void*
TEMPLATE(mapTile,print)(void* this){
		fprintf(stderr,"\t mapTile %p points to ship %p (name %s) \n",
			(void*)this,
			(void*)(((struct mapTile*)this)->ship),
			((struct mapTile*)this)->ship->sname);
		return(NULL);}


obj_mapChunk*
TEMPLATE(obj_mapChunk,finalize)(obj_mapChunk* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty constructor on %p\n",__func__,(void*)this);
	#endif
	return(this);}

//void
//TEMPLATE(obj_mapChunk,free)(obj_mapChunk* this){
//	NULL_P_CHECK(this);
//	#ifdef DEBUG
//		fprintf(stderr,"DEBUG %s calling empty destructor on %p\n",__func__,(void*)this);
//	#endif
//	return;}

void
TEMPLATE(obj_mapChunk,clean)(obj_mapChunk* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty destructor on %p\n",__func__,(void*)this);
	#endif
	return;}

obj_mapChunk*
TEMPLATE(obj_mapChunk,copyTo)(obj_mapChunk* this,obj_mapChunk* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);
	memcpy(dest,this,sizeof(obj_mapChunk));

	return(dest);}

void*
TEMPLATE(obj_mapChunk,print)(void* ap_obj){
	NULL_P_CHECK(ap_obj);
	obj_mapChunk* this=(obj_mapChunk*) ap_obj;
	fprintf(stderr,"\ndumping obj_mapChunk %p\n",(void*)this);
	DUMP_STRUCT_int(this,posx);
	DUMP_STRUCT_int(this,posy);
	fprintf(stderr,"\nEND of obj_mapChunk %p\n",(void*)this);
	return(NULL);}
