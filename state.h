#ifndef STATE_H
#define STATE_H

#include <stdbool.h>

#include "conf.h"

struct state{
	int sizex; 		//mapsize
	int sizey;	 	//mapsize
	char nopl;		//number of player
	struct ply** ply_ptr;	//pointer to array of player(s) structs
	int state; 		//game state
};
struct ply{
	char pln;	//player number
	char nsh3;	//number of their ships (sh3)
	char nsh4;	//number of their ships (sh4)
	char nsh5;	//number of their ships (sh5)
	int shtbl_size;	//size of ship tbl
	struct ship** shtbl_ptr;//array of pointers to players ships
	int map_size;		//map size
	struct ship** map_ptr; 	//pointer to 2d map, map consist of pointers to ships
};
struct ship{
	bool shdir;	//ship direction 0=vertical 1=horizontal
	char sax;	//anchor x cord (Ship Anchor x)
	char say;	//anchor y cord
	char shsize;	//ship size
	char hp;	//100% hp == shsize	0 --> destroyed
	char* hits;	//hits
};


struct state* state_init(int nopl);
void state_free(struct state** state_ptr);

struct ply* ply_init(struct state* state_ptr,int pln);
void ply_free(struct ply** ply_ptr);

struct ship* ship_init(int size);
void ship_free(struct ship** sh_ptr);

int ship_place(struct state* state_ptr,struct ply* ply_ptr,struct ship* sh_ptr,char x,char y,char length,bool dir);
#endif // STATE_H

