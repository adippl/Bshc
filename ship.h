#ifndef _SHIP_H
#define _SHIP_H

#include "conf.h"
#include "smodule.h"
#include "smodule_TTU.h"
#include "parse.h"

typedef struct ship obj_ship;
struct ship{
	#ifdef T
	#undef T
	#endif
	#define T ship
	#include "submod/cstl/tmpl/obj.h"
	#undef T
	
	int shipTemplateID;
	char* sname;
	char* sclass;
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

	int curr_hp;
	int curr_armor;
	int curr_water;
	int curr_drag;
	int curr_power;
	int curr_manuver;
	int curr_ap;
	int curr_view;
	int curr_visibility;
	TEMPLATE3(arr,arrStrct,obj_smodule) modules;
	};

obj_ship* TEMPLATE(obj_ship,finalize)(obj_ship* this);
void TEMPLATE(obj_ship,free)(obj_ship* this);
void TEMPLATE(obj_ship,clean)(obj_ship* this);
obj_ship* TEMPLATE(obj_ship,copy)(obj_ship* this);

obj_ship* TEMPLATE(obj_ship,copyTo)(obj_ship* this,obj_ship* dest);

int shipParse(obj_ship* this, json_stream* js);


void* TEMPLATE(obj_ship,print)(void* p_obj);

































































































////universal destructor macro
//#define del(X) ((struct generic*)X)->destr((void*)&X)
//
//void obj_free(void** obj_pp);
//
//struct
//ob_gen{	//generic destructor
//	void (*dstr)(void** obj_pp);
//};




//struct pos_x_y_d{
//	uint16_t x;	// x
//	uint16_t y;	// y
//	uint16_t d;	// direction 0=n 100=w 200=s 300=e
//};
//typedef struct pos_x_y_d s_xyd;
//
//struct modifier{
//	uint8_t stat_id;	// id of statistic
//	uint8_t type;		// type of bonus, 0=absolute, 1=percentage
//	uint8_t value;		// bonus value
//};
//
//struct ship_abilit{			// 
//	struct ob_gen;	//generic struct destructor
//	uint8_t type;		// type modules type, 0=passive, 1=weapon, 2=ability
//	uint8_t ab_id;		// ability id
//	uint8_t state;		// state, 0=default, 1=activated, 2=damage, 3=destroyed
//	int8_t  ap_cost;	// cost of activating abilit	//0==passive
//	
//	uint8_t nodefmod;			// number of default modifiers
//	struct modifier* defmod_tbl_p;		// pointer to table of define modifiers
//
//	uint8_t noactmod;			// number of modifiers while active
//	struct modifier* actmod_tbl_p;		// pointer to table of modifiers while active
//
//	uint8_t nodmgmod;			// number of modifiers while damaged
//	struct modifier* dmgmod_tbl_p;		// pointer to table of modifiers while damaged
//
//	uint8_t nodstmod;			// number of modifiers while destroyed
//	struct modifier* dstmod_tbl_p;		// pointer to table of modifiers while destroyed
//};
//typedef struct ship_abilit ship_abilit;
//
//struct ship_wpn_templ{
//	struct ob_gen;	//generic struct destructor
//	uint8_t type;		// type modules type, 0=passive, 1=weapon, 2=ability
////	wchar* name;		// pointer to name
//	int8_t  ap_cost;	// cost of activating ability
//	uint8_t fov;		// half of weapons fow. start from default possition and extends to both sizes.
//	uint8_t wpntype;		// wpn type, 0=main battery, 1=secondary battery, 2=anti air, 3=torpedos, 4=rocket, 5=rocket_aa
//	uint8_t nosh;		// number of missiless per salvo
//	bool	fire_mode;	// 0=shotgun,1=auto
//	uint8_t nosalv;		// number of salvos per turn
//	uint8_t acc;		// accuracy/spread of missiles 
//	uint8_t rld;		// reload in turns
//	uint8_t rnge;		// range
//	uint8_t missl_speed;	// missile speed.
//
//	uint8_t hp_dmg;		// hp damage on hit
//	uint8_t crithitchance;// chance for critical hit
//	float   critdmgmult;	// crit damage multiplier
//
//	uint8_t mod_hit_chance;	// chance to damage modules in ship segment
//	uint8_t mod_dmg;	// hp damage on hit
//};
//typedef struct ship_wpn_templ ship_wpn_templ;
//
//struct ship_module{
//	struct ob_gen;	//generic struct destructor
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
//	ship_wpn_templ* wpn_bare_p;		// pointer to ship_wpn_templ struct, NULL if modules isn't a weapon 
//	ship_abilit* abilit_p;	// pointer to abilitier struct, NULL if modules doesn't have stat abilities
//
//};
//typedef struct ship_module ship_module;
//
////struct wpn{	// struct inheriting members of module and wpn_bare
////	struct wpn_templ;
////	struct ship_module;
////};
////typedef struct wpn wpn;
//
//struct ship_templ{
//	struct ob_gen;	//generic struct destructor
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
//	uint8_t view_visibility;	// ship's visibility, higher value, lower visibility
//
//	uint16_t mod_tbl_size;		// size of table of modules
//	void* mod_tbl_p;		// pointer to table of modules
//	//void (*free)(struct ship_temp**);	//destructor self_ptr->free(&self_ptr);
//};
//typedef struct ship_templ ship_templ;
//
//
//struct ship_r{
//	struct ob_gen;	//inh p to destructor
//	struct pos_x_y_d;		//ships coordinates x, y, d in a struct
//	struct ship_templ* shtype;	//pointer to ship's template
//
//	uint16_t hp;	//current ship's hp
////	uint8_t hp_multiplier;		// hp segment multiplier. 1=>1hp segmements, 2=>2hp segments
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
//	
//	struct fld** sgmnts;	//pointer to an array of pointer to fld (fields) with ship segments
//	struct ply* ply;	//pointer to player (owner)
//
//	//void (*free)(struct ship_r**);		//"destructor" self_ptr->free(&self_ptr);
//};
//typedef struct ship_r ship_r;
//
//
//ship_r* ship_r_init();
//ship_templ* ship_templ_init();
//ship_module* ship_module_init();
//ship_wpn_templ* ship_wpn_templ_init();
//ship_abilit* ship_abilit_init();
//
////void obj_ship_abilit_free(ship_abilit** obj_pp);

#endif // _SHIP_H

