#ifndef _MODULE_H
#define _MODULE_H

#include "conf.h"
#include "parse.h"

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
	int posx;
	int posy;
	int hp;
	int armor;
	int powergen;
	int hitChance;
	int ap;
	int apGen;
	bool external;

	int curr_hp;
	int curr_armor;
	};

obj_smodule*	TEMPLATE(obj_smodule,finalize)(obj_smodule* this);
void		TEMPLATE(obj_smodule,free)(obj_smodule* this);
void		TEMPLATE(obj_smodule,clean)(obj_smodule* this);
/*obj_smodule*	TEMPLATE(obj_smodule,copy)(obj_smodule* this);*/
void		TEMPLATE(obj_smodule,copy)(obj_smodule* this, obj_smodule* dest);
obj_smodule*	TEMPLATE(obj_smodule,print)(obj_smodule* this);

int smoduleParse(obj_smodule* this, json_stream* js);
#endif // _MODULE_H
