
#include "conf.h"
#include "state.h"


struct ship*
ship_init(int size, struct ply* ply_ptr){
	struct ship* sh_ptr=malloc(sizeof(struct ship));
	if(!sh_ptr) return(NULL);

	sh_ptr->shdir=0;
	sh_ptr->shsize=size;
	sh_ptr->sax=0;
	sh_ptr->say=0;
	sh_ptr->hp=size;


	sh_ptr->sgmnts=malloc(sizeof(struct fld*)*size);
	if(!sh_ptr->sgmnts){
		free(sh_ptr);
		return(NULL);
	}
	for(int i=0;i<size;i++){
		*(sh_ptr->sgmnts+i)=NULL;
	}


	sh_ptr->ply=ply_ptr;

	sh_ptr->free=ship_free;

	return(sh_ptr);
}

void
ship_free(struct ship** sh_ptr){
	if(!sh_ptr)exit(EXIT_FAILURE);
	free((*sh_ptr)->sgmnts);
	free(*sh_ptr);
	*sh_ptr=NULL;
}

struct fld*
fld_init(char nopl){
	if(nopl<1)return(NULL);

	struct fld* fld_ptr=malloc(sizeof(struct fld));
	if(!fld_ptr)return(NULL);

	fld_ptr->state=0;

	fld_ptr->shotby=malloc(sizeof(struct ply*)*nopl);
	if(!fld_ptr->shotby){free(fld_ptr);return(NULL);}
	for(int i=0;i<nopl;i++) *(fld_ptr->shotby+i)=NULL;

	fld_ptr->ship_ptr=NULL;

	fld_ptr->free=fld_free;
	
	return(fld_ptr);
}

void fld_free(struct fld** fld_ptr){
	if(!*fld_ptr)exit(EXIT_FAILURE);
	free((*fld_ptr)->shotby);
	free(*fld_ptr);
	*fld_ptr=NULL;
}



struct ply*
ply_init(int pln){
	if(pln<0)return(NULL);

	struct ply* ply_ptr=malloc(sizeof(struct ply));
	if(!ply_ptr) return(NULL);

	ply_ptr->pln=pln;
	ply_ptr->pcol=DPLYCOL[pln];
	ply_ptr->nsh3=MAX_NSH3;
	ply_ptr->nsh4=MAX_NSH4;
	ply_ptr->nsh5=MAX_NSH5;
	ply_ptr->shtbl_size=MAX_NSH3+MAX_NSH4+MAX_NSH5;

	ply_ptr->shtbl_ptr=malloc(sizeof(struct ship*)*ply_ptr->shtbl_size);
	if(!ply_ptr->shtbl_ptr) return(NULL);

	int i_shn=0;	//ship number iterator
	for(int j=0;j<MAX_NSH3;j++){
		*(ply_ptr->shtbl_ptr+i_shn)=ship_init(SH3L,ply_ptr);
		if(!*(ply_ptr->shtbl_ptr+i_shn)) return(NULL);
		i_shn++;
	}
	for(int j=0;j<MAX_NSH4;j++){
		*(ply_ptr->shtbl_ptr+i_shn)=ship_init(SH4L,ply_ptr);
		if(!*(ply_ptr->shtbl_ptr+i_shn)) return(NULL);
		i_shn++;
	}
	for(int j=0;j<MAX_NSH5;j++){
		*(ply_ptr->shtbl_ptr+i_shn)=ship_init(SH5L,ply_ptr);
		if(!*(ply_ptr->shtbl_ptr+i_shn)) return(NULL);
		i_shn++;
	}
	
	ply_ptr->free=ply_free;
	
	return(ply_ptr);
}
void
ply_free(struct ply** ply_ptr){
	if(!*ply_ptr)exit(EXIT_FAILURE);
	//struct ply* p=(struct ply**)*ply_ptr;
	for(int i=0;i<((*ply_ptr)->shtbl_size);i++){
		ship_free(((*ply_ptr)->shtbl_ptr+i));
	}
	free(*ply_ptr);
	*ply_ptr=NULL;
}

