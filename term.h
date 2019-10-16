#ifndef SCREEN_H
#define SCREEN_H

#include "conf.h"
#include "state.h"

const wchar_t FRAMECHARS[11];	//utf box drawing characters

const unsigned char PLAYER_COL[2][3];

//struct	ctfb { //char frame buffer
//	int sizex;	//frame size x
//	int sizey;	//frame size y
//	int area;	//frame area
//	int msizex;	//map size x
//	int msizey;	//map size y
//	int marea;	//map area
//	wchar_t* fbtb_ptr;	//utf-32 character buffer table pointer 
//	unsigned char* frmt_ptr;	//pointer to an array of text formatting arguments max 3; eatch dimension is another argument
//
//	void (*free)(struct ctfb**);		//"destructor" self_ptr->free(&self_self);
//	void (*cleanm)(struct ctfb*);		//clears fb and redraws the map self_ptr->cleanm(&self_self);
//
//	struct ctfb* (*draw_map)(struct ctfb*);		//draw map self_ptr->draw_map(&self_self);
//};


//void clear();	//clears terminal (prints to stdout)
//void gotoxy(int x,int y);	//changes cursor position (prints to stdout)
//void resizexy(int x,int y);	//resizes terminal window (prints to stdout)
//void prtnch(wchar_t chr, unsigned char nofarg,...);	//prints utf8 char with ANSI escape code specific formating; 1=<nofarg=<3

//struct ctfb* fb_init();		//allocates ctfb struct
//void fb_free(struct ctfb** ctfb);	//frees memory of ctfb struct; changes pointer to null

//void fb_screen_draw_bw(struct ctfb* ctfb);	//draws screen, chars only
//void fb_screen_draw(struct ctfb* ctfb);		//draws screen with formatting

struct ctfb* fb_draw_map(struct ctfb* ctfb);	//draws map on framebuffer 
void fb_clear_and_map(struct ctfb* ctfb_ptr);	//clears fb and redraws the map

void fb_draw_ship_single(struct ctfb* ctfb_ptr, struct ship* ship_ptr, char color_code);	//draws single ship on buffer passed to it via ctfb_ptr
void fb_draw_ships(struct ctfb* ctfb_ptr, struct state* state_ptr, unsigned char noarg, ...);	//draws all ships belonging to the player (ply_ptr) on ctfb_ptr. noarg - number of players to draw, min 1, must be > than state_ptr->nopl, ... - numbers of players to draw

void fb_draw_ship_single_f(state* state_ptr, ship* ship_ptr, void* v_ctfb_ptr);
#endif	//SCREEN_H
