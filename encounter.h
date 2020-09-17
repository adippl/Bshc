#ifndef _ENCOUNTER_H
#define _ENCOUNTER_H

#include "conf.h"
#include "parse.h"
#include "map.h"
#include "player.h"
#include "playerTTU.h"


typedef struct encounter obj_encounter;
struct encounter{
	char* encounterName;
	obj_map map;
	TEMPLATE3(arr,arrStrct,obj_player) players;
	};

obj_encounter*	OBJF(obj_encounter,finalize)(obj_encounter* this);
void		OBJF(obj_encounter,clean)(obj_encounter* this);
void		OBJF(obj_encounter,copy)(obj_encounter* this, obj_encounter* dest);
void	OBJF(obj_encounter,print)(obj_encounter* this);

int		encounterSetupMap(int chunksx, int chunksy);
int		encounterSetupPlayers(int chunksx, int chunksy);

int		encounterParse(obj_encounter* this, json_stream* js);

#endif // _ENCOUNTER_H
