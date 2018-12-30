#ifndef SCREEN_H
#define SCREEN_H

#include "conf.h"
#include "state.h"

const wchar_t FRAMECHARS[11];	//utf-8 box drawing characters

struct	chfb { //char frame buffer
	int sizex;	//frame size x
	int sizey;	//frame size y
	int area;	//frame area
	int msizex;	//map size x
	int msizey;	//map size y
	int marea;	//map area
	wchar_t* fbtb_ptr;	//utf-32 character buffer table pointer 
	unsigned char* frmt_ptr;	//pointer to an array of text formatting arguments max 3; eatch dimension is another argument

	void (*free)(struct chfb**);		//"destructor" self_ptr->free(&self_self);
};


void clear();	//clears terminal (prints to stdout)
void gotoxy(int x,int y);	//changes cursor position (prints to stdout)
void resizexy(int x,int y);	//resizes terminal window (prints to stdout)
void prtnch(wchar_t chr, unsigned char nofarg,...);	//prints utf8 char with ANSI escape code specific formating; 1=<nofarg=<3

struct chfb* fb_init();		//allocates chfb struct
#define chfb() fb_init()	//"constructor"
void fb_free(struct chfb** chfb);	//frees memory of chfb struct; changes pointer to null

void fb_screen_draw_bw(struct chfb* chfb);	//draws screen, chars only
void fb_screen_draw(struct chfb* chfb);		//draws screen with formatting

struct chfb* fb_draw_map(struct chfb* chfb);	//draws map on framebuffer 

void fb_draw_ships(struct chfb*);	//d
void fb_draw_ship_single(struct chfb* chfb_ptr, struct ship* ship_ptr, char color_code);

char* fb_input_ships_and_draw(struct chfb* chfb_ptr, struct state* state_ptr, char pln);
#endif	//SCREEN_H
