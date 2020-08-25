#ifndef _ENCOUNTER_H
#define _ENCOUNTER_H

#include "conf.h"
#include "encMap.h"
#include "encPlayer.h"
#include "encPlayerTTU.h"


typedef struct encounter obj_encounter;
struct encounter{
	char* encounterName;
	obj_encMap map;
	TEMPLATE3(arr,arrStrct,obj_encPlayer) players;
	};

obj_encounter*	TEMPLATE(obj_encounter,finalize)(obj_encounter* this);
void		TEMPLATE(obj_encounter,clean)(obj_encounter* this);
void		TEMPLATE(obj_encounter,copy)(obj_encounter* this, obj_encounter* dest);
void	TEMPLATE(obj_encounter,print)(obj_encounter* this);

#endif // _ENCOUNTER_H
