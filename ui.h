#ifndef UI_H
#define UI_H

#include "conf.h"
#include "state.h"
#include "term.h"

uint16_t screen_clear_area(uint16_t x, uint16_t y, uint16_t xm, uint16_t ym);
uint16_t aim_and_shoot(struct state* state_ptr);

char fb_input_ships_and_draw(struct chfb* chfb_ptr, struct state* state_ptr,unsigned char pln);

#endif // UI_H
