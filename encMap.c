#include "encMap.h"

obj_map*
TEMPLATE(obj_map,finalize)(obj_map* this){
	this->chunksx=0;
	this->chunksy=0;
	this->mapsx=0;
	this->mapsy=0;
	this->chtotal=0;
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
	STRUCTCOPPIER(dest,this,chtotal);
	TEMPLATE3(arr,Copyto,obj_mapChunk)(&this->chunks, &dest->chunks);
	//obj_mapChunk *p_tmp=NULL;
	//TEMPLATE3(arr,iterResetStart,obj_mapChunk)(&this->chunks);
	//while((p_tmp=TEMPLATE3(arr,iterNext,obj_mapChunk)(&this->chunks))){
	//	obj_mapChunk_copyTo(p_tmp,TEMPLATE3(arr,append,obj_mapChunk)(&dest->chunks));
	//	}
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
	DUMP_STRUCT_int(this,chtotal);
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
	//bool arrloop=true;
	//obj_mapChunk* obj_mapChunk=NULL;
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
				mapGenerateChunkIndexes(this);
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
	if(this->chtotal)return;
	this->mapsx=this->chunksx*MAP_CHUNK_SIZE;
	this->mapsy=this->chunksy*MAP_CHUNK_SIZE;
	this->chtotal=this->chunksx*this->chunksy;
	
	TEMPLATE3(arr,extendBy,obj_mapChunk)(&this->chunks,this->chtotal);
	this->chunks.end=this->chunks.start+this->chtotal;

	return;}

void
mapGenerateChunkIndexes(obj_map* this){
	mapUpdateSize(this);
	obj_mapChunk* chunk=NULL;
	TEMPLATE3(arr,iterResetStart,obj_mapChunk)(&this->chunks);
	for(unsigned int y=0;y<this->chunksy;y++){
		for(unsigned int x=0;x<this->chunksx;x++){
			if((chunk=TEMPLATE3(arr,iterNext,obj_mapChunk)(&this->chunks))){
				chunk->posx=x;
				chunk->posy=y;}
			else{
				#ifdef DEBUG
				fprintf(stderr,"error %s arr iterNext returned NULL, probably  out of bounds",__func__);
				#endif
				return;}
			}
		}
	}

obj_mapChunk*
mapGetPtrToChunk(
		obj_map* this,
		unsigned int globalx,
		unsigned int globaly){
	NULL_P_CHECK(this);

	if(globalx>=this->mapsx||globaly>=this->mapsy){
		#ifdef DEBUG
		fprintf(stderr,"DEBUG %s args out of bounds globalx=%u globaly=%u\n",__func__,globalx,globaly);
		#endif
		return(NULL);}
		unsigned int pos=globalx/MAP_CHUNK_SIZE+globaly/MAP_CHUNK_SIZE*this->chunksx;//calculated chunk pos
	return(TEMPLATE3(arr,indexToPtr,obj_mapChunk)(&this->chunks,pos));}

struct mapTile*
mapGetPtrTo_mapTile(
		obj_map* this,
		unsigned int globalx,
		unsigned int globaly){
	NULL_P_CHECK(this);
	
	if(globalx>=this->mapsx||globaly>=this->mapsy){
		#ifdef DEBUG
		fprintf(stderr,"DEBUG %s args out of bounds globalx=%u globaly=%u\n",__func__,globalx,globaly);
		#endif
		return(NULL);}
	obj_mapChunk* chunk=mapGetPtrToChunk(this,globalx,globaly);
	//NULL_P_CHECK(chunk);
	return(mapChunkGetTile(chunk,globalx,globaly));}


