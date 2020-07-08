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

int
mapParse(obj_map* this, json_stream* js){
	NULL_P_CHECK(this);
	NULL_P_CHECK(js);
	
	enum json_type type;
	const char* str=json_get_string(js,NULL);
	bool arrloop=true;
	obj_mapChunk* obj_mapChunk=NULL;
	printf("FIRST %s	 STRING %s\n",__func__,str);

	bool var=false;
	while(true){
		type=json_next(js);
		switch(type){
			case JSON_ERROR:
				PARSE_EMSG(js,json_typename[type]);
				fprintf(stderr,"JSON ERR %s\n",\
					json_get_error(js));
				break;
			case JSON_NULL:
			case JSON_TRUE:
			case JSON_FALSE:
			case JSON_NUMBER:
				break;
			case JSON_STRING:
				var=true;
			    break;
			case JSON_ARRAY:
			case JSON_OBJECT:
			case JSON_DONE:
				PARSE_EMSG(js,json_typename[type]);
			    break;
			case JSON_ARRAY_END:
				PARSE_EMSG(js,json_typename[type]);
				return(1);
			case JSON_OBJECT_END:
				fprintf(stderr,"SHIP END l=%ld\n",json_get_lineno(js));
				return(0);}
		if(var){
			parseVarUINT(js,chunksx)
			parseVarUINT(js,chunksy)
			parseVarSTR(js,mapName);
			
			//parseARRobj(js,chunks,obj_mapChunks,mapChunkParse,&this->chunks);
			}
			//fprintf(stderr,"json %s found invalid key %s ",__func__,str);
			//type=json_next(js);
			//fprintf(stderr,"with value %s\n",str);
		}
	return(1);}

void
mapUpdateSize(obj_map* this){
	NULL_P_CHECK(this);
	if(this->total)return;
	this->mapsx=this->chunksx*MAP_CHUNK_SIZE;
	this->mapsy=this->chunksy*MAP_CHUNK_SIZE;
	return;}

