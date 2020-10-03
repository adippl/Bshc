
#ifndef _MAP_CPOINT_H
#define _MAP_CPOINT_H

#include "conf.h"
#include "ship_TTU.h"
#include "parse.h"

typedef struct mapCpoint obj_mapCpoint;
struct mapCpoint{
	char* mapCpointName;
	int64_t mapCpointx;
	int64_t mapCpointy;
	TEMPLATE3(arr,arrStrct,obj_ship) ships;
	};

obj_mapCpoint*	OBJF(obj_mapCpoint,finalize)(obj_mapCpoint* this);
void		OBJF(obj_mapCpoint,clean)(obj_mapCpoint* this);
void		OBJF(obj_mapCpoint,copy)(obj_mapCpoint* this, obj_mapCpoint* dest);
obj_mapCpoint*	OBJF(obj_mapCpoint,print)(obj_mapCpoint* this);

int	mapCpointParse(obj_mapCpoint* this, json_stream* js);

void	mapCpointUpdateSize(obj_mapCpoint* this);

#endif // _MAP_CPOINT_H
