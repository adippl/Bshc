#ifndef _MAP_H
#define _MAP_H

#include "encMapChunk_TTU.h"

#define MAP(Z,Y,X) Z->chunksx*(Y)+(X)

typedef struct map obj_encMap;
struct map{
	unsigned int chunksx;
	unsigned int chunksy;
	unsigned int mapsx;
	unsigned int mapsy;
	unsigned int chtotal;
	char* mapName;
	TEMPLATE3(arr,arrStrct,obj_encMapChunk) chunks;
	};

obj_encMap*	TEMPLATE(obj_encMap,finalize)(obj_encMap* this);
void		TEMPLATE(obj_encMap,clean)(obj_encMap* this);
void		TEMPLATE(obj_encMap,copy)(obj_encMap* this, obj_encMap* dest);
obj_encMap*	TEMPLATE(obj_encMap,print)(obj_encMap* this);

int	mapParse(obj_encMap* this, json_stream* js);

void	mapUpdateSize(obj_encMap* this);
void	mapGenerateChunkIndexes(obj_encMap* this);

obj_encMapChunk* mapGetPtrToChunk(obj_encMap* this, unsigned int globalx, unsigned int globaly);
struct mapTile* mapGetPtrTo_mapTile(obj_encMap* this, unsigned int globalx, unsigned int globaly);

#endif // _MAP_H
