#ifndef SCREEN_H
#define SCREEN_H

#include "conf.h"

struct	chfb { //char map buffer
	int sizex;
	int sizey;
	int area;
	char* fbtb_ptr;	//char buffer table pointer
};

#endif	//SCREEN_H
