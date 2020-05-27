#ifndef _STATE_H
#define _STATE_H

#include "conf.h"
#include "mth.h"
#include "ship.h"

//struct state{
//	uint16_t sizex;		//mapsize
//	uint16_t sizey;		//mapsize
//	uint16_t marea;		//map area
//	struct fld** map_ptr; 	//pointer to 2d array of pointers to fields 
//	char nopl;		//number of player
//	struct ply** ply_ptr;	//pointer to array of player(s) structs
//	uint8_t state;		//game state
//
//	void (*free)(struct state**);		//"destructor" self_ptr->free(&self_self);
//};
//
//
//
//
//
//struct ply{
//	uint8_t pln;	//player number
//	unsigned char pcol;	//player colour
//	char nsh3;	//number of their ships
//	char nsh4;	//number of their ships
//	char nsh5;	//number of their ships
//	uint8_t shtbl_size;	//size of ship tbl
//	struct ship** shtbl_ptr;//array of pointers to players ships
//
//	void (*free)(struct ply**);		//"destructor" self_ptr->free(&self_self);
//};
//struct fld{	//map consists of fields
//	uint8_t state;	//field state; 0=empty; 1=shot_miss; 2=ship; 3=destroyed ship;
//	struct ply** shotby;	//array of pointer to player who shot this field. 
//	struct ship* ship_ptr;	//pointer to ship, if empty ship_ptr==NULL
//
//
//	void (*free)(struct fld**);		//"destructor" self_ptr->free(&self_self);
//};
//struct ship{
//	bool shdir;	//ship direction 0=vertical 1=horizontal
//	uint16_t shsize;	//ship size
//	uint16_t shtype;	//ship size
//	uint16_t sax;	//anchor x cord (Ship Anchor x)
//	uint16_t say;	//anchor y cord
//	uint16_t hp;	//100% hp == shsize	0 --> destroyed
//	struct fld** sgmnts;	//pointer to an array of pointer to fls (fields) with ship segments
//	struct ply* ply;	//pointer to player (owner)
//
//	void (*free)(struct ship**);		//"destructor" self_ptr->free(&self_self);
//};
//
//struct coords{
//	uint16_t x;	// x
//	uint16_t y;	// y
//	uint8_t d;	// direction 0=n 1=e 2=s 3=w
//};
//
//typedef struct state state;
//typedef struct ply ply;
//typedef struct fld fld;
//typedef struct ship ship;
//
//typedef struct coords coords;
//
//	//"destructor" self_ptr->free(&self_self);
//
//struct state* state_init(int nopl);
//#define state(nopl) state_init(nopl)		//"constructor"
//void state_free(struct state** state_ptr);
//
//struct ply* ply_init(int pln);
//#define ply(pln) ply_init(pln)		//"constructor"
//void ply_free(struct ply** ply_ptr);
//
//struct fld* fld_init(char nopl);
//#define fld(nopl) fld_init(nopl)		//"constructor"
//void fld_free(struct fld** fld_ptr);
//
//struct ship* ship_init(int size, struct ply* ply_ptr);
//#define ship(size, ply_ptr) ship_init(size, ply_ptr)		//"constructor"
//void ship_free(struct ship** sh_ptr);
//
//
//char ship_place(struct state* state_ptr, struct ship* ship_ptr, uint16_t xpos, uint16_t ypos, bool rot);
//char ship_place_str_pos(struct state* state_ptr, struct ship* ship_ptr);
//char ship_placecheck(struct state* state_ptr, struct ship* ship_ptr, uint16_t xpos, uint16_t ypos, bool rot);
//
//void ply_calc_ships_hp(struct ply* starte_ptr);
//
//struct shot{
//	uint16_t noshells;	//number of points	//number of shells fiered
//	int16_t* shots_ptr;	//2d array of shots (*shots)[noshells][dimension]	dimensions x=0;y=1;	size=noshells*2
//	void (*free)(struct shot**);	//"destructor" self_ptr->free(&self_self);
//};
//
//struct shot* shot_init(unsigned char noshells);	//allocates shot vla;	argument number of shells
//#define shot(nosh) shot_init(nosh)		//"constructor"
//void shot_free(struct shot** shot_ptr);	//frees shot vla
//
//struct shot* shot_gen(uint16_t shsize);	//allocates shot struct and generates shells
//void state_shoot_and_mark(struct state* state_ptr, struct ply* ply_ptr, struct ship* ship_ptr, uint16_t ypos, uint16_t xpos);	//function takes ptr to shot and changes states of appropriate fields		//probably doesn't work, I HAVEN'T TESTED IT YET
//void state_ship_move_ship(struct state* state_ptr, struct ship* ship_ptr, uint16_t xpos, uint16_t ypos, bool d);
//
//
////functional programming test
//void ship_erase_from_map_f(void* v_state_ptr, struct ship* v_ship_ptr, void* arg_ptr);
////void ply_do_f_for_all_ships(struct state* state_ptr, struct ply* ply_ptr, void (*func_ptr)(void*, void*));
//void ply_do_f_for_all_ships(void (*func_ptr)(), struct state* state_ptr, struct ply* ply_ptr, void* arg);
//

#endif // _STATE_H
