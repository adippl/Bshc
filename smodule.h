#ifndef _MODULE_H
#define _MODULE_H

#include "conf.h"

typedef struct module obj_module;
struct module{
	#ifdef T
	#undef T
	#endif
	#define T module
	#include "submod/cstl/tmpl/obj.h"
	#undef T
	
	int temp;
	};

obj_module* moduleFinalize(obj_module* this);
void moduleFree(obj_module* this);
obj_module* moduleCopy(obj_module* this);
//obj_module* (*copyDeep)(obj_module* p_struct);

//#ifdef T
//#undef T
//#endif
//#define T obj_module
//#include "submod/cstl/tmpl/arr.h"

#endif // _MODULE_H
