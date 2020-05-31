#ifndef _MODULE_H
#define _MODULE_H

#include "conf.h"

typedef struct smodule obj_smodule;
struct smodule{
	#ifdef T
	#undef T
	#endif
	#define T smodule
	#include "submod/cstl/tmpl/obj.h"
	#undef T
	
	int smodType;
	char* name;
	int hp;
	int powergen;
	int manuver;
	int ap;
	int view;
	};

obj_smodule* smoduleFinalize(obj_smodule* this);
void smoduleFree(obj_smodule* this);
obj_smodule* smoduleCopy(obj_smodule* this);
//obj_smodule* (*copyDeep)(obj_smodule* p_struct);

#endif // _MODULE_H
