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
		
		resources_Dump(&obj);
		resourcesClean(&obj);
	

		json_close(&JS);
		fclose(res_conf_json);
		return(0);}
	}

int
test_ship(){
	obj_ship* obj=calloc(1,sizeof(obj_ship));
	shipFinalize(obj);
	obj_ship* objCopy=shipCopy(obj);
	shipFree(obj);
	shipFree(objCopy);
	return(0);}

//int
//test_smodule(){
//	obj_smodule* obj=calloc(1,sizeof(obj_smodule));
//	smoduleFinalize(obj);
//	obj_smodule* objCopy=smoduleCopy(obj);
//	smoduleFree(obj);
//	smoduleFree(objCopy);
//	return(0);}

int
main(){
	test_resources();
	test_ship();
	test_resourcesReadConfig();
	return(EXIT_SUCCESS);}
