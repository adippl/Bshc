#ifndef CONF_H
#define CONF_H

#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdbool.h>
#include <time.h>
#include <locale.h>


extern const int FSIZE_X,FSIZE_Y;	//frame size FSIZE_X=SIZE_X*2+1 FSIZE_Y=SIZE_Y*2+1+11
extern const int SIZE_X,SIZE_Y;		//map size
extern const int SH3L,SH4L,SH5L;	//ship length
extern const int MAX_NSH3,MAX_NSH4,MAX_NSH5;	//max ammount of ships


#endif // CONF_H

