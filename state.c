
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

	return(sh_ptr);
}

void
ship_free(struct ship** sh_ptr){
	if(!sh_ptr)exit(EXIT_FAILURE);
	free((*sh_ptr)->sgmnts);
	free(*sh_ptr);
	*sh_ptr=NULL;
}

//struct fld{	//map consists of fields
//	int state;	//field state; 0=empty; 1=shot_miss; 2=ship; 3=destroyed ship;
//	struct ply** shotby;	//array of pointer to player who shot this field. 
//	struct ship* ship_ptr;	//pointer to ship, if empty ship_ptr==NULL
//};

struct fld*
fld_init(char nopl){
	if(nopl<1)return(NULL);

	struct fld* fld=malloc(sizeof(struct fld));
	if(!fld)return(NULL);

	fld->state=0;

	fld->shotby=malloc(sizeof(struct ply*)*nopl);
	if(!fld->shotby){free(fld);return(NULL);}
	for(int i=0;i<nopl;i++) *(fld->shotby+i)=NULL;

	fld->ship_ptr=NULL;
	
	return(fld);
}

void fld_free(struct fld** fld_ptr){
	if(!*fld_ptr)exit(EXIT_FAILURE);
	free((*fld_ptr)->shotby);
	free(*fld_ptr);
}



struct ply*
ply_init(int pln){
	if(pln<0)return(NULL);

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
		*(ply_ptr->shtbl_ptr+i_shn)=ship_init(MAX_NSH3,ply_ptr);
		if(!*(ply_ptr->shtbl_ptr+i_shn)) return(NULL);
		i_shn++;
	}
	for(int j=0;j<MAX_NSH4;j++){
		*(ply_ptr->shtbl_ptr+i_shn)=ship_init(MAX_NSH4,ply_ptr);
		if(!*(ply_ptr->shtbl_ptr+i_shn)) return(NULL);
		i_shn++;
	}
	for(int j=0;j<MAX_NSH5;j++){
		*(ply_ptr->shtbl_ptr+i_shn)=ship_init(MAX_NSH5,ply_ptr);
		if(!*(ply_ptr->shtbl_ptr+i_shn)) return(NULL);
		i_shn++;
	}

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
