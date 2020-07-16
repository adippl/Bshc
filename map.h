#ifndef _MAP_H
#define _MAP_H

#include "mapChunk_TTU.h"

#define MAP(Z,Y,X) Z->chunksx*(Y)+(X)

typedef struct map obj_map;
struct map{
	unsigned int chunksx;
	unsigned int chunksy;
	unsigned int mapsx;
	unsigned int mapsy;
	unsigned int chtotal;
	char* mapName;
	TEMPLATE3(arr,arrStrct,obj_mapChunk) chunks;
	};

obj_map*	TEMPLATE(obj_map,finalize)(obj_map* this);
void		TEMPLATE(obj_map,clean)(obj_map* this);
void		TEMPLATE(obj_map,copyTo)(obj_map* this, obj_map* dest);
obj_map*	TEMPLATE(obj_map,print)(obj_map* this);

int	mapParse(obj_map* this, json_stream* js);

void	mapUpdateSize(obj_map* this);
void	mapGenerateChunkIndexes(obj_map* this);

obj_mapChunk* mapGetPtrToChunk(obj_map* this, unsigned int globalx, unsigned int globaly);
struct mapTile* mapGetPtrTo_mapTile(obj_map* this, unsigned int globalx, unsigned int globaly);

#endif // _MAP_H
