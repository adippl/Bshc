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

void
TEMPLATE(obj_mapChunk,clean)(obj_mapChunk* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty destructor on %p\n",__func__,(void*)this);
	#endif
	return;}

obj_mapChunk*
TEMPLATE(obj_mapChunk,copy)(obj_mapChunk* this, obj_mapChunk* dest){
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

int
mapChunkParse(obj_mapChunk* this, json_stream* js){
	NULL_P_CHECK(this);
	NULL_P_CHECK(js);
	enum json_type type;
	const char* str=json_get_string(js,NULL);
	bool var=false;
	printf("FIRST STRING %s\n",str);
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
				exit(3);
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
				fprintf(stderr,"SMODULE END l=%ld\n",json_get_lineno(js));
				return(0);}
		if(var){
			parseVarINT(js,posx)
			parseVarINT(js,posy)
			}

		}
		
	
	return(1);}

struct mapTile*
mapChunkGetTile(
		obj_mapChunk* this,
		unsigned int globalx,
		unsigned int globaly){
	NULL_P_CHECK(this);
	if(globalx<MAP_CHUNK_SIZE*this->posx||globalx>=MAP_CHUNK_SIZE*(this->posx+1)||
		globaly<MAP_CHUNK_SIZE*this->posy||globaly>=MAP_CHUNK_SIZE*(this->posy+1)){
		#ifdef DEBUG
		fprintf(stderr,"DEBUG %s args out of bounds globalx=%u globaly=%u\n",__func__,globalx,globaly);
		#endif
		return(NULL);}
	return(&this->map2d[globaly-this->posy*MAP_CHUNK_SIZE][globalx-this->posx*MAP_CHUNK_SIZE]);}
