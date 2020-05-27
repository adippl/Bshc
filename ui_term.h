#ifndef SCREEN_H
#define SCREEN_H

#include "conf.h"
#include "state.h"
#include <string.h>

uint16_t aim_and_shoot(struct state* state_ptr);

char fb_inputInputShipsAndDraw(struct ctfb* ctfb_ptr, struct state* state_ptr,unsigned char pln);

//void  input_int(char* arr, uint16_t* input_var);
uint16_t input_int(char* arr);
const wchar_t FRAMECHARS[11];	//utf box drawing characters

const unsigned char PLAYER_COL[2][3];

struct ctfb* fb_drawMap(struct ctfb* ctfb);	//draws map on framebuffer 
void fb_clear_and_map(struct ctfb* ctfb_ptr);	//clears fb and redraws the map

void fb_draw_ship_single(struct ctfb* ctfb_ptr, struct ship* ship_ptr, char color_code);	//draws single ship on buffer passed to it via ctfb_ptr
void fb_draw_ships(struct ctfb* ctfb_ptr, struct state* state_ptr, unsigned char noarg, ...);	//draws all ships belonging to the player (ply_ptr) on ctfb_ptr. noarg - number of players to draw, min 1, must be > than state_ptr->nopl, ... - numbers of players to draw

void fb_draw_ship_single_f(state* state_ptr, ship* ship_ptr, void* v_ctfb_ptr);
#endif	//SCREEN_H
