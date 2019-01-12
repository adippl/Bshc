#ifndef STATE_H
#define STATE_H

#include "conf.h"

struct state{
	int sizex;		//mapsize
	int sizey;		//mapsize
	int marea;		//map area
	struct fld** map_ptr; 	//pointer to 2d array of pointers to fields 
	char nopl;		//number of player
	struct ply** ply_ptr;	//pointer to array of player(s) structs
	int state;		//game state

	void (*free)(struct state**);		//"destructor" self_ptr->free(&self_self);
};
struct ply{
	char pln;	//player number
	unsigned char pcol;	//player colour
	char nsh3;	//number of their ships (sh3)
	char nsh4;	//number of their ships (sh4)
	char nsh5;	//number of their ships (sh5)
	int shtbl_size;	//size of ship tbl
	struct ship** shtbl_ptr;//array of pointers to players ships

	void (*free)(struct ply**);		//"destructor" self_ptr->free(&self_self);
};
struct fld{	//map consists of fields
	int state;	//field state; 0=empty; 1=shot_miss; 2=ship; 3=destroyed ship;
	struct ply** shotby;	//array of pointer to player who shot this field. 
	struct ship* ship_ptr;	//pointer to ship, if empty ship_ptr==NULL


	void (*free)(struct fld**);		//"destructor" self_ptr->free(&self_self);
};
struct ship{
	bool shdir;	//ship direction 0=vertical 1=horizontal
	uint16_t shsize;	//ship size
	uint16_t sax;	//anchor x cord (Ship Anchor x)
	uint16_t say;	//anchor y cord
	uint16_t hp;	//100% hp == shsize	0 --> destroyed
	struct fld** sgmnts;	//pointer to an array of pointer to fls (fields) with ship segments
	struct ply* ply;	//pointer to player (owner)

	void (*free)(struct ship**);		//"destructor" self_ptr->free(&self_self);
};


	//"destructor" self_ptr->free(&self_self);

struct state* state_init(int nopl);
#define state(nopl) state_init(nopl)		//"constructor"
void state_free(struct state** state_ptr);

struct ply* ply_init(int pln);
#define ply(pln) ply_init(pln)		//"constructor"
void ply_free(struct ply** ply_ptr);

struct fld* fld_init(char nopl);
#define fld(nopl) fld_init(nopl)		//"constructor"
void fld_free(struct fld** fld_ptr);

struct ship* ship_init(int size, struct ply* ply_ptr);
#define ship(size, ply_ptr) ship_init(size, ply_ptr)		//"constructor"
void ship_free(struct ship** sh_ptr);


char ship_place(struct state* state_ptr, struct ship* ship_ptr, uint16_t xpos, uint16_t ypos, bool rot);
char ship_place_str_pos(struct state* state_ptr, struct ship* ship_ptr);
char ship_placecheck(struct state* state_ptr, struct ship* ship_ptr, uint16_t xpos, uint16_t ypos, bool rot);

void ply_calc_ships_hp(struct ply* starte_ptr);

struct shot{
	uint16_t noshells;	//number of points	//number of shells fiered
	int16_t* shots_ptr;	//2d array of shots (*shots)[noshells][dimension]	dimensions x=0;y=1;	size=noshells*2
	void (*free)(struct shot**);	//"destructor" self_ptr->free(&self_self);
};

struct shot* shot_init(unsigned char noshells);	//allocates shot vla;	argument number of shells
#define shot(nosh) shot_init(nosh)		//"constructor"
void shot_free(struct shot** shot_ptr);	//frees shot vla

struct shot* shot_gen(char shsize);	//allocates shot struct and generates shells

#endif // STATE_H

