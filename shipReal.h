#ifndef _SHIPREAL_H
#define _SHIPREAL_H

#include "conf.h"
#include "ship_TTU.h"
//#include "parse.h"

typedef struct shipReal obj_shipReal;
struct shipReal{
	//#ifdef T
	//#undef T
	//#endif
	//#define T shipReal
	//#include "submod/cstl/tmpl/obj.h"
	//#undef T
	
	obj_ship shipbase;
	int shipRealID;
	char* sname;
	int sizex;
	int sizey;
	int centerx;
	int centery;
	int hp;
	int armor;
	int water;
	int drag;
	int power;
	int manuver;
	int ap;
	int view;
	int visibility;
	//TEMPLATE3(arr,arrStrct,obj_smodule) modules;
	};

obj_shipReal* TEMPLATE(obj_shipReal,finalize)(obj_shipReal* this);
void TEMPLATE(obj_shipReal,clean)(obj_shipReal* this);
//obj_shipReal* TEMPLATE(obj_shipReal,copy)(obj_shipReal* this);

//int shipRealParse(obj_shipReal* this, json_stream* js);

//void* TEMPLATE(obj_shipReal,print)(void* p_obj);

void obj_shipReal_initShipBase(obj_shipReal* this,obj_ship* shipBaseSrc);


void*	TEMPLATE(obj_shipReal,print)(void* ap_obj);

#endif // _SHIPREAL_H

