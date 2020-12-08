#include "encounter.h"

obj_encounter*
OBJF(obj_encounter,finalize)(obj_encounter* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty constructor on %p\n",__func__,(void*)this);
	#endif
	this->encounterName=calloc(SSTRLENG,sizeof(char));


	OBJF(obj_map,finalize)(&this->map);

	TEMPLATE3(arr,Finalize,obj_player)(&this->players);
	return(this);}

void
OBJF(obj_encounter,clean)(obj_encounter* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"DEBUG %s calling empty destructor on %p\n",__func__,(void*)this);
	#endif
	free(this->encounterName);
	
	OBJF(obj_map,clean)(&this->map);
	
	TEMPLATE3(arr,Clean,obj_player)(&this->players);
	return;}

void
OBJF(obj_encounter,copy)(obj_encounter* this, obj_encounter* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);
	strncpy(dest->encounterName,this->encounterName,SSTRLENG);
	
	OBJF(obj_map,copy)(&this->map,&dest->map);
	
	TEMPLATE3(arr,Copyto,obj_player)(&this->players,&dest->players);}
	
void
OBJF(obj_encounter,print)(obj_encounter* this){
	NULL_P_CHECK(this);
	fprintf(stderr,"\ndumping obj_encounter %p\n",(void*)this);
	DUMP_STRUCT_string(this,encounterName);
	OBJF(obj_map,print)(&this->map);
	TEMPLATE3(arr,dump,obj_player)(&this->players);
	fprintf(stderr,"\nEND of obj_encounter %p\n",(void*)this);
	}



int
encounterParse(obj_encounter* this, json_stream* js){
	NULL_P_CHECK(this);
	NULL_P_CHECK(js);
	
	enum json_type type;
	const char* str=json_get_string(js,NULL);

	printf("FIRST %s	 STRING %s\n",__func__,str);

	bool var=false;
	//bool arrloop=false;
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
			parseOBJ(js,mapParse,map);
			parseVarSTR(js,encounterName);
			/*
			 * parseARRobj(js,players,obj_player, \
			 * 	playerParse,&this->players)
			 */
			
			}
		}
	return(1);}
