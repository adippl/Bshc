#ifndef UI_H
#define UI_H

#include "conf.h"
#include "state.h"
#include "term.h"

uint16_t aim_and_shoot(struct state* state_ptr);

char fb_input_ships_and_draw(struct ctfb* ctfb_ptr, struct state* state_ptr,unsigned char pln);

//void  input_int(char* arr, uint16_t* input_var);
uint16_t input_int(char* arr);
#endif // UI_H
