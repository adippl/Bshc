#ifndef SCREEN_H
#define SCREEN_H

#include "conf.h"

const int32_t FRAMECHARS[11];	//utf-8 box drawing characters

struct	chfb { //char frame buffer
	int sizex;	//frame size x
	int sizey;	//frame size y
	int area;	//frame area
	int msizex;	//map size x
	int msizey;	//map size y
	int marea;	//map area
	int32_t* fbtb_ptr;	//utf-8 character buffer table pointer 
	unsigned char* frmt_ptr;	//pointer to an array of text formatting arguments max 3; eatch dimension is another argument
};


void clear();	//clears terminal (prints to stdout)
void gotoxy(int x,int y);	//changes cursor position (prints to stdout)
void resizexy(int x,int y);	//resizes terminal window (prints to stdout)
void prtnch(int32_t chr, unsigned char nofarg,...);	//prints utf8 char with ANSI escape code specific formating; 1=<nofarg=<3

struct chfb* fb_init();		//allocates chfb struct
void fb_free(struct chfb** chfb);	//frees memory of chfb struct; changes pointer to null
void fb_screen_draw_bw(struct chfb* chfb);
void fb_screen_draw(struct chfb* chfb);

struct chfb* fb_draw_map(struct chfb* chfb); 

#endif	//SCREEN_H
