#ifndef CONF_H
#define CONF_H

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdbool.h>
#include <locale.h>

extern const int FSIZE_X,FSIZE_Y;	//frame size
extern const int SIZE_X,SIZE_Y;		//map size
extern const int SH3L,SH4L,SH5L;	//ship length
extern const int MAX_NSH3,MAX_NSH4,MAX_NSH5;	//max ammount of ships

const int FRAMECHARS[10];	//utf-8 box drawing characters

#endif // CONF_H

