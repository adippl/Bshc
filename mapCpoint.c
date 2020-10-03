#include "mapCpoint.h"



obj_mapCpoint*
OBJF(obj_mapCpoint,finalize)(obj_mapCpoint* this){
	this->mapCpointx=0;
	this->mapCpointy=0;
	/* solar system radius 143730642000000.0 m */
	this->mapCpointName=calloc(SSTRLENG,sizeof(char));
	TEMPLATE3(arr,Finalize,obj_ship)(&this->ships);
	return(this);}

void
OBJF(obj_mapCpoint,clean)(obj_mapCpoint* this){
	TEMPLATE3(arr,Clean,obj_ship)(&this->ships);
	free(this->mapCpointName);
	return;}


void
OBJF(obj_mapCpoint,copy)(obj_mapCpoint* this, obj_mapCpoint* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);
	strncpy(dest->mapCpointName,this->mapCpointName,SSTRLENG);
	TEMPLATE3(arr,Copyto_memcpy,obj_ship)(&this->ships,&dest->ships);
	STRUCTCOPPIER(dest,this,mapCpointx);
	STRUCTCOPPIER(dest,this,mapCpointy);
	return;}


obj_mapCpoint*
OBJF(obj_mapCpoint,print)(obj_mapCpoint* this){
	NULL_P_CHECK(this);
	fprintf(stderr,"\ndumping obj_mapCpoint\n");
	DUMP_STRUCT_string(this,mapCpointName);
	DUMP_STRUCT_int64(this,mapCpointx);
	DUMP_STRUCT_int64(this,mapCpointy);
	TEMPLATE3(arr,dump,obj_ship)(&this->ships);
	return(NULL);}

int
mapCpointParse(obj_mapCpoint* this, json_stream* js){
	NULL_P_CHECK(this);
	NULL_P_CHECK(js);
	
	enum json_type type;
	const char* str=json_get_string(js,NULL);
	//bool arrloop=true;
	printf("FIRST %s	 STRING %s\n",__func__,str);

	bool var=false,arrloop=true;
	obj_ship* obj_ship=NULL;
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
			parseVarSTR(js,mapCpointName);
			parseVarint64_t(js,mapCpointx);
			parseVarint64_t(js,mapCpointx);
			parseARRobj(js,ships,obj_ship,shipParse,&this->ships)
/*	temp solution
 *	(Z,Y,X,W,U)	if(strcmp("ships",str)==0){
**			if((type=json_next(js))!=JSON_ARRAY)continue;
**			while(arrloop){
**				type=json_next(js);
**				var=false;
**				switch(type){
**					case JSON_ERROR:
**						PARSE_EMSG(js,json_typename[type]);
**						fprintf(stderr,"json ERR %s\n",
**							json_get_error(js));
**						break;
**					case JSON_OBJECT:
**						var=true;
**						break;
**					case JSON_DONE:
**					case JSON_ARRAY_END:
**						arrloop=false;
**						continue;
**					default:
**						fprintf(stderr,"arr parse err\n");
**						PARSE_EMSG(js,json_typename[type]);
**					    break;
**						}
**				if(var){
**					obj_ship=TEMPLATE3(arr,append,obj_ship)(&this->ships);
**					if(!obj_ship)return(2);
**					shipParse(obj_ship,js);}}
**			continue;}
*/

			}
		}
	return(1);}

