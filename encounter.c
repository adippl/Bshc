#include "encounter.h"

obj_encounter*
TEMPLATE(obj_encounter,finalize)(obj_encounter* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty constructor on %p\n",__func__,(void*)this);
	#endif
	this->encounterName=calloc(SSTRLENG,sizeof(char));


	TEMPLATE(obj_encMap,finalize)(&this->map);

	TEMPLATE3(arr,Finalize,obj_encPlayer)(&this->players);
	return(this);}

void
TEMPLATE(obj_encounter,clean)(obj_encounter* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty destructor on %p\n",__func__,(void*)this);
	#endif
	free(this->encounterName);
	
	TEMPLATE(obj_encMap,clean)(&this->map);
	
	TEMPLATE3(arr,Finalize,obj_encPlayer)(&this->players);
	return;}

void
TEMPLATE(obj_encounter,copy)(obj_encounter* this, obj_encounter* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);
	strncpy(dest->encounterName,this->encounterName,SSTRLENG);
	
	TEMPLATE(obj_encMap,copy)(&this->map,&dest->map);
	
	TEMPLATE3(arr,Copyto,obj_encPlayer)(&this->players,&dest->players);}
	
void
TEMPLATE(obj_encounter,print)(obj_encounter* this){
	NULL_P_CHECK(this);
	fprintf(stderr,"\ndumping obj_encounter %p\n",(void*)this);
	DUMP_STRUCT_string(this,encounterName);
	TEMPLATE(obj_encMap,print)(&this->map);
	TEMPLATE3(arr,dump,obj_encPlayer)(&this->players);
	fprintf(stderr,"\nEND of obj_encounter %p\n",(void*)this);
	}



int
encounterParse(obj_encounter* this, json_stream* js){
	NULL_P_CHECK(this);
	NULL_P_CHECK(js);
	
	enum json_type type;
	const char* str=json_get_string(js,NULL);

	printf("FIRST %s	 STRING %s\n",__func__,str);

	bool var=false, arrloop=false;
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
				mapGenerateChunkIndexes(&this->map);
				return(0);}
		if(var){
			parseOBJ(js,mapParse,map);
			parseVarSTR(js,encounterName);
			//parseARRobj(js,players,obj_encPlayer, \
			//	encPlayerParse,&this->players)
			
			}
		}
	return(1);}
