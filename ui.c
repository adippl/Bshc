#include "conf.h"
#include "state.h"
#include "term.h"

#include <string.h>


void
screen_clear_area(uint16_t x, uint16_t y, uint16_t xm, uint16_t ym){
	gotoxy(x,y);
	for(int j=0;j<ym;j++){
		for(int i=0;i<xm;i++){
			fprintf(stdout," ");
		}
		fprintf(stdout,"\n");
	}
}

uint16_t
input_coord(uint16_t* x, uint16_t* y, uint16_t xmax, uint16_t ymax){
	uint16_t ix=0,iy=0,id=0;
	wchar_t cy=0,discard;
	
	for(;;){
		ix=0;iy=0;id=0;cy=0;
		screen_clear_area(0,52,FSIZE_X,FSIZE_Y-52);	//FIXIT
		gotoxy(0,51);
		fprintf(stdout,"Input X and Y to aim and shoot.( X=(intiger) Y=(char)) \n");
		if(scanf("%hu %lc %hu",&ix,&cy,&id)!=3){
			fprintf(stderr,"INPUT ERROR"); 
			fprintf(stderr,"%ld",ftell(stdin));
			fscanf(stdin,"%lc",&discard); 
			sleep(1);
			continue;
			}
		
		if(cy>='a'&&cy<=ymax+'a'){
			iy=cy-'a';
		}else{fprintf(stderr,"Input error\n");sleep(1);continue;}

		//if(ix>-1&&ix<xmax-ship_ptr->shsize+1&& iy>-1&&iy<ymax-ship_ptr->shsize+1&& id<2){break;}
                //else{fprintf(stderr,"Input error\n");}
	}
	*x=(uint16_t)ix&0xffff;	//bitwise AND
	*y=(uint16_t)iy&0xffff;
	
	return(0);
}

uint16_t
aim_and_shoot(struct state* state_ptr, struct ship* ship_ptr){
	uint16_t x=0,y=0;
	input_coord(&x,&y,state_ptr->sizex,state_ptr->sizey);

	
	return(0);
}

int
input_ship_coord(uint16_t* x, uint16_t* y, bool* d, uint16_t xmax, uint16_t ymax,struct ship* ship_ptr, int* i){
	uint16_t ix=0,iy=0,id=0;
	wchar_t cy=0,discard;
	
	for(;;){
		ix=0;iy=0;id=0;cy=0;
		screen_clear_area(0,52,FSIZE_X,FSIZE_Y-52);	//FIXIT
		gotoxy(0,51);
		fprintf(stdout,"Ship number %d\tShip's length=%d \nInput ship's X=(intiger) Y=(char) and direction (0 vertical, 1 horizontal)\n",*i,ship_ptr->shsize);
		if(scanf("%hu %lc %hu",&ix,&cy,&id)!=3){
			fprintf(stderr,"INPUT ERROR"); 
			fprintf(stderr,"%ld",ftell(stdin));
			fscanf(stdin,"%lc",&discard); 
			sleep(1);
			continue;
			}
		
		if(cy>='a'&&cy<=ymax+'a'){
			iy=cy-'a';
		}else{fprintf(stderr,"Input error\n");sleep(1);continue;}

		if(ix>-1&&ix<xmax-ship_ptr->shsize+1&& iy>-1&&iy<ymax-ship_ptr->shsize+1&& id<2){break;}
                else{fprintf(stderr,"Input error\n");}
	}
	*x=(uint16_t)ix&0xffff;	//bitwise AND
	*y=(uint16_t)iy&0xffff;
	*d=(bool)id&0x1;
	
	return(0);
}

char
fb_input_ships_and_draw(struct chfb* chfb_ptr, struct state* state_ptr, unsigned char pln){
	if(!chfb_ptr)return(1);
	if(!state_ptr)return(1);
	if(0<pln||pln>state_ptr->nopl)return(1);
	
	uint16_t x=0,y=0;
	bool	d=0;

	unsigned char noship=(*(state_ptr->ply_ptr+pln))->shtbl_size;
	struct ship** ship_arr_org=(*(state_ptr->ply_ptr+pln))->shtbl_ptr;

	struct state* tempstate_ptr = state(1);
	if(!tempstate_ptr)exit(10);

	struct ship* ship_arr[noship];
	
	for(int i=0;i<noship;i++){
		x=0;y=0;d=0;
		ship_arr[i]=ship( (*(ship_arr_org+i))->shsize, NULL);
		
		for(;;){
		input_ship_coord(&x,&y,&d, state_ptr->sizex, state_ptr->sizey, ship_arr[i],&i);
			if(ship_placecheck(tempstate_ptr, ship_arr[i], x,y,d)==0){
				ship_arr[i]->sax=x;
				ship_arr[i]->say=y;
				ship_arr[i]->shdir=d;
				
				ship_place_str_pos(tempstate_ptr,ship_arr[i]);
				fb_draw_ship_single(chfb_ptr, ship_arr[i], PLAYER_COL[pln][0] ); // 37  is a color code
				break;
			}else{
				fprintf(stderr,"\n!%d %d %d!\n",x,y,(int)d);
				fprintf(stderr,"\nFAIL\n");
				sleep(1);
				continue;
			}
		}
		fb_screen_draw(chfb_ptr);
		//x=0;y=0;d=0;
	}
	for(int i=0;i<noship;i++){
		memcpy(*(ship_arr_org+i),ship_arr[i],sizeof(bool)+sizeof(uint32_t)*4);
		ship_place_str_pos(state_ptr,*(ship_arr_org+i));
	}
	tempstate_ptr->free(&tempstate_ptr);
	for(int i=0;i<noship;i++){
		ship_arr[i]->free(&ship_arr[i]);
	}
	return(0);
}
