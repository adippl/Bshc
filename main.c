#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

#include "main.h"
//#include "state.h"

void
clear(){ printf("\033[H\033[J");}
void
gotoxy(int x,int y){printf("\033[%d;%dH",y,x);}
void
resizexy(int x,int y){printf("\033[8;%d;%dt",y,x);}




struct ship{
	bool shdir;	//ship direction 0=vertical 1=horizontal //gcc BOLLOCKS
	char shsize;	//ship size
	char sax;	//anchor x cord (Ship Anchor x)
	char say;	//anchor y cord
	char hp;	//100% hp == shsize	0 --> destroyed
	char* hits;	//hits
	struct ply* ply;	//pointer to player (owner)
};

struct ply{
	char pln;	//player number
	char nsh3;	//number of their ships (sh3)
	char nsh4;	//number of their ships (sh4)
	char nsh5;	//number of their ships (sh5)
	int shtbl_size;	//size of ship tbl
	struct ship** shtblptr; //array of pointers to players ships
};
struct state{
	int sizex; 		//mapsize
	int sizey;	 	//mapsize
	struct ship** map_ptr; 	//pointer to 2d array of pointers to ships
	char nopl;		//number of player
	struct ply** ply_ptr;	//pointer to array of player(s) structs
	int state; 		//game state
};



struct ship*
init_ship(int size, struct ply* ply_ptr){
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
	sh_ptr->ply=ply_ptr;

	return(sh_ptr);
}

struct ply*
init_ply(int pln){
	if(pln<1)return(NULL);

	struct ply* ply_ptr=malloc(sizeof(struct ply));
	if(!ply_ptr) return(NULL);

	ply_ptr->pln=pln;
	ply_ptr->nsh3=MAX_NSH3;
	ply_ptr->nsh4=MAX_NSH4;
	ply_ptr->nsh5=MAX_NSH5;
	ply_ptr->shtbl_size=MAX_NSH3+MAX_NSH4+MAX_NSH5;

	ply_ptr->shtblptr=malloc(sizeof(struct ship*)*ply_ptr->shtbl_size);
	if(!ply_ptr->shtblptr) return(NULL);

	int i_shn=0;	//ship number iterator
	for(int j=0;j<MAX_NSH3;j++){
		*(ply_ptr->shtblptr+i_shn)=init_ship(MAX_NSH3,ply_ptr);
		if(!*(ply_ptr->shtblptr+i_shn)) return(NULL);
		i_shn++;
	}
	for(int j=0;j<MAX_NSH4;j++){
		*(ply_ptr->shtblptr+i_shn)=init_ship(MAX_NSH4,ply_ptr);
		if(!*(ply_ptr->shtblptr+i_shn)) return(NULL);
		i_shn++;
	}
	for(int j=0;j<MAX_NSH5;j++){
		*(ply_ptr->shtblptr+i_shn)=init_ship(MAX_NSH5,ply_ptr);
		if(!*(ply_ptr->shtblptr+i_shn)) return(NULL);
		i_shn++;
	}

	return(ply_ptr);
}

struct state*
init_state(int nopl){ //Func input nopl - number of players
	
	int mapsize=(SIZE_X*2+2)*(SIZE_Y*2+2);
	struct state* state_ptr=malloc(sizeof(struct state));
	if(!state_ptr) return(NULL);

	state_ptr->sizex=SIZE_X;
	state_ptr->sizey=SIZE_Y;
	state_ptr->map_ptr=malloc(sizeof(char*)*mapsize);
	if(!state_ptr->map_ptr) return(NULL);
	for(int i=0;i<SIZE_X*SIZE_Y;i++){
		*(state_ptr->map_ptr+i)=NULL;
	}

	state_ptr->nopl=nopl;
	state_ptr->ply_ptr=malloc(sizeof(struct ply*)*nopl);
	if(!state_ptr->ply_ptr) return(NULL);

	for(int i=0;i<nopl-1;i++){
		*(state_ptr->ply_ptr+i)=init_ply(i);
		if(!state_ptr->ply_ptr+i) return(NULL);
	}
	state_ptr->state=0;
	
	return(state_ptr);
}
struct	chfb { //char map buffer
	int sizex;
	int sizey;
	int area;
	char* fbtb_ptr;	//char buffer table pointer
};
struct chfb*
fb_init(){
	struct chfb* chfb=malloc(sizeof(struct chfb*));
	if(!chfb)return(NULL);

	chfb->sizex=SIZE_X*2+1;
        chfb->sizey=SIZE_Y*2+1;
        chfb->area=chfb->sizex*chfb->sizey;
	 
	chfb->fbtb_ptr=malloc(sizeof(char)*chfb->area);
	if(!chfb->fbtb_ptr)return(NULL);
	for(int i=0;i<chfb->area;i++){
		*(chfb->fbtb_ptr+i)=' ';
	}
	return(chfb);
}
struct chfb*
fb_draw_map(struct chfb* chfb){
	if(!chfb)return(NULL);
	//char (*fb_ptr)[chfb->sizey][chfb->sizex]=chfb->chfb;
	int k=0;
	for(int i=0;i<chfb->sizey;i++){
		for(int j=0;j<chfb->sizex;j++){
			if(i%2==1&&j%2==1){
				*(chfb->fbtb_ptr+i*chfb->sizex+j)='+';
			}else if(j%2==0&&i%2==1){
				*(chfb->fbtb_ptr+i*chfb->sizex+j)='-';
			}else if(j%2==1&&i%2==0){
				*(chfb->fbtb_ptr+i*chfb->sizex+j)='|';
			}
			else{
				*(chfb->fbtb_ptr+i*chfb->sizex+j)=' ';
			}
		}
	}
	k=3;
	for(int j=2;j<chfb->sizex;j+=2){
		*(chfb->fbtb_ptr+0*chfb->sizex+j)=j/2+47;	//+47 converts j into number
		
	}
	for(int i=2;i<chfb->sizex;i+=2){
		*(chfb->fbtb_ptr+i*chfb->sizex+0)=i/2+47+49;	//+47 converts i into number, +49 converts it into a letter
	}


	return(chfb);
}
void
fb_screen_draw(struct chfb* chfb){
	if(!chfb)exit(11);

	int k=0;
	for(int i=0;i<chfb->sizey;i++){
		for(int j=0;j<chfb->sizex;j++){
			fprintf(stdout,"%c",*(chfb->fbtb_ptr+i*chfb->sizex+j));
		}
		fprintf(stdout,"\n");
	}
}
void
fb_free(struct chfb* chfb){	//Func frees memory of chfb struct; changes pointer to null
	if(!chfb)exit(11);
//	fprintf(stdout,"\n!%p!\n",(void*)chfb);
	free(chfb->fbtb_ptr);
	free(chfb);
	chfb=NULL;
//	fprintf(stdout,"\n!%p!\n",(void*)chfb);
}



int 
main(int argc, char **argv){
	resizexy(80,24);

	struct chfb* p=fb_draw_map(fb_init());
	char c=0;

	clear();
	gotoxy(0,0);
	fb_screen_draw(p);
	gotoxy(23,23);
	c=getchar();
	
	clear();
	gotoxy(0,0);
	fb_screen_draw(p);
	gotoxy(23,23);
	fb_free(p);
	//p=NULL;
	//fprintf(stderr,"\n!%p!\n",(void*)p);
	fprintf(stderr,"\n!%p!\n",p);
	c=getchar();

	return(0);
}