struct state*
state_init(int nopl){ 
	if(nopl<1)return(NULL);
	
	struct state* state_ptr=malloc(sizeof(struct state));
	if(!state_ptr) return(NULL);

	state_ptr->sizex=SIZE_X;
	state_ptr->sizey=SIZE_Y;
	state_ptr->marea=(SIZE_X)*(SIZE_Y);
	
	state_ptr->map_ptr=malloc(sizeof(struct fld*)*state_ptr->marea);
	if(!state_ptr->map_ptr) return(NULL);
	for(int i=0;i<SIZE_X*SIZE_Y;i++){
		*(state_ptr->map_ptr+i)=fld_init(nopl);
	}

	state_ptr->nopl=nopl;
	state_ptr->ply_ptr=malloc(sizeof(struct ply*)*nopl);
	if(!state_ptr->ply_ptr) return(NULL);

	for(int i=0;i<nopl;i++){
		*(state_ptr->ply_ptr+i)=ply_init(i);
		if(!(state_ptr->ply_ptr+i)) return(NULL);
	}
	state_ptr->state=0;

	state_ptr->free=state_free;
	
	return(state_ptr);
}
void
state_free(struct state** state_ptr){
	if(!*state_ptr)exit(EXIT_FAILURE);

	for(int i=0;i<(*state_ptr)->marea;i++){
		fld_free((*state_ptr)->map_ptr+i);
	}
	
	for(int i=0;i<(*state_ptr)->nopl;i++){
		ply_free((*state_ptr)->ply_ptr+i);
	}
	free(*state_ptr);
	*state_ptr=NULL;
}

char
ship_placecheck(struct state* state_ptr, struct ship* ship_ptr, uint16_t xpos, uint16_t ypos, bool rot){
	if(!state_ptr)return(2);
	if(!ship_ptr)return(2);
	if(xpos>state_ptr->sizex)return(3);
	if(ypos>state_ptr->sizey)return(3);

	struct fld* (*fld_ptr_cst)[state_ptr->sizey][state_ptr->sizex]=(void*)state_ptr->map_ptr;

	for(int i=0;i<ship_ptr->shsize;i++){
		if(!rot){
			if( (*fld_ptr_cst)[ypos+i][xpos]->ship_ptr!=NULL || (*fld_ptr_cst)[ypos+i][xpos]->state==2 ){
//			fprintf(stderr,"@y=%d x=%d@ %d # %p @@",ypos+i,xpos,(int)(*fld_ptr_cst)[ypos+i][xpos]->state, (void*)(*fld_ptr_cst)[ypos+i][xpos]->ship_ptr);	//debug
				return(1);
			}
		}else{
			if( (*fld_ptr_cst)[ypos][xpos+i]->ship_ptr!=NULL || (*fld_ptr_cst)[ypos][xpos+i]->state==2 ){
//			fprintf(stderr,"@y=%d x=%d@ %d # %p @@",ypos,xpos+i,(int)(*fld_ptr_cst)[ypos][xpos+i]->state,(void*)(*fld_ptr_cst)[ypos][xpos+i]->ship_ptr);	//debug
				return(1);
			}
			
		}
	}


	return(0);
}

char
ship_place_str_pos(struct state* state_ptr, struct ship* ship_ptr){
	if(!state_ptr)return(2);
	if(!ship_ptr)return(2);

	uint16_t xpos=ship_ptr->sax;
	uint16_t ypos=ship_ptr->say;
	bool dir=ship_ptr->shdir;
	
	if(xpos>state_ptr->sizex)return(3);
	if(ypos>state_ptr->sizey)return(3);

	struct fld* (*fld_ptr_cst)[state_ptr->sizey][state_ptr->sizex]=(void*)state_ptr->map_ptr;

	for(int i=0;i<ship_ptr->shsize;i++){
		if(!dir){
			(*fld_ptr_cst)[ypos+i][xpos]->ship_ptr=(void*)*(ship_ptr->sgmnts+i);	//risky //FIXIT
			*(ship_ptr->sgmnts+i)=(*fld_ptr_cst)[ypos+i][xpos];			//risky //FIXIT
			(*fld_ptr_cst)[ypos+i][xpos]->state=2;
		}else{
			(*fld_ptr_cst)[ypos][xpos+i]->ship_ptr=(void*)*(ship_ptr->sgmnts+i);	//risky //FIXIT
			*(ship_ptr->sgmnts+i)=(*fld_ptr_cst)[ypos][xpos+i];			//risky //FIXIT
			(*fld_ptr_cst)[ypos][xpos+i]->state=2;
		}
	}
	return(0);
}

