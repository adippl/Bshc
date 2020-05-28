#ifndef _STATE_H
#define _STATE_H

#include "conf.h"
#include "ship.h"
#include "ship_TTU.h"

typedef struct resources obj_resources;
struct resources{
	#ifdef T
	#undef T
	#endif
	#define T resources
	#include "submod/cstl/tmpl/obj.h"
	#undef T
	
	TEMPLATE3(arr,arrStrct,obj_ship) shipTeplates;
	};

obj_resources* resourcesFinalize(obj_resources* this);
void resourcesFree(obj_resources* this);
obj_resources* resourcesCopy(obj_resources* this);



#endif // _STATE_H
