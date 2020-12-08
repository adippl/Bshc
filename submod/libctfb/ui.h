#ifndef _CTFB_UI_H
#define _CTFB_UI_H

#include "conf.h"
#include "term.h"
#include "draw.h"
#include "input.h"

uint16_t input_int(char* arr);
uint16_t input_int_range(char* arr, uint16_t max);

int
ctfb_winYN(	obj_ctfb *this,
			wchar_t *msg,
			size_t maxstrlen);

#endif // _CTFB_UI_H
