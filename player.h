#ifndef _ENCOUNTER_PLAYER_H
#define _ENCOUNTER_PLAYER_H

#include "conf.h"
#include "ship_TTU.h"
#include "genericTypesTTU.h"

/* obj_player holds 2 arrays
 *
 * ships array holds generic ships outside of acrive world.
 *  these ships can be serialized with object for game saves
 *  or for some  other reason (ex. parked on some planet, idk)
 * 
 * shipIDs refer to UIDs (unique ids) handled by the map and cpoints
 * to find precise info/location, querry world for ship's location
 */


typedef struct player obj_player;
struct player{
	char*	playerName;
	int		playerId;

	TEMPLATE3(arr,arrStrct,obj_ship) ships;
	TEMPLATE3(arr,arrStrct,int) shipIDs;
	};

obj_player*	OBJF(obj_player,finalize)(obj_player* this);
void		OBJF(obj_player,clean)(obj_player* this);
void		OBJF(obj_player,copy)(obj_player* this, obj_player* dest);
void	OBJF(obj_player,print)(obj_player* this);

#endif // _ENCOUNTER_PLAYER_H
