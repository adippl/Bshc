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
	this->copyDeep=NULL;
	this->objSize=sizeof(obj_resources);
	//uint16_t objName;
	
	this->vers=1;
	
	TEMPLATE3(arr,Finalize,obj_ship)(&this->shipTeplates);
	this->shipTeplates.objFinalize=shipFinalize;
	this->shipTeplates.objClean=shipClean;
	this->shipTeplates.objCopy=shipCopy;
	this->shipTeplates.objPrint=TEMPLATE(obj_ship,dump);
	return(this);}

void
resourcesFree(obj_resources* this){
	NULL_P_CHECK(this);
	TEMPLATE3(arr,Clean,obj_ship)(&this->shipTeplates);
	free(this);
	return;}


void
resourcesClean(obj_resources* this){
	NULL_P_CHECK(this);
	TEMPLATE3(arr,Clean,obj_ship)(&this->shipTeplates);
	return;}

obj_resources*
resourcesCopy(obj_resources* this){
	NULL_P_CHECK(this);
	obj_resources* ptr=calloc(1,sizeof(obj_resources));
	NULL_P_CHECK(ptr);
	TEMPLATE3(arr,Finalize,obj_ship)(&ptr->shipTeplates);
	TEMPLATE3(arr,Copyto,obj_ship)(&this->shipTeplates,&ptr->shipTeplates);
	return(ptr);}


int
resourcesParse(obj_resources* this, json_stream* js){
	NULL_P_CHECK(this);
	NULL_P_CHECK(js);
	
	enum json_type type;
	const char* str=NULL;
	obj_ship* ship=NULL;
	bool value,arr;
	//double number;
	//bool loop=true;
	type=json_next(js);
	if(type!=JSON_OBJECT)return(2);
	while(true){
		value=false;
		arr=false;
		type=json_next(js);
		switch(type){
			case(JSON_OBJECT_END):
				return(0);
			case(JSON_ERROR):
			case(JSON_DONE):
				return(2);
			case(JSON_OBJECT):
				return(3);
			case(JSON_STRING):
				value=true;
				str=json_get_string(js,NULL);
				break;
			//case(JSON_NUMBER):
			//	number=json_get_number(js);
			//	break;
			case(JSON_ARRAY):
				//skipToArrEnd(js);
				arr=true;
				break;
			default:
				fprintf(stderr,"parsErr %s wrong node type %s\n" \
					,__func__,json_typename[type]);
				break;}
	if(value){
		parseVarINT(js,vers);
		}
	
	if(arr){
		if(strcmp("shipTemplates",str)==0){
			type=json_peek(js);
			ship=TEMPLATE3(arr,append,obj_ship)(&this->shipTeplates);
			shipParse(ship,js);
			ship=TEMPLATE3(arr,append,obj_ship)(&this->shipTeplates);
			shipParse(ship,js);
			fprintf(stderr,"parsA %s type %s\n",__func__,json_typename[type]);

			//while(type==JSON_OBJECT){
			//	fprintf(stderr,"parsA %s type %s\n",__func__,json_typename[type]);
			//	ship=TEMPLATE3(arr,append,obj_ship)(&this->shipTeplates);
			//	shipParse(ship,js);
			//	fprintf(stderr,"parsB %s type %s\n",__func__,json_typename[type]);
			//	}
			//if(json_peek(js)==JSON_ARRAY_END)
			//	json_next(js);





			//while(type!=JSON_ARRAY_END){
			//	switch(type){
			//		fprintf(stderr,"parsing arr, checking type %s\n",
			//			json_typename[type]);
			//		case(JSON_OBJECT):
			//			//ship=TEMPLATE3(arr,append,obj_ship)(&this->shipTeplates);
			//			//shipParse(ship,js);
			//			break;
			//		case(JSON_STRING): type=json_next(js); break;
			//		case(JSON_NUMBER): type=json_next(js); break;
			//		case(JSON_TRUE): type=json_next(js); break;
			//		case(JSON_FALSE): type=json_next(js); break;

			//		case(JSON_DONE): return(1);
			//		case(JSON_ERROR): return(1);
			//		case(JSON_ARRAY): return(1);
			//		case(JSON_ARRAY_END): json_next(js); return(0);
			//		default: return(2);}}
				}}
	}}

	
int
resources_Dump(obj_resources* this){
	NULL_P_CHECK(this);
	fprintf(stderr,"\n\ndumping obj_resources at %p :\n",(void*)this);
	fprintf(stderr,"vers: %d\n",this->vers);
	fprintf(stderr,"shipTeplates arr at %p:\n",(void*)&this->shipTeplates);
	TEMPLATE3(arr,dump,obj_ship)(&this->shipTeplates);
	fprintf(stderr,"\nEND of obj_resources at %p :\n",(void*)this);
	return(0);}
