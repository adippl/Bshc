#include "tests.h"

/*
void
test_struct_inits(){
	printf("\n");
	
	struct ctfb* kkk=ctfb_fb_init(FSIZE_X,FSIZE_Y);
	kkk->delete(&kkk);
	printf("ctfb %p\n",(void*)kkk);

	struct ship* k=ship(3,(void*)0x0);
	k->free(&k);
	printf("ship %p \n",(void*)kkk);
	
	struct fld* f=fld(2);
	f->free(&f);
	printf("fld %p \n",(void*)f);

	struct ply* pl=ply(1);
	pl->free(&pl);
	printf("ply %p \n",(void*)pl);

	struct state* st=state(2);
	st->free(&st);
	printf("state %p \n",(void*)st);
	
	struct shot* shot_objCopy=shot(10);
	shot_objCopy->free(&shot_objCopy);
}
void
test_shot(){
	wchar_t c=0;
	struct shot* a=NULL;
	
	do{
		//gotoxy(1,SIZE_Y*2+3);
		//screen_clear_area(0,52,FSIZE_X,FSIZE_Y-52);	//FIXIT
		fprintf(stdout,"shell spread test, enter q to exit");
		a=shot_gen(5);
		a->free(&a);
		c=getchar();
	}while(c!='q');
}


void lol(state* str_p, ship* ship_p, void* arg){
	fprintf(stdin, "shsize=%d", ship_p->shsize);
}
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

		/* test copy to real ship */
		//obj_shipReal* shipReal=calloc(1,sizeof(obj_shipReal));
		//obj_shipReal_finalize(shipReal);
		//obj_shipReal_initShipBase(shipReal,TEMPLATE3(arr,indexToPtr,obj_ship)(&obj.shipTemplates,0));
		//OBJF(obj_shipReal,print)(shipReal);
		//obj_shipReal_clean(shipReal);
		//free(shipReal);
		
		resources_Dump(&obj);
		resourcesClean(&obj);
	

		json_close(&JS);
		fclose(res_conf_json);
		return(0);}
	}

//int
//test_smodule(){
//	obj_smodule* obj=calloc(1,sizeof(obj_smodule));
//	smoduleFinalize(obj);
//	obj_smodule* objCopy=smoduleCopy(obj);
//	smoduleFree(obj);
//	smoduleFree(objCopy);
//	return(0);}

int
test_ship(){
	obj_ship* obj=calloc(1,sizeof(obj_ship));
	obj_ship_finalize(obj);
	obj_ship* objCopy=calloc(1,sizeof(obj_ship));
	obj_ship_finalize(objCopy);
	obj_ship_copy(obj,objCopy);
	obj_ship_free(obj);
	obj_ship_free(objCopy);
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
	test_ship();
	test_mapCpoint();
	test_map();
	test_player();
	test_encounter();
	test_resources();
	test_resourcesReadConfig();
	return(EXIT_SUCCESS);}
