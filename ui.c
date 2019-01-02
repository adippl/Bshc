#include "conf.h"
#include "state.h"
#include "term.h"


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

void
input_coord(uint16_t* x, uint16_t* y, bool* d, uint16_t xmax, uint16_t ymax,struct ship* ship_ptr, int* i){
	uint16_t ix=0,iy=0,id=0;
	wchar_t cy=0;
	
	for(;;){
		ix=0;iy=0;id=0;cy=0;
		screen_clear_area(0,52,FSIZE_X,FSIZE_Y-52);	//FIXIT
		gotoxy(0,51);
		fprintf(stdout,"Ship number %d\tShip's length=%d \nInput ship's X Y and direction (0 vertical, 1 horizontal)\n",*i,ship_ptr->shsize);
		scanf("%hu %lc %hu",&ix,&cy,&id);
		fprintf(stdout,"Your x=%hu y=%lc d=%hu\n",ix,cy,id);
		
		if(cy>='a'&&cy<=ymax+'a'){
			iy=cy-'a';
		}
		//fprintf(stdout,"your input x=%hu y=%lc b=%b",ix,cu,id);
		//char kek=getchar();


		if(ix>-1&&ix<xmax&& iy>-1&&iy<ymax&& id<2){break;}
                else{fprintf(stderr,"Input error\n");}
	}
	*x=(uint16_t)ix;
	*y=(uint16_t)iy;
	*d=(uint16_t)id;
}
char*
fb_input_ships_and_draw(struct chfb* chfb_ptr, struct state* state_ptr, char pln){
	if(!chfb_ptr)return(NULL);
	if(!state_ptr)return(NULL);
	if(0<pln||pln>state_ptr->nopl)return(NULL);

	//uint16_t x=0,y=0;
	//bool d=0;
	
	unsigned char noship=(*(state_ptr->ply_ptr+pln))->shtbl_size;
	struct ship** ship_arr_org=(*(state_ptr->ply_ptr+pln))->shtbl_ptr;


	struct ship* ship_arr[noship];
	//struct ship ship_arr=malloc(sizeof(struct ship*)*nosh);
	
	for(int i=0;i<noship;i++){
//		x=0;y=0;d=0;
		ship_arr[i]=ship( (*(ship_arr_org+i))->shsize, NULL);
		
		//input_coord(&x,&y,&d,state_ptr->msizex,state_ptr->msizex);
		

		input_coord(&ship_arr[i]->sax,&ship_arr[i]->say,&ship_arr[i]->shdir,state_ptr->sizex,state_ptr->sizex,ship_arr[i],&i);



		//x=0;y=0;d=0;
	}

//	printf("\ninput x y d");

	//input_coord(&x,&y,&d,state_ptr->msizex,state_ptr->msizex);


	for(int i=0;i<noship;i++){
		ship_arr[i]->free(&ship_arr[i]);
	}
	return((char*)0x1);
}
