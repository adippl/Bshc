#include "cvlarr.h"

obj_cvlarr*
OBF(cvlarr,finalize)(obj_cvlarr* this){
	NULL_P_CHECK(this);
	this->mem=calloc(CVLARR_DEF_ALLOC_SIZE,sizeof(char));
	this->memSize=CVLARR_DEF_ALLOC_SIZE*sizeof(char);
	this->endOfLastString=0;
	this->indexArr=calloc(CVLARR_DEF_SIZE,sizeof(size_t));
	this->indexArrSize=CVLARR_DEF_SIZE*sizeof(size_t);
	this->noStrings=0;
	this->iterPos=0;
	#ifdef DEBUG
		this->_debug_resizeCount=0;
		#endif
	return(this);}
	

void
OBF(cvlarr,clean)(obj_cvlarr* this){
	NULL_P_CHECK(this);
	#ifdef DEBUG
		fprintf(stderr,"INFO %s freeing obj_cvlarr at %p\n",\
			__func__,(void*)this); 
		#endif
	free(this->mem);
	free(this->indexArr);}


char*
obj_cvlarr_getStr(obj_cvlarr* this, unsigned int index){
	NULL_P_CHECK(this);
	char* retPtr=NULL;
	
	if(this->noStrings<1 || index>=this->noStrings)
		return(NULL);
	#ifdef DEBUG
		if(index>this->indexArrSize){
			fprintf(stderr,"ERR %s inder over indexArrSize limit in obj %p\n",\
				__func__,(void*)this); 
			return(NULL);}
		#endif
	retPtr=this->mem+*(this->indexArr+index);
	#ifdef DEBUG
		if(retPtr>=this->mem+this->memSize){
			fprintf(stderr,"ERR %s retPtr over memSize limit in obj %p\n",\
				__func__,(void*)this); 
			return(NULL);}
		#endif
	return(retPtr);}

int
obj_cvlarr__resize_mem(obj_cvlarr* this, size_t by){
	if((this->mem=realloc(this->mem,this->memSize+by))==NULL)
		return(1);
	memset(this->mem+this->memSize/sizeof(char),0,by);
	this->memSize+=by;
	#ifdef DEBUG
		this->_debug_resizeCount++;
		#endif
	return(0);}

int
obj_cvlarr__resize_indexArr(obj_cvlarr* this, size_t by){
	size_t* reallocPtr=NULL;
	if((reallocPtr=realloc(this->indexArr,this->indexArrSize+by))==NULL)
		return(1);
	this->indexArr=reallocPtr;
	/* TODO memset is broken, NOT sure why */
	//memset(this->indexArr+this->noStrings,0,by);
	this->indexArrSize+=by;
	#ifdef DEBUG
		this->_debug_resizeCount++;
		#endif
	return(0);}

int
obj_cvlarr__autoExtend(obj_cvlarr* this, size_t nextString){
	if((this->noStrings+1)*sizeof(size_t)>=this->indexArrSize)
		if(obj_cvlarr__resize_indexArr(this,this->indexArrSize+CVLARR_DEF_SIZE*sizeof(size_t))){
			#ifdef DEBUG
				fprintf(stderr,"ERR %s failed to reallocate this->\n",__func__);
				#endif
			return(1);}
			
	if(nextString<1||nextString>CVLARR_STRL_MAX)
		return(1);
	/* memsize - (freespace-strlen) */
	if(this->memSize-(this->endOfLastString+nextString*sizeof(char))<=0){	
		if(obj_cvlarr__resize_mem(this,this->memSize+(nextString+1)*sizeof(char))){
			#ifdef DEBUG
				fprintf(stderr,"ERR %s failed to reallocate this->mem\n",__func__);
				#endif
			return(1);}}
	return(0);}

int
obj_cvlarr_resize(obj_cvlarr* this, unsigned int charArrSize, unsigned int indexArrSize){
	NULL_P_CHECK(this);
	int ret=0;
	size_t newSize;
	if((newSize=charArrSize*sizeof(char)-this->memSize)>0)
		obj_cvlarr__resize_mem(this,newSize);
	else
		ret=1;
	if((newSize=indexArrSize*sizeof(size_t)-(this->indexArrSize))>0)
		obj_cvlarr__resize_indexArr(this, newSize);
	else
		ret=1;
	return(ret);
	}

