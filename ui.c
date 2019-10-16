#include "conf.h"
#include "state.h"
#include "term.h"

#include <string.h>


uint16_t
input_coord(uint16_t* x, uint16_t* y, uint16_t xmax, uint16_t ymax){
	uint16_t ix=0,iy=0,id=0;
	wchar_t cy=0,discard;
	
	for(;;){
		ix=0;iy=0;id=0;cy=0;
		ctfb_screenClearArea(0,52,FSIZE_X,FSIZE_Y-52);	//FIXIT
		ctfb_gotoxy(0,51);
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
		ctfb_screenClearArea(0,52,FSIZE_X,FSIZE_Y-52);	//FIXIT
		ctfb_gotoxy(0,51);
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
fb_input_ships_and_draw(struct ctfb* ctfb_ptr, struct state* state_ptr, unsigned char pln){
	if(!ctfb_ptr)return(1);
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
				fb_draw_ship_single(ctfb_ptr, ship_arr[i], PLAYER_COL[pln][0] ); // 37  is a color code
				break;
			}else{
				fprintf(stderr,"\n!%d %d %d!\n",x,y,(int)d);
				fprintf(stderr,"\nFAIL\n");
				sleep(1);
				continue;
			}
		}
		ctfb_ptr->draw(ctfb_ptr);
		//x=0;y=0;d=0;
	}
	for(int i=0;i<noship;i++){
		memcpy(*(ship_arr_org+i),ship_arr[i],sizeof(bool)+sizeof(uint16_t)*4);
		ship_place_str_pos(state_ptr,*(ship_arr_org+i));
	}
	tempstate_ptr->free(&tempstate_ptr);
	for(int i=0;i<noship;i++){
		ship_arr[i]->free(&ship_arr[i]);
	}
	return(0);
}

//void input_int(char* arr, uint16_t* input_var){
//	for(;;){
//		gotoxy(0,0);
//		fprintf(stdout,arr);
//		if(scanf("%hu",input_var)!=1){
//			fprintf(stderr,"INPUT ERROR"); 
//			//fprintf(stderr,"%ld",ftell(stdin));
//			//fscanf(stdin,"%lc",&discard); 
//			fseek(stdin,0,SEEK_SET);
//			//sleep(1);
//			continue;
//		}
//	}
//}

uint16_t 
input_int(char* arr){
	uint16_t ret_var=0;
	wchar_t discard;
	for(;;){
		fprintf(stdout,arr);
		if(scanf("%hu",&ret_var)!=1){
			fprintf(stderr,"INPUT ERROR\n");
			fscanf(stdin,"%lc",&discard);
			//fseek(stdin,0,SEEK_END);
			continue;
		}
		break;
	}
	return(ret_var);
}

//uint16_t 
//input_int_range(char* arr, uint16_t max){
//	uint16_t ret_var=0;
//	do{
//		ret_var=input_int(arr);
//	}while(!(ret_var<max));
//
//	return(ret_var);
//}

state*
state_game_intit(){
	
	ctfb_clear();
	state* state_ptr=state_init(input_int("input the number of players"));
	for(int i=0;i<state_ptr->nopl;i++){
		(*(state_ptr->ply_ptr+i))->pcol=input_int("input player's colour")&0xffff;
	}



	return(state_ptr);
}

//void
//input_int(uint16_t* x, uint16_t* y, uint16_t xmax, uint16_t ymax){
//	uint16_t ix=0,iy=0,id=0;
//	wchar_t cy=0,discard;
//	
//	for(;;){
//		ix=0;iy=0;id=0;cy=0;
//		screen_clear_area(0,52,FSIZE_X,FSIZE_Y-52);	//FIXIT
//		gotoxy(0,51);
//		fprintf(stdout,"Input X and Y to aim and shoot.( X=(intiger) Y=(char)) \n");
//		if(scanf("%hu %lc %hu",&ix,&cy,&id)!=3){
//			fprintf(stderr,"INPUT ERROR"); 
//			fprintf(stderr,"%ld",ftell(stdin));
//			fscanf(stdin,"%lc",&discard); 
//			sleep(1);
//			continue;
//			}
//		
//		if(cy>='a'&&cy<=ymax+'a'){
//			iy=cy-'a';
//		}else{fprintf(stderr,"Input error\n");sleep(1);continue;}
//
//		//if(ix>-1&&ix<xmax-ship_ptr->shsize+1&& iy>-1&&iy<ymax-ship_ptr->shsize+1&& id<2){break;}
//                //else{fprintf(stderr,"Input error\n");}
//	}
//	*x=(uint16_t)ix&0xffff;	//bitwise AND
//	*y=(uint16_t)iy&0xffff;
//	
//	return(0);
//}
