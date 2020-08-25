#ifndef _ENCOUNTER_PLAYER_H
#define _ENCOUNTER_PLAYER_H

#include "conf.h"
#include "ship_TTU.h"

typedef struct encPlayer obj_encPlayer;
struct encPlayer{
	char*	playerName;
	TEMPLATE3(arr,arrStrct,obj_ship) ships;
	};

obj_encPlayer*	TEMPLATE(obj_encPlayer,finalize)(obj_encPlayer* this);
void		TEMPLATE(obj_encPlayer,clean)(obj_encPlayer* this);
void		TEMPLATE(obj_encPlayer,copyTo)(obj_encPlayer* this, obj_encPlayer* dest);
obj_encPlayer*	TEMPLATE(obj_encPlayer,print)(obj_encPlayer* this);

#endif // _ENCOUNTER_PLAYER_H
