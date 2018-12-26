#ifndef SCREEN_H
#define SCREEN_H

#include "conf.h"

struct	chfb { //char frame buffer
	int sizex;	//frame size x
	int sizey;	//frame size y
	int area;	//frame area
	int msizex;	//map size x
	int msizey;	//map size y
	int marea;	//map area
	char* fbtb_ptr;	//char buffer table pointer
};

void clear();	//clears terminal (prints to stdout)
void gotoxy(int x,int y);	//changes cursor position (prints to stdout)
void resizexy(int x,int y);	//resizes terminal window (prints to stdout)

struct chfb* fb_init();		//allocates chfb struct
void fb_free(struct chfb** chfb);	//frees memory of chfb struct; changes pointer to null
void fb_screen_draw(struct chfb* chfb);

struct chfb* fb_draw_map(struct chfb* chfb); 

#endif	//SCREEN_H
