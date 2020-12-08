#ifdef T
#include "tmpl.h"

//#define TMapstrct TEMPLATE3(harr,Mapstrct,T)

#ifdef DEBUG
#include <stdio.h>
#endif

#ifndef _HARR_GENERIC_
#define _HARR_GENERIC_
typedef struct harrMapStrct harrMapStrct;

struct harrMapStrct{
	T*		seg;
	uint16_t segSize;
	uint16_t segContent;
	int16_t segStartingIndex;
	};
#endif


#define Tstrct TEMPLATE3(harr,strct,T)

typedef struct Tstrct Tstrct;

struct Tstrct{
	struct Tstrct* (*init)();
	void (*free)(struct Tstrct** pp_struct);
	struct Tstrct* (*copy)(struct Tstrct* p_struct);
	struct Tstrct* (*copyDeep)(struct Tstrct* p_struct);
	size_t objSize;
	uint16_t objName;

	
//	void* p_Class;
	void* (*objCopy)(void* p_obj);
	//void* (*objCopyDeep)(struct void* p_obj);
	void* (*objPrint)(void* p_obj);
	
//	uint8_t	growthMethod; /* ==1 lineraly, >2 exponential */ //planned feature
	size_t typeSize;

	uint16_t disableListAppending;	/* forceRealloc */
	uint16_t allocationSize;	/* size of allcate sub arrays in list */
	int16_t iterIndex;
	int16_t writeIndex;
	//int16_t itr;
//	T* p_itr;
//	T* p_witr;
	uint16_t capacity;
	int16_t usedCapacity;
	uint16_t tableCapacity;
	uint16_t tableUsedCapacity;
	harrMapStrct* tableOfMemSegmentInfo;

	uint16_t _tableResizeCounter;
	uint16_t _tableMapResizeCounter;

	};

Tstrct*	TEMPLATE3(harr,Init,T)();
Tstrct*	TEMPLATE3(harr,Copy,T)(Tstrct* p_struct);
void	TEMPLATE3(harr,Free,T)(Tstrct** pp_struct);

int		TEMPLATE3(harr,extendMap,T)(Tstrct* ap_struct);
int		TEMPLATE3(harr,extend,T)(Tstrct* ap_struct);
int		TEMPLATE3(harr,updateIndex,T)(Tstrct* ap_struct);
int		TEMPLATE3(harr,updateIndexAll,T)(Tstrct* ap_struct);

//int		TEMPLATE3(harr,arrarize,T)(Tstrct* ap_struct);

T* TEMPLATE3(harr,iterNext,T)(Tstrct* ap_struct);
T* TEMPLATE3(harr,iterReset,T)(Tstrct* ap_struct);
T* TEMPLATE3(harr,append,T)(Tstrct* ap_struct);

T* TEMPLATE3(harr,getPtrToIndex,T)(Tstrct* ap_struct, uint16_t index, int_fast8_t mode);

void TEMPLATE3(harr,dump,T)(Tstrct* ap_struct);
#endif
