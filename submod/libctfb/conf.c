#include "conf.h"
const uint16_t __VERS=0;


#ifdef DEBUG
void* ctvc2ArrDump(void* obj){
	NULL_P_CHECK(obj);
	fprintf(stderr,"vec %p, x=%u y=%u\n",obj,((ctvc2*)obj)->x,((ctvc2*)obj)->x);
	return(NULL);}
#endif
