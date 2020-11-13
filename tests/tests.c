#include "tests.h"

/*
void test_ang(){
	vec p2={.x=0,.y=0};
	float angle=vec_angle(&p2)*(180/3.14);
	fprintf(stderr,"1:%f\n",angle);

	p2.x=1; p2.y=-1;
	angle=vec_angle(&p2)*(180/3.14);
	fprintf(stderr,"9=%f\n",angle);

	p2.x=-1; p2.y=-1;
	angle=vec_angle(&p2)*(180/3.14);
	fprintf(stderr,"9=%f\n",angle);

	p2.x=-1; p2.y=1;
	angle=vec_angle(&p2)*(180/3.14);
	fprintf(stderr,"9=%f\n",angle);
}
*/

int
test_cvlarr(){
	char* tmpPtr=NULL;
	char* s1="qwerty";
	char* s2="asdfgh";
	char* s3="zxcvbn";
	obj_cvlarr obj={0};
	obj_cvlarr objCopy={0};
	OBJF(obj_cvlarr,finalize)(&obj);
	OBJF(obj_cvlarr,insert)(&obj,s1);
	OBJF(obj_cvlarr,insert)(&obj,s2);
	OBJF(obj_cvlarr,insert)(&obj,s3);
	OBJF(obj_cvlarr,insert)(&obj,s1);
	OBJF(obj_cvlarr,insert)(&obj,s2);
	OBJF(obj_cvlarr,insert)(&obj,s3);
	OBJF(obj_cvlarr,insert)(&obj,s1);
	OBJF(obj_cvlarr,insert)(&obj,s2);
	OBJF(obj_cvlarr,insert)(&obj,s3);
	OBJF(obj_cvlarr,insert)(&obj,s1);
	OBJF(obj_cvlarr,insert)(&obj,s2);
	OBJF(obj_cvlarr,insert)(&obj,s3);
	
	for(unsigned int i=0;i<15;i++){
		tmpPtr=OBF(cvlarr,getStr)(&obj,i);
		printf("%s getStr index %d = %s at %p\n",__func__,i,tmpPtr,tmpPtr);}
	
	
	OBJF(obj_cvlarr,print)(&obj);
	OBF(cvlarr,resize)(&obj,512,25);
	OBJF(obj_cvlarr,print)(&obj);

	OBJF(obj_cvlarr,finalize)(&objCopy);
	OBJF(obj_cvlarr,copy)(&obj, &objCopy);
	OBJF(obj_cvlarr,print)(&objCopy);
	OBJF(obj_cvlarr,clean)(&obj);
	OBJF(obj_cvlarr,clean)(&objCopy);

	return(0);}

int
test_resources(){
	obj_resources* obj=calloc(1,sizeof(obj_resources));
	resourcesFinalize(obj);
	//obj_resources* objCopy=resourcesCopy(obj);
	resourcesFree(obj);
	//resourcesFree(objCopy);
	return(0);}

int
test_resourcesReadConfig(){
	FILE* res_conf_json=fopen(F_MAIN_CONF,"r");
	bool error=false;
	if(!res_conf_json){
		fprintf(stderr,"test %s failed to open %s",__func__,F_MAIN_CONF);
		return(1);}
	else{
		json_stream JS={0};
		json_open_stream(&JS, res_conf_json);
		json_set_streaming(&JS,true);
		//enum json_type type;
		const char* str=NULL;
		size_t strLength=0;
		str=skipToNextObj(&JS,&strLength);
		printf("next obj \"%s\"\n",str);
		obj_resources obj={0};
		resourcesFinalize(&obj);
		resourcesParse(&obj,&JS);
		
		
		if(error){
			fprintf(stderr,"PARISING ERROR %s\n",__func__);}
		resources_Dump(&obj);
		resourcesClean(&obj);
	

		json_close(&JS);
		fclose(res_conf_json);
		return(0);}
	}

