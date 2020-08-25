#ifndef _STATE_H
#define _STATE_H

#include "conf.h"
#include "ship.h"
#include "ship_TTU.h"
#include "parse.h"
#include "encMap.h"

typedef struct resources obj_resources;
struct resources{
	#ifdef T
	#undef T
	#endif
	#define T resources
	#include "submod/cstl/tmpl/obj.h"
	#undef T
	int vers;
	
	TEMPLATE3(arr,arrStrct,obj_ship) shipTemplates;
	obj_encMap map;
	};

obj_resources* resourcesFinalize(obj_resources* this);
void resourcesFree(obj_resources* this);
void resourcesClean(obj_resources* this);
obj_resources* resourcesCopy(obj_resources* this);


int resourcesParse(obj_resources* this, json_stream* js);

int resources_Dump(obj_resources* this);



#endif // _STATE_H