void
OBF(cvlarr,copy)(obj_cvlarr* this, obj_cvlarr* dest){
	NULL_P_CHECK(this);
	NULL_P_CHECK(dest);
	
	//resize
	OBF(cvlarr,_resize_mem)(dest, this->memSize-dest->memSize);
	memcpy(dest->mem,this->mem, dest->memSize);
	OBF(cvlarr,_resize_indexArr)(dest, this->indexArrSize-dest->indexArrSize);
	memcpy(dest->indexArr, this->indexArr, dest->indexArrSize);

	STRUCTCOPPIER(dest,this,memSize);
	STRUCTCOPPIER(dest,this,indexArrSize);
	STRUCTCOPPIER(dest,this,noStrings);
	STRUCTCOPPIER(dest,this,iterPos);
	#ifdef DEBUG
		STRUCTCOPPIER(dest,this,_debug_resizeCount);
		#endif
	}

char*
obj_cvlarr_insert(obj_cvlarr* this, char* string){
	NULL_P_CHECK(this);
	char* retptr=NULL;
	size_t strl=strnlen(string,CVLARR_STRL_MAX);
	if(obj_cvlarr__autoExtend(this,strl))
		return(NULL);

	retptr=(this->mem+this->endOfLastString+1*sizeof(char));
	*(this->indexArr+this->noStrings)=retptr-this->mem;
	fprintf(stderr,"retptr-this->mem=%lu\n",retptr-this->mem);
	this->noStrings++;
	this->endOfLastString+=strl;
	memcpy(retptr,string,strl);
	/* just in case... */
	*(this->mem+this->endOfLastString)='\0';
	return(retptr);}


void
OBF(cvlarr,iterReset)(obj_cvlarr* this){
	NULL_P_CHECK(this);
	this->iterPos=0;}
char*
OBF(cvlarr,iterNext)(obj_cvlarr* this){
	NULL_P_CHECK(this);
	char* retPtr=NULL;
	if(this->iterPos+1>this->noStrings){
		#ifdef DEBUG
		fprintf(stderr,"WARN %s iterNext over range\n",__func__);
		#endif
		return(NULL);}
	retPtr=OBF(cvlarr,getStr)(this,this->iterPos);
	this->iterPos++;
	return(retPtr);}

void
OBF(cvlarr,print)(obj_cvlarr* this){
	NULL_P_CHECK(this);
	
	fprintf(stderr,"\ndumping obj_cvlarr %p\n",(void*)this);
	DUMP_STRUCT_voidPtr(this,mem);
	DUMP_STRUCT_size_t(this,memSize);
	DUMP_STRUCT_size_t(this,endOfLastString);
	DUMP_STRUCT_voidPtr(this,indexArr);
	DUMP_STRUCT_size_t(this,indexArrSize);
	DUMP_STRUCT_uint(this,noStrings);
	DUMP_STRUCT_uint(this,iterPos);
	#ifdef DEBUG
	DUMP_STRUCT_uint(this,_debug_resizeCount);
	#endif
	
	char* p_str=NULL;
	OBF(cvlarr,iterReset)(this);
	while( (p_str=OBF(cvlarr,iterNext)(this)) !=NULL ){
		fprintf(stderr,"\t string no %u \"%s\" at %p %p\n",
			this->iterPos-1,p_str,p_str,this->mem+*(this->indexArr+(this->iterPos-1)));}
	fprintf(stderr,"\nEND of obj_cvlarr %p\n",(void*)this);}

// TODO UNFINISHED UNTESTED
int
cvlarrParse(obj_cvlarr* this, json_stream* js){
	NULL_P_CHECK(this);
	NULL_P_CHECK(js);
	
	enum json_type type;
	const char* str=json_get_string(js,NULL);
	bool var=false;
	bool arrLoop=true;

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
			var=false;
			if(strcmp("_clvarr_size",str)==0){
				if(json_next(js)==JSON_STRING){
					OBF(cvlarr,resize)(this,(size_t)json_get_number(js),0);
					continue;}}
			if(strcmp("arr",str)==0){
				while(arrLoop){
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
							/* cast cause arg is cons char* */
							OBF(cvlarr,insert)(this,(char*)str);
							break;
						case JSON_ARRAY:
						case JSON_OBJECT_END:
						case JSON_OBJECT:
						case JSON_DONE:
							PARSE_EMSG(js,json_typename[type]);
							break;
						case JSON_ARRAY_END:
							arrLoop=false;
							break;}}}
			//fprintf(stderr,"json %s found invalid key %s ",__func__,str);
			//type=json_next(js);
			//fprintf(stderr,"with value %s\n",str);
		}}
	return(1);}
