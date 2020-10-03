#ifndef _ENCOUNTER_PLAYER_H
#define _ENCOUNTER_PLAYER_H

#include "conf.h"
#include "ship_TTU.h"

typedef struct player obj_player;
struct player{
	char*	playerName;
	int		playerId;

	TEMPLATE3(arr,arrStrct,obj_ship) ships;
	};

obj_player*	OBJF(obj_player,finalize)(obj_player* this);
void		OBJF(obj_player,clean)(obj_player* this);
void		OBJF(obj_player,copy)(obj_player* this, obj_player* dest);
void	OBJF(obj_player,print)(obj_player* this);

#endif // _ENCOUNTER_PLAYER_H
