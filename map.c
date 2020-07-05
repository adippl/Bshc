#include "map.h"

obj_map*
TEMPLATE(obj_map,finalize)(obj_map* this){
	this->chunksx=0;
	this->chunksy=0;
	this->mapsx=0;
	this->mapsy=0;
	this->total=0;
	this->mapName=calloc(SSTRLENG,sizeof(char));
	TEMPLATE3(arr,Finalize,obj_mapChunk)(&this->chunks);
	return(this);}

void
TEMPLATE(obj_map,clean)(obj_map* this){
	//NULL_P_CHECK(this);
	free(this->mapName);
	TEMPLATE3(arr,Clean,obj_mapChunk)(&this->chunks);
	return;}


void
TEMPLATE(obj_map,copyTo)(obj_map* this, obj_map* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);
	strncpy(dest->mapName,this->mapName,SSTRLENG);
	STRUCTCOPPIER(dest,this,chunksx);
	STRUCTCOPPIER(dest,this,chunksy);
	STRUCTCOPPIER(dest,this,mapsx);
	STRUCTCOPPIER(dest,this,mapsy);
	STRUCTCOPPIER(dest,this,total);
	TEMPLATE3(arr,Copyto,obj_mapChunk)(&this->chunks, &dest->chunks);
	return;}


obj_map*
TEMPLATE(obj_map,print)(obj_map* this){
	NULL_P_CHECK(this);
	fprintf(stderr,"\ndumping obj_map\n");
	DUMP_STRUCT_string(this,mapName);
	DUMP_STRUCT_int(this,chunksx);
	DUMP_STRUCT_int(this,chunksy);
	DUMP_STRUCT_int(this,mapsx);
	DUMP_STRUCT_int(this,mapsy);
	DUMP_STRUCT_int(this,total);
	fprintf(stderr,"chunks arr at %p:\n",(void*)&this->chunks);
	TEMPLATE3(arr,dump,obj_mapChunk)(&this->chunks);
	fprintf(stderr,"\nEND of obj_map %p\n",(void*)this);
	
	return(NULL);}

void
mapUpdateSize(obj_map* this){
	NULL_P_CHECK(this);
	if(this->total)return;
	this->mapsx=this->chunksx*MAP_CHUNK_SIZE;
	this->mapsy=this->chunksy*MAP_CHUNK_SIZE;
	return;}
