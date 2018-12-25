#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>

#include "conf.h"
#include "state.h"
#include "term.h"


void
clear(){ printf("\033[H\033[J");}
void
gotoxy(int x,int y){printf("\033[%d;%dH",y,x);}
void
resizexy(int x,int y){printf("\033[8;%d;%dt",y,x);}



int 
main(int argc, char **argv){
	resizexy(80,24);

	//struct chfb* p=fb_draw_map(fb_init());
	char c=0;

	//clear();
	//gotoxy(0,0);
	////fb_screen_draw(p);
	//gotoxy(23,23);
	//c=getchar();
	//
	//clear();
	//gotoxy(0,0);
	////fb_screen_draw(p);
	//gotoxy(23,23);
	////fb_free(&p);
	//fprintf(stdout,"%p",(void*)fb_init());

	//struct ship* s=ship_init(0);
	//ship_free(&s);
	//fprintf(stderr,"\n!%p!\n",(void*)s);
	//struct ply* s=ply_init(0,1);
	//ship_free(&s);
	//fprintf(stderr,"\n!%p!\n",(void*)s);
	//
	
	
	struct state* s=state_init(2);
	fprintf(stderr,"\n!init!%p!\n",(void*)s);
	fprintf(stderr,"\n!init!&%p!\n",(void*)&s);
	state_free(&s);
	fprintf(stderr,"\n!free!%p!\n",(void*)s);
	c=getchar();

//	struct ply* s=ply_init(1);
//	fprintf(stderr,"\n!init!%p!\n",(void*)s);
//	ply_free(&s);
//	fprintf(stderr,"\n!free!%p!\n",(void*)s);
//	return(EXIT_SUCCESS);
}
