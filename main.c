#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

#include "state.h"
#include "conf.h"


void
clear(){ printf("\033[H\033[J");}
void
gotoxy(int x,int y){printf("\033[%d;%dH",y,x);}
void
resizexy(int x,int y){printf("\033[8;%d;%dt",y,x);}

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
	//char (*fb_ptr)[chfb->sizey][chfb->sizex]=chfb->chfb; //may be outdated
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

	//struct ship* s=ship_init(0);
	//ship_free(&s);
	//fprintf(stderr,"\n!%p!\n",(void*)s);
	//struct ply* s=ply_init(0,1);
	//ship_free(&s);
	//fprintf(stderr,"\n!%p!\n",(void*)s);
	struct state* s=state_init(2);
	fprintf(stderr,"\n!init!%p!\n",(void*)s);
	state_free(&s);
	fprintf(stderr,"\n!free!%p!\n",(void*)s);
	c=getchar();

	return(EXIT_SUCCESS);
}
