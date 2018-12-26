#ifndef STATE_H
#define STATE_H

#include "conf.h"

struct state{
	int sizex;		//mapsize
	int sizey;		//mapsize
	struct ship** map_ptr; 	//pointer to 2d array of pointers to ships
	char nopl;		//number of player
	struct ply** ply_ptr;	//pointer to array of player(s) structs
	int state;		//game state
};
struct ply{
	char pln;	//player number
	char nsh3;	//number of their ships (sh3)
	char nsh4;	//number of their ships (sh4)
	char nsh5;	//number of their ships (sh5)
	int shtbl_size;	//size of ship tbl
	struct ship** shtbl_ptr;//array of pointers to players ships
};
struct fld{	//map consists of fields
	int state;	//field state; 0=empty; 1=shot_miss; 2=ship; 3=destroyed ship;
	struct ply** shotby;	//array of pointer to player who shot this field. 
	struct ship* ship_ptr;	//pointer to ship, if empty ship_ptr==NULL
};
struct ship{
	bool shdir;	//ship direction 0=vertical 1=horizontal
	char shsize;	//ship size
	char sax;	//anchor x cord (Ship Anchor x)
	char say;	//anchor y cord
	char hp;	//100% hp == shsize	0 --> destroyed
	char* hits;	//hits
	struct ply* ply;	//pointer to player (owner)
};


struct state* state_init(int nopl);
void state_free(struct state** state_ptr);

struct ply* ply_init(int pln);
void ply_free(struct ply** ply_ptr);

struct ply* fld_init(char nopl);
void fld_free(struct fld** fld_ptr);

struct ship* ship_init(int size, struct ply* ply_ptr);
void ship_free(struct ship** sh_ptr);

#endif // STATE_H

