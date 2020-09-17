#ifndef _MAP_H
#define _MAP_H

#include "conf.h"
#include "ship_TTU.h"
#include "parse.h"

typedef struct map obj_map;
struct map{
	char* mapName;
	int64_t mapsx;
	int64_t mapsy;
	TEMPLATE3(arr,arrStrct,obj_ship) ships;
	};

obj_map*	OBJF(obj_map,finalize)(obj_map* this);
void		OBJF(obj_map,clean)(obj_map* this);
void		OBJF(obj_map,copy)(obj_map* this, obj_map* dest);
obj_map*	OBJF(obj_map,print)(obj_map* this);

int	mapParse(obj_map* this, json_stream* js);

void	mapUpdateSize(obj_map* this);

#endif // _MAP_H
