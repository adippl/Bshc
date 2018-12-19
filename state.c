#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

#include "conf.h"
#include "state.h"


struct ship*
ship_init(int size){
	struct ship* sh_ptr=malloc(sizeof(struct ship));
	if(!sh_ptr) return(NULL);

	sh_ptr->shdir=0;
	sh_ptr->shsize=size;
	sh_ptr->sax=0;
	sh_ptr->say=0;
	sh_ptr->hp=size;
	sh_ptr->hits=malloc(sizeof(char)*size);

	for(int i=0;i<size;i++){
		*(sh_ptr->hits+i)=0;
	}

	if(!sh_ptr->hits){
		free(sh_ptr);
		return(NULL);
	}
	return(sh_ptr);
}

void
ship_free(struct ship** sh_ptr){
	if(!sh_ptr)exit(EXIT_FAILURE);
	free((*sh_ptr)->hits);
	free(*sh_ptr);
	*sh_ptr=NULL;
}

struct ply*
ply_init(struct state* state_ptr,int pln){
	if(pln<1)return(NULL);

	struct ply* ply_ptr=malloc(sizeof(struct ply));
	if(!ply_ptr) return(NULL);

	ply_ptr->pln=pln;
	ply_ptr->nsh3=MAX_NSH3;
	ply_ptr->nsh4=MAX_NSH4;
	ply_ptr->nsh5=MAX_NSH5;
	ply_ptr->shtbl_size=MAX_NSH3+MAX_NSH4+MAX_NSH5;

	ply_ptr->shtbl_ptr=malloc(sizeof(struct ship*)*ply_ptr->shtbl_size);
	if(!ply_ptr->shtbl_ptr) return(NULL);

	int i_shn=0;	//ship number iterator
	for(int j=0;j<MAX_NSH3;j++){
		*(ply_ptr->shtbl_ptr+i_shn)=ship_init(MAX_NSH3);
		if(!*(ply_ptr->shtbl_ptr+i_shn)) return(NULL);
		i_shn++;
	}
	for(int j=0;j<MAX_NSH4;j++){
		*(ply_ptr->shtbl_ptr+i_shn)=ship_init(MAX_NSH4);
		if(!*(ply_ptr->shtbl_ptr+i_shn)) return(NULL);
		i_shn++;
	}
	for(int j=0;j<MAX_NSH5;j++){
		*(ply_ptr->shtbl_ptr+i_shn)=ship_init(MAX_NSH5);
		if(!*(ply_ptr->shtbl_ptr+i_shn)) return(NULL);
		i_shn++;
	}

	//ply_ptr->map_ptr=malloc(sizeof(struct shtbl_size*)*state_ptr->sizex*state_ptr->sizey);
	ply_ptr->map_ptr=malloc(sizeof(struct ship*)*ply_ptr->map_size);
	if(!ply_ptr->map_ptr) return(NULL);
	for(int i=0;i<SIZE_X*SIZE_Y;i++){
		*(ply_ptr->map_ptr+i)=NULL;
	}

	return(ply_ptr);
}
void
ply_free(struct ply** ply_ptr){
	if(!*ply_ptr)exit(EXIT_FAILURE);
	for(int i=0;i<(*ply_ptr)->shtbl_size;i++){
		ship_free(((*ply_ptr)->shtbl_ptr+i));
	}
	free(*ply_ptr);
	*ply_ptr=NULL;
}

struct state*
state_init(int nopl){ //Func input nopl - number of players
	if(nopl<1)return(NULL);
	
	struct state* state_ptr=malloc(sizeof(struct state));
	if(!state_ptr) return(NULL);

	state_ptr->sizex=SIZE_X;
	state_ptr->sizey=SIZE_Y;

	state_ptr->nopl=nopl;
	state_ptr->ply_ptr=malloc(sizeof(struct ply*)*nopl);
	if(!state_ptr->ply_ptr) return(NULL);

	for(int i=0;i<nopl-1;i++){
		*(state_ptr->ply_ptr+i)=ply_init(state_ptr,i);
		if(!state_ptr->ply_ptr+i) return(NULL);
	}
	state_ptr->state=0;
	
	return(state_ptr);
}
void
state_free(struct state** state_ptr){
	if(!state_ptr)exit(EXIT_FAILURE);

	for(int i=0;i<(*state_ptr)->nopl;i++){
		ply_free((*state_ptr)->ply_ptr+i);
	}
	free(*state_ptr);
	*state_ptr==NULL;
}

int
ship_place(	struct state* state_ptr,
		struct ply* ply_ptr,
		struct ship* sh_ptr,
		char x,
		char y,
		char length,
		bool dir
		){
	if(!state_ptr)return(1);

	sh_ptr->shsize=length;
	sh_ptr->hp=length;
	sh_ptr->shdir=dir;

	if(dir){
	//	if(x+length<=)		
	}else{
		
	}

	void* pln=ply_ptr->pln;



//	*(state_ptr->ply_ptr+0);
	return(0);
}
