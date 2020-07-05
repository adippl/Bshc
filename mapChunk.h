#ifndef _MAP_CHUNK_H
#define _MAP_CHUNK_H

#include "conf.h"
#include "ship.h"
#include "parse.h"

#define MAP_CHUNK_SIZE 32

struct mapTile{
	obj_ship* ship;
	/*char terr; more to add later */
	};

typedef struct mapChunk obj_mapChunk;
struct mapChunk{
	int posx;
	int posy;
	struct mapTile map2d[MAP_CHUNK_SIZE][MAP_CHUNK_SIZE];
	//union{
	//	struct mapTile map2d[MAP_CHUNK_CHUNK_SIZE][MAP_CHUNK_CHUNK_SIZE];
	//	struct mapTile map1d[MAP_CHUNK_CHUNK_SIZE*MAP_CHUNK_CHUNK_SIZE];
	//	};
	};

void*	TEMPLATE(mapTile,print)(void* this);
obj_mapChunk* TEMPLATE(obj_mapChunk,finalize)(obj_mapChunk* this);
void	TEMPLATE(obj_mapChunk,clean)(obj_mapChunk* this);

obj_mapChunk* TEMPLATE(obj_mapChunk,copyTo)(obj_mapChunk* this,obj_mapChunk* dest);
void*	TEMPLATE(obj_mapChunk,print)(void* ap_obj);
#endif // _MAP_CHUNK_H