void ship_calc_hp(struct ship* ship_ptr){
	if(!ship_ptr)exit(920);
	uint16_t hp=0;
//	struct fld* (*fld_ptr_arr)[ship_ptr->shsize]=(struct fld* (*)[ship_ptr->shsize] )ship_ptr->sgmnts;	//risky FIXIT
	struct fld* (*fld_ptr_arr)[ship_ptr->shsize]=(void*)ship_ptr->sgmnts;	//risky FIXIT


	for(int i=0;i<ship_ptr->shsize;i++){
		if((*fld_ptr_arr)[i]->state){
			hp++;
		}
	}
	ship_ptr->hp=hp;
}
void ply_calc_ships_hp(struct ply* ply_ptr){
	if(!ply_ptr)exit(921);
	
	struct ship* (*ship_ptr_arr)[ply_ptr->shtbl_size]=(void*)ply_ptr->shtbl_ptr;

	for(int i=0;i<ply_ptr->shtbl_size;i++){
		ship_calc_hp((*ship_ptr_arr)[i]);
	}
}

struct shot*
shot_init(unsigned char noshells){
	struct shot* shot_ptr=malloc(sizeof(struct shot));
	if(!shot_ptr)exit(922);
	
	shot_ptr->shots_ptr=malloc(sizeof(uint16_t)*2*noshells);
	if(!shot_ptr)exit(922);
	
	shot_ptr->free=shot_free;
	
	return(shot_ptr);
}

void
shot_free(struct shot** shot_ptr){
	free((*shot_ptr)->shots_ptr);
	free(*shot_ptr);
}

char
rand_gen(char shsize){
	int v=1+SPREAD_DEF;	//SPREAD_DEF=1 by def
	switch(shsize){
		case 3:
			v+=0;
			break;;
		case 4:
			v+=1;
			break;;
		case 5:
			v+=2;
			break;;
	}

	int rd=0;
	
	rd=0;
	rd=rand()%v;	//value
	if(rand()%2){	// + - sigh change
		rd=rd*(-1);
	}
	return(rd);
}


struct shot*
shot_gen(char shsize){
	if(3>shsize||shsize>5)exit(924);
	
	uint16_t noshells=0;	//number of shels
	switch(shsize){
		case 3:
			noshells=SH3_NOSH;
			break;;
		case 4:
			noshells=SH4_NOSH;
			break;;
		case 5:
			noshells=SH5_NOSH;
			break;;
	}
	struct shot* shot_ptr=shot(noshells);
	if(!shot_ptr)exit(923);
	
//	int16_t (*shot_arr)[noshells][2]=(uint16_t (*)[noshells][2])shot_ptr->shots_ptr;	//risky FIXIT
	int16_t (*shots_arr)[noshells][2]=(void*)shot_ptr->shots_ptr;	//risky FIXIT
	
	time_t tt;		//FIXIT
	srand(time(&tt));	//FIXIT
	for(int i=0;i<noshells;i++){
		(*shots_arr)[i][0]=rand_gen(shsize);
		(*shots_arr)[i][1]=rand_gen(shsize);
		fprintf(stderr,"shell nr=%d\tx=%d\ty=%d\t\n",i,(*shots_arr)[i][0],(*shots_arr)[i][1]);
	}
	return(shot_ptr);
}

void 
state_shot_shoot_and_mark(struct state* state_ptr, struct shot* shot_ptr, uint16_t ypos, uint16_t xpos){
	if(!state_ptr)exit(925);
	if(!shot_ptr)exit(926);
	
	int16_t (*shots_arr)[shot_ptr->noshells][2]=(void*)shot_ptr->shots_ptr;	//risky FIXIT
	struct fld* (*fld_ptr_cst)[state_ptr->sizey][state_ptr->sizex]=(void*)state_ptr->map_ptr;

	//(*fld_ptr_cst)[ypos+(*shots_arr)[i][1]][xpos+(*shots_arr)[i][0]]

	for(int i=0;i<shot_ptr->noshells;i++){
		switch((*fld_ptr_cst)[ypos+(*shots_arr)[i][1]][xpos+(*shots_arr)[i][0]]->state){
			case 0:
				(*fld_ptr_cst)[ypos+(*shots_arr)[i][1]][xpos+(*shots_arr)[i][0]]->state=1;
			break;;
			case 1:
				//donothing
			break;;
			case 2:
				(*fld_ptr_cst)[ypos+(*shots_arr)[i][1]][xpos+(*shots_arr)[i][0]]->state=3;
				
			break;;
			case 3:
				//donothing
			break;;
		}
	}
	shot_ptr->free(&shot_ptr);
}



