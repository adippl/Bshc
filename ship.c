#include "ship.h"

//uint8_t
//rand_gen(uint8_t* spread){
//	int v=*spread+SPREAD_DEF;	//SPREAD_DEF=1 by def
//
//	int rd=0;
//	
//	rd=0;
//	rd=rand()%v;	//value
//	if(rand()%2){	// + - sigh change
//		rd=rd*(-1);
//	}
//	return(rd);
//}
//
//struct shot*
//shot_gen(uint8_t noshells,uint8_t spread){
//	
//	struct shot* shot_ptr=shot(noshells);
//	if(!shot_ptr)exit(923);
//	
//	int16_t (*shots_arr)[noshells][2]=(void*)shot_ptr->shots_ptr;	//risky FIXIT
//	
//	for(int i=0;i<noshells;i++){
//		(*shots_arr)[i][0]=rand_gen(&spread);
//		(*shots_arr)[i][1]=rand_gen(&spread);
//		fprintf(stderr,"shell nr=%d\tx=%d\ty=%d\t\n",i,(*shots_arr)[i][0],(*shots_arr)[i][1]);
//	}
//	return(shot_ptr);
//}

//void
//obj_free(void** obj_pp){	//generic destructor
//	if(!*obj_pp)exit(EXIT_FAILURE);
//	free(*obj_pp);
//	*obj_pp=NULL;
//	return;}

//constructors

//ship_r*
//ship_r_init(){
//	ship_r* ship_r_p=calloc(1,sizeof(ship_r));
//	if(!ship_r_p)exit(EXIT_FAILURE);
//	ship_r_p->dstr=obj_free;
//	
//	return(ship_r_p);}
//
//
//ship_templ*
//ship_templ_init(){
//	ship_templ* ship_templ_p=calloc(1,sizeof(ship_templ));
//	if(!ship_templ_p)exit(EXIT_FAILURE);
//	ship_templ_p->dstr=obj_free;
//	
//	return(ship_templ_p);}
//
//ship_module*
//ship_module_init(){
//	ship_module* ship_module_p=calloc(1,sizeof(ship_module));
//	if(!ship_module_p)exit(EXIT_FAILURE);
//	ship_module_p->dstr=obj_free;
//	
//	return(ship_module_p);}
//
//ship_wpn_templ*
//ship_wpn_templ_init(){
//	ship_wpn_templ* ship_wpn_templ_p=calloc(1,sizeof(ship_wpn_templ));
//	if(!ship_wpn_templ_p)exit(EXIT_FAILURE);
//	ship_wpn_templ_p->dstr=obj_free;
//	
//	return(ship_wpn_templ_p);}
//
//void
//obj_ship_abilit_free(void** obj_pp){
//	if(!*obj_pp)exit(EXIT_FAILURE);
//	ship_abilit* obj_pp_c=(ship_abilit*)*obj_pp; 
//	free(obj_pp_c->defmod_tbl_p);
//	free(obj_pp_c->actmod_tbl_p);
//	free(obj_pp_c->dmgmod_tbl_p);
//	free(obj_pp_c->dstmod_tbl_p);
//	free(*obj_pp);
//	*obj_pp=NULL;
//	return;}
//
//ship_abilit*
//ship_abilit_init(){
//	ship_abilit* ship_abilit_p=calloc(1,sizeof(ship_abilit));
//	if(!ship_abilit_p)exit(EXIT_FAILURE);
//	ship_abilit_p->dstr=obj_ship_abilit_free;
//	
//	return(ship_abilit_p);}
//
