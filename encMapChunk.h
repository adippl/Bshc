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

typedef struct mapChunk obj_encMapChunk;
struct mapChunk{
	unsigned int posx;
	unsigned int posy;
	struct mapTile map2d[MAP_CHUNK_SIZE][MAP_CHUNK_SIZE];
	//union{
	//	struct mapTile map2d[MAP_CHUNK_CHUNK_SIZE][MAP_CHUNK_CHUNK_SIZE];
	//	struct mapTile map1d[MAP_CHUNK_CHUNK_SIZE*MAP_CHUNK_CHUNK_SIZE];
	//	};
	};

void*	TEMPLATE(mapTile,print)(void* this);
obj_encMapChunk* TEMPLATE(obj_encMapChunk,finalize)(obj_encMapChunk* this);
void	TEMPLATE(obj_encMapChunk,clean)(obj_encMapChunk* this);

obj_encMapChunk* TEMPLATE(obj_encMapChunk,copy)(obj_encMapChunk* this,obj_encMapChunk* dest);
void*	TEMPLATE(obj_encMapChunk,print)(void* ap_obj);


struct mapTile*
mapChunkGetTile(obj_encMapChunk* this, unsigned int globalx, unsigned int globaly);




#endif // _MAP_CHUNK_H




