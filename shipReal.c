#include "shipReal.h"

obj_shipReal*
TEMPLATE(obj_shipReal,finalize)(obj_shipReal* this){
	NULL_P_CHECK(this);
	this->sname=calloc(SSTRLENG,sizeof(char));
	TEMPLATE(obj_ship,finalize)(&this->shipbase);
	return(this);}

void
TEMPLATE(obj_shipReal,clean)(obj_shipReal* this){
	TEMPLATE(obj_ship,clean)(&this->shipbase);
	free(this->sname);
	NULL_P_CHECK(this);
	return;}

//obj_shipReal* TEMPLATE(obj_shipReal,copy)(obj_shipReal* this);

//obj_ship* TEMPLATE(obj_ship,copyTo)(obj_ship* this,obj_ship* dest);

/*
obj_ship*
TEMPLATE(obj_shipReal,copy)(obj_ship* this){
	NULL_P_CHECK(this);
*/

void
obj_shipReal_initShipBase(obj_shipReal* this,obj_ship* shipBaseSrc){
	NULL_P_CHECK(this);
	NULL_P_CHECK(shipBaseSrc);
	
	obj_ship_copyTo(shipBaseSrc,&this->shipbase);
	
	_STRUCTCOPPIER_E(this,this->shipbase,sizex);
	_STRUCTCOPPIER_E(this,this->shipbase,sizey);
	_STRUCTCOPPIER_E(this,this->shipbase,centerx);
	_STRUCTCOPPIER_E(this,this->shipbase,centery);
	_STRUCTCOPPIER_E(this,this->shipbase,hp);
	_STRUCTCOPPIER_E(this,this->shipbase,armor);
	_STRUCTCOPPIER_E(this,this->shipbase,water);
	_STRUCTCOPPIER_E(this,this->shipbase,drag);
	_STRUCTCOPPIER_E(this,this->shipbase,manuver);
	_STRUCTCOPPIER_E(this,this->shipbase,ap);
	_STRUCTCOPPIER_E(this,this->shipbase,view);
	_STRUCTCOPPIER_E(this,this->shipbase,visibility);
	strncpy(this->sname,this->shipbase.sname,SSTRLENG);

	return;}

void*
TEMPLATE(obj_shipReal,print)(void* ap_obj){
	NULL_P_CHECK(ap_obj);
	obj_shipReal* this=(obj_shipReal*) ap_obj;
	fprintf(stderr,"\ndumping obj_shipReal %p\n",(void*)this);
	DUMP_STRUCT_int(this,shipRealID);
	DUMP_STRUCT_string(this,sname);
	DUMP_STRUCT_int(this,sizex);
	DUMP_STRUCT_int(this,sizey);
	DUMP_STRUCT_int(this,centerx);
	DUMP_STRUCT_int(this,centery);
	DUMP_STRUCT_int(this,hp);
	DUMP_STRUCT_int(this,armor);
	DUMP_STRUCT_int(this,water);
	DUMP_STRUCT_int(this,drag);
	DUMP_STRUCT_int(this,manuver);
	DUMP_STRUCT_int(this,ap);
	DUMP_STRUCT_int(this,view);
	DUMP_STRUCT_int(this,visibility);
	fprintf(stderr,"obj_shipReal's obj_ship baseship at %p:\n",(void*)&this->shipbase);
	TEMPLATE(obj_ship,print)(&this->shipbase);
	fprintf(stderr,"\nEND of obj_shipReal %p\n",(void*)this);
	return(NULL);}
