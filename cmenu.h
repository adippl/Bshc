#ifndef _CMENU_H
#define _CMENU_H

#include "conf.h"

#define CMENU_MAX_SIZE 10
#define CMENU_KEY_SIZE 10

/* suimple menu */
typedef struct cmenu{
	char title[SSTRLENG];
	int mode;
	int entryCount;
	char entry[CMENU_MAX_SIZE][CMENU_KEY_SIZE];
	char entryDescription[CMENU_MAX_SIZE][SSTRLENG];
	}obj_cmenu;

int cmenuPromptUser(obj_cmenu* menu);



#endif // _CMENU_H
