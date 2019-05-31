#ifndef SHIP_H
#define SHIP_H

#include "conf.h"

//struct ship_temp{
//	uint8_t template_id;		// template id
//	uint8_t shsizex;		// ship's size in x dimension
//	uint8_t shsizey;		// ship's size in y dimension
//	uint8_t hp_multiplier;		// hp segment multiplier. 1=>1hp segmements, 2=>2hp segments
//	uint8_t hp_snk_threshold;	// how much hp can ship loose before it sinks
//	uint8_t armor_dt;		// ship's armor damage reduction in points
//	uint8_t armor_dr;		// ship's armor damage reduction in percent
//	uint8_t evasion;		// should be deduced from size, how big of a target ship is. 
//
//	uint8_t ap;			// action points.
//	uint8_t speed;			// cost of traversing a field in action points
//	uint8_t manvrbility;		// cost of turning by 90deg in action points
//
//	uint8_t view_rnge;		// ship's view range
//	uint8_t view_visibility;	// ship's visibility, higher range, lower visibility
//
//	uint16_t mod_tbl_size;		// size of table of modules
//	void* mod_tbl_p;		// pointer to table of modules
//};
////typedef struct ship_temp ship_temp;
//
//
//
//
//struct ship_r{
//	struct ship_temp* shtype;	//pointer to ship's template
//	uint8_t shdir;	//ship direction 0=n 1=e 2=s 3=w
//	uint16_t sax;	//anchor x cord (Ship Anchor x)
//	uint16_t say;	//anchor y cord
//	uint16_t hp;	//current ship's hp
//	uint16_t ap;	//current ship's ap
//	struct fld** sgmnts;	//pointer to an array of pointer to fls (fields) with ship segments
//	struct ply* ply;	//pointer to player (owner)
//
//	void (*free)(struct ship_r**);		//"destructor" self_ptr->free(&self_ptr);
//};
//typedef struct ship_r ship_r;
//
//struct module{
//	uint8_t mod_id;		// module id
//	uint8_t modsizex;	// module size in x dimension
//	uint8_t modsizey;	// module size in y dimension
//	uint8_t modx;		// module placement on ship grid x
//	uint8_t mody;		// module placement on ship grid y
//	uint8_t shdir;		// iship direction 0=n 1=e 2=s 3=w
//	uint8_t hp;		// modules hp
//	uint8_t hitchance;	// how likely it is to be damaged on hit
//	uint8_t critchance;	// chance for critical hit;
//	uint8_t malf_thresh;	// malfunction shreshold
//	uint8_t dest_thresh;	// destruction shreshold shreshold
//	uint8_t dest_dmg;	// damage dealt to the ship when module gets destroyed
//
//	//uint8_t type;		// modules type, 0=passive, 1=weapon, 2=ability
//	wpn* wpn_p;		// pointer to wpn struct, NULL if modules isn't a weapon
//	abilit* abilit_p;	// pointer to abilitier struct, NULL if modules doesn't have stat abilitiers
//
//};
//typedef struct module module;
//
//struct wpn{
//	uint8_t type;		// type modules type, 0=passive, 1=weapon, 2=ability
////	wchar* name;		// pointer to name
//	int8_t  ap_cost;	// cost of activating ability
//	uint8_t fov;		// half of weapons fow. start from default possition and extends to both sizes.
//	uint8_t wpntype;		// wpn type, 0=main battery, 1=secondary battery, 2=anti air, 3=torpedos, 4=rocket, 5=rocket_aa
//	uint8_t nosh;		// number of missiless per salvo
//	uint8_t nosalv;		// number of salvos per turn
//	uint8_t acc;		// accuracy/spread of missiles 
//	uint8_t rld;		// reload in turns
//
//	uint8_t hp_dmg;		// hp damage on hit
//	uint8_t crithitchance;// chance for critical hit
//	float   critdmgmult;	// crit damage multiplier
//
//	uint8_t mod_hit_chance;	// chance to damage modules in ship segment
//	uint8_t mod_dmg;	// hp damage on hit
//
//	uint8_t rnge;		// range
//	uint8_t missl_speed;	// missile speed.
//
//};
//typedef struct wpn wpn;
//
//
//struct abilit{			// 
//	uint8_t type;		// type modules type, 0=passive, 1=weapon, 2=ability
//	uint8_t ab_id;		// ability id
//	uint8_t state;		// state, 0=default, 1=activated, 2=damage, 3=destroyed
//	int8_t  ap_cost;	// cost of activating ability
//	
//	uint16_t nodefmod;			// number of default modifiers
//	struct modifier* defmod_tbl_p;		// pointer to table of define modifiers
//
//	uint16_t noactmod;			// number of modifiers while active
//	struct modifier* actmod_tbl_p;		// pointer to table of modifiers while active
//
//	uint16_t nodmgmod;			// number of modifiers while damaged
//	struct modifier* dmgmod_tbl_p;		// pointer to table of modifiers while damaged
//
//	uint16_t nodstmod;			// number of modifiers while destroyed
//	struct modifier* dstmod_tbl_p;		// pointer to table of modifiers while destroyed
//};
//typedef struct abilit abilit;
//
//struct modifier{
//	uint8_t stat_id;	// id of statistic
//	uint8_t type;		// type of bonus, 0=absolute, 1=percentage
//	uint8_t value;		// bonus value
//};

//struct wpn{
//
//};
//typedef struct wpn wpn;


//typedef struct ship_temp ship_temp;



#endif // SHIP_H
