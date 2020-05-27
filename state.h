#ifndef _STATE_H
#define _STATE_H

#include "conf.h"
#include "ship.h"

typedef struct resources obj_resources;
struct resources{
	#ifdef T
	#undef T
	#endif
	#define T resources
	#include "submod/cstl/tmpl/obj.h"
	#undef T
	
	int temp;
	};

obj_resources* resourcesFinalize(obj_resources* this);
void resourcesFree(obj_resources* this);
obj_resources* resourcesCopy(obj_resources* this);
//obj_resources* (*copyDeep)(obj_resources* p_struct);



#endif // _STATE_H
