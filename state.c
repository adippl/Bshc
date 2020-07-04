#include "state.h"


//obj_resources* 
//resources_init(){
//	return(calloc(1,sizeof(obj_resources)));}

obj_resources*
resourcesFinalize(obj_resources* this){
	this->finalize=resourcesFinalize;
	this->free=resourcesFree;
	this->clean=resourcesClean;
	//this->copy=resourcesCopy;
	//CAT(obj,T)* (*copyDeep)(CAT(obj,T)* p_struct);
	this->copyTo=NULL;
	this->objSize=sizeof(obj_resources);
	//uint16_t objName;
	
	this->vers=1;
	
	TEMPLATE3(arr,Finalize,obj_ship)(&this->shipTemplates);
	return(this);}

void
resourcesFree(obj_resources* this){
	NULL_P_CHECK(this);
	TEMPLATE3(arr,Clean,obj_ship)(&this->shipTemplates);
	free(this);
	return;}


void
resourcesClean(obj_resources* this){
	NULL_P_CHECK(this);
	TEMPLATE3(arr,Clean,obj_ship)(&this->shipTemplates);
	return;}

obj_resources*
resourcesCopy(obj_resources* this){
	NULL_P_CHECK(this);
	obj_resources* ptr=calloc(1,sizeof(obj_resources));
	NULL_P_CHECK(ptr);
	TEMPLATE3(arr,Finalize,obj_ship)(&ptr->shipTemplates);
	TEMPLATE3(arr,Copyto,obj_ship)(&this->shipTemplates,&ptr->shipTemplates);
	return(ptr);}


int
resourcesParse(obj_resources* this, json_stream* js){
	NULL_P_CHECK(this);
	NULL_P_CHECK(js);
	
	enum json_type type;
	const char* str=json_get_string(js,NULL);
	obj_ship* obj_ship=NULL;
	bool value,arrloop=true,var=false;
	//double number;
	//bool loop=true;
	type=json_next(js);
	if(type!=JSON_OBJECT)return(2);
	while(true){
		type=json_next(js);
		value=false;
		switch(type){
			case(JSON_DONE):
				return(0);
			case JSON_ERROR:
				PARSE_EMSG(js,json_typename[type]);
				fprintf(stderr,"json ERR %s\n",\
					json_get_error(js));
				exit(1);
			case(JSON_STRING):
				value=true;
				break;
			case(JSON_OBJECT_END):
				if(json_peek(js)==JSON_OBJECT_END)json_next(js);
				continue;
			default:
				PARSE_EMSG(js,json_typename[type]);
				exit(1);
				break;}
	if(value){
		//fprintf(stderr,"DEBUG "); \
		//PARSE_EMSG(js,json_typename[type]);
		parseVarINT(js,vers);
		
		parseARRobj(js,shipTemplates,obj_ship,shipParse,&this->shipTemplates)
		fprintf(stderr,"json %s found invalid key %s",__func__,str);
		type=json_next(js);
 		fprintf(stderr,"with value %s\n",str);
				}}}

	
int
resources_Dump(obj_resources* this){
	NULL_P_CHECK(this);
	fprintf(stderr,"\n\ndumping obj_resources at %p :\n",(void*)this);
	fprintf(stderr,"vers: %d\n",this->vers);
	fprintf(stderr,"shipTemplates arr at %p:\n",(void*)&this->shipTemplates);
	TEMPLATE3(arr,dump,obj_ship)(&this->shipTemplates);
	fprintf(stderr,"\nEND of obj_resources at %p :\n",(void*)this);
	return(0);}