int
test_smodule(){
	obj_smodule* obj=calloc(1,sizeof(obj_smodule));
	OBJF(obj_smodule,finalize)(obj);
	obj_smodule* objCopy=calloc(1,sizeof(obj_smodule));
	OBJF(obj_smodule,finalize)(objCopy);
	OBJF(obj_smodule,copy)(obj,objCopy);
	OBJF(obj_smodule,free)(obj);
	OBJF(obj_smodule,free)(objCopy);
	return(0);}

int
test_ship(){
	obj_ship* obj=calloc(1,sizeof(obj_ship));
	OBJF(obj_ship,finalize)(obj);
	obj_ship* objCopy=calloc(1,sizeof(obj_ship));
	OBJF(obj_ship,finalize)(objCopy);
	OBJF(obj_ship,copy)(obj,objCopy);
	OBJF(obj_ship,free)(obj);
	OBJF(obj_ship,free)(objCopy);
	return(0);}

int
test_mapCpoint(){
	printf("obj_mapCpoint TEST\n");
	obj_mapCpoint mapCpoint={0};
	obj_mapCpoint mapCpointCopy={0};
	OBJF(obj_mapCpoint,finalize)(&mapCpoint);
	OBJF(obj_mapCpoint,finalize)(&mapCpointCopy);
	OBJF(obj_mapCpoint,copy)(&mapCpoint, &mapCpointCopy);
	printf("\nDumping mapCpoint\n");
	OBJF(obj_mapCpoint,print)(&mapCpoint);
	printf("\nDumping mapCpointCopy\n");
	OBJF(obj_mapCpoint,print)(&mapCpointCopy);
	OBJF(obj_mapCpoint,clean)(&mapCpoint);
	OBJF(obj_mapCpoint,clean)(&mapCpointCopy);
	printf("obj_mapCpoint END OF TEST\n");
	return(0);}

int
test_map(){
	printf("obj_map TEST\n");
	obj_map map={0};
	obj_map mapCopy={0};
	OBJF(obj_map,finalize)(&map);
	OBJF(obj_map,finalize)(&mapCopy);
	OBJF(obj_map,copy)(&map, &mapCopy);
	printf("\nDumping map\n");
	OBJF(obj_map,print)(&map);
	printf("\nDumping mapCopy\n");
	OBJF(obj_map,print)(&mapCopy);
	OBJF(obj_map,clean)(&map);
	OBJF(obj_map,clean)(&mapCopy);
	printf("obj_map END OF TEST\n");
	return(0);}


int
test_player(){
	printf("obj_player TEST\n");
	obj_player player={0};
	obj_player playerCopy={0};
	OBJF(obj_player,finalize)(&player);
	OBJF(obj_player,finalize)(&playerCopy);
	OBJF(obj_player,copy)(&player, &playerCopy);
	OBJF(obj_player,print)(&player);
	OBJF(obj_player,print)(&playerCopy);
	OBJF(obj_player,clean)(&player);
	OBJF(obj_player,clean)(&playerCopy);
	printf("obj_player END OF TEST\n");
	return(0);}

int
test_encounter(){
	printf("obj_encounter TEST\n");
	obj_encounter encounter={0};
	obj_encounter encounterCopy={0};
	OBJF(obj_encounter,finalize)(&encounter);
	OBJF(obj_encounter,finalize)(&encounterCopy);
	OBJF(obj_encounter,copy)(&encounter, &encounterCopy);
	OBJF(obj_encounter,print)(&encounter);
	OBJF(obj_encounter,print)(&encounterCopy);
	OBJF(obj_encounter,clean)(&encounter);
	OBJF(obj_encounter,clean)(&encounterCopy);
	printf("obj_encounter END OF TEST\n");
	return(0);}

int
main(){
	assert(test_cvlarr()==0);
	assert(test_smodule()==0);
	assert(test_ship()==0);
	assert(test_mapCpoint()==0);
	assert(test_map()==0);
	assert(test_player()==0);
	assert(test_encounter()==0);
	assert(test_resources()==0);
	assert(test_resourcesReadConfig()==0);
	return(EXIT_SUCCESS);}
