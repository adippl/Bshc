#ifndef UI_H
#define UI_H

#include "conf.h"
#include "state.h"
#include "term.h"

void screen_clear_area(uint16_t x, uint16_t y, uint16_t xm, uint16_t ym);

char* fb_input_ships_and_draw(struct chfb* chfb_ptr, struct state* state_ptr, char pln);

#endif // UI_H
