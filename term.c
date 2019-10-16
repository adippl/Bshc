
#include "conf.h"
#include "term.h"
#include "state.h"

//const char FRAMECHARS[]="─│┌┐└┘├┤┬┴┼"; // DOESN'T WORK

//const wchar_t FRAMECHARS[11]={0x2500,0x2502,0x250c,0x2510,0x2514,0x2518,0x251c,0x2525,0x252c,0x2534,0x253c};	// ─│┌┐└┘├┤┬┴┼

const unsigned char PLAYER_COL[2][3]={{31,0,0},{32,0,0}};

//void
//clear(){ fprintf(stdout,"\033[H\033[J");}
//void
//gotoxy(int x,int y){fprintf(stdout,"\033[%d;%dH",y,x);}
//void
//resizexy(int x,int y){fprintf(stdout,"\033[8;%d;%dt",y,x);}

struct ctfb*
tfb_init(){
	struct ctfb *p_ctfb=NULL;
	p_ctfb=ctfb_fb_init(FSIZE_X, FSIZE_Y);
	if(!p_ctfb)return(NULL);

//	p_ctfb->msizex=SIZE_X*2+1;
//        p_ctfb->msizey=SIZE_Y*2+1;
//        p_ctfb->marea=p_ctfb->msizex*p_ctfb->msizey;
	 

//	p_ctfb->free=fb_free;
//	p_ctfb->draw_map=fb_draw_map;
//	p_ctfb->cleanm=fb_clear_and_map;
	return(p_ctfb);
}

//void
//fb_free(struct ctfb** ctfb_ptr){
//	if(!*ctfb_ptr)exit(11);
//	free((*ctfb_ptr)->fbtb_ptr);
//	free((*ctfb_ptr)->frmt_ptr);
//	free(*ctfb_ptr);
//	*ctfb_ptr=NULL;
//}


struct ctfb*
fb_draw_map(struct ctfb* ctfb_ptr){
	if(!ctfb_ptr)return(NULL);
	wchar_t (*fbtb_ptr_cstd)[ctfb_ptr->sizey][ctfb_ptr->sizex]=(void*)ctfb_ptr->fbtb_ptr;	//risky
	unsigned char (*frmt_ptr_cstd)[ctfb_ptr->sizey][ctfb_ptr->sizex][3]=(void*)ctfb_ptr->frmt_ptr;	//risky
	
	//
	//		XX-1/2 is a conversion from screen coordinates to map coordinates
	//
	
	for(int i=0;i<((ctfb_ptr->sizey-1)/2);i++){
		for(int j=0;j<(ctfb_ptr->sizex-1)/2;j++){
			if(i%2==1&&j%2==1){
				(*fbtb_ptr_cstd)[i][j]=FRAMECHARS[10];
				
				//(*frmt_ptr_cstd)[i][j][0]=36;
				//(*frmt_ptr_cstd)[i][j][1]=1;
			}else if(j%2==0&&i%2==1){
				(*fbtb_ptr_cstd)[i][j]=FRAMECHARS[0];

				//(*frmt_ptr_cstd)[i][j][0]=36;
				//(*frmt_ptr_cstd)[i][j][1]=1;
			}else if(j%2==1&&i%2==0){
				(*fbtb_ptr_cstd)[i][j]=FRAMECHARS[1];

				//(*frmt_ptr_cstd)[i][j][0]=36;
				//(*frmt_ptr_cstd)[i][j][1]=1;
			}
			else{
				(*fbtb_ptr_cstd)[i][j]=' ';
			}
		}
	}
	for(int j=0;j<(ctfb_ptr->sizex-1)/2/2;j+=1){
		(*fbtb_ptr_cstd)[0][j*2+2]=j%10+'0';
		(*frmt_ptr_cstd)[0][j*2+2][0]=(j/10>0)?30+j/10:37;	//if j>10 colour numer set by line above //37 is white
	}
	for(int i=2;i<(ctfb_ptr->sizey-1)/2;i+=2){
		(*fbtb_ptr_cstd)[i][0]=i/2+47+49;
		//(*frmt_ptr_cstd)[i][0][0]=(i/6>0)?30+i/6:37;
		(*frmt_ptr_cstd)[i+2][0][0]=(i/6>0)?30+i/6:37;
	}
	

	//draw bottom border
	for(int i=0;i<ctfb_ptr->sizex;i++){
		(*fbtb_ptr_cstd)[(ctfb_ptr->sizey-1)/2][i]=i%2?FRAMECHARS[9]:FRAMECHARS[0];
	}

	return(ctfb_ptr);
}

void
fb_clear_and_map(struct ctfb* ctfb_ptr){

	for(int i=0;i<ctfb_ptr->area;i++){
		*(ctfb_ptr->fbtb_ptr+i)=0; //zero char
	}
	for(int i=0;i<ctfb_ptr->area*3;i++ ){
		*(ctfb_ptr->frmt_ptr+i)=0; //zero format
	}
	fb_draw_map(ctfb_ptr);
}

//void
//fb_screen_draw_bw(struct ctfb* ctfb_ptr){	//backup, legacy function prints black and white screen 
//	if(!ctfb_ptr)exit(11);
//	resizexy(FSIZE_X,FSIZE_Y);
//
//	for(int i=0;i<ctfb_ptr->sizey;i++){
//		for(int j=0;j<ctfb_ptr->sizex;j++){
//			fprintf(stdout,"%lc",*(ctfb_ptr->fbtb_ptr+i*ctfb_ptr->sizex+j));
//		}
//		fprintf(stdout,"\n");
//	}
//}

//void
//fb_screen_draw(struct ctfb* ctfb_ptr){
//	if(!ctfb_ptr)exit(11);
//	resizexy(FSIZE_X,FSIZE_Y);
//	gotoxy(0,0);
//	wchar_t (*fbtb_ptr_cstd)[ctfb_ptr->sizey][ctfb_ptr->sizex]=(void*)ctfb_ptr->fbtb_ptr;	//risky
//	unsigned char (*frmt_ptr_cstd)[ctfb_ptr->sizey][ctfb_ptr->sizex][3]=(void*)ctfb_ptr->frmt_ptr;	//risky
//
//	for(int i=0;i<ctfb_ptr->sizey;i++){
//		for(int j=0;j<ctfb_ptr->sizex;j++){
//			//fprintf(stdout,"%lc",(*fbtb_ptr_cstd)[i][j]);
//			
//			// IFs below are check format_tabel for number of formatting variables assigned to the char
//			// 0-empty 1-presetn()
//			//	000
//			//	100
//			//	110
//			//	111
//
//			if((*frmt_ptr_cstd)[i][j][0]==0&&(*frmt_ptr_cstd)[i][j][1]==0&&(*frmt_ptr_cstd)[i][j][2]==0){
//				fprintf(stdout,"%lc",(*fbtb_ptr_cstd)[i][j]);
//
//			}else if((*frmt_ptr_cstd)[i][j][0]!=0&&(*frmt_ptr_cstd)[i][j][1]==0&&(*frmt_ptr_cstd)[i][j][2]==0){
//				prtnch((*fbtb_ptr_cstd)[i][j],1,(*frmt_ptr_cstd)[i][j][0]);
//
//			}else if((*frmt_ptr_cstd)[i][j][0]!=0&&(*frmt_ptr_cstd)[i][j][1]!=0&&(*frmt_ptr_cstd)[i][j][2]==0){
//				prtnch((*fbtb_ptr_cstd)[i][j],2,(*frmt_ptr_cstd)[i][j][0],(*frmt_ptr_cstd)[i][j][1]);
//
//			}else if((*frmt_ptr_cstd)[i][j][0]!=0&&(*frmt_ptr_cstd)[i][j][1]!=0&&(*frmt_ptr_cstd)[i][j][2]!=0){
//				prtnch((*fbtb_ptr_cstd)[i][j],2,(*frmt_ptr_cstd)[i][j][0],(*frmt_ptr_cstd)[i][j][1],(*frmt_ptr_cstd)[i][j][2]);
//			}
//		}
//		fprintf(stdout,"\n");
//	}
//}

//void prtnch(wchar_t chr, unsigned char nofarg,...){
//	if(nofarg<1||nofarg>3)exit(EXIT_FAILURE);
//
//	va_list vl;
//	va_start(vl, nofarg); 
//
//	switch(nofarg){
//		case 1:
//			fprintf(stdout,"\033[%dm%lc\033[0m",va_arg(vl,int),chr);
//		break;
//		case 2:
//			fprintf(stdout,"\033[%d;%dm%lc\033[0m",va_arg(vl,int),va_arg(vl,int),chr);
//		break;
//		case 3:
//			fprintf(stdout,"\033[%d;%d;%dm%lc\033[0m",va_arg(vl,int),va_arg(vl,int),va_arg(vl,int),chr);
//		break;
//	} 
//	va_end(vl);
//}


void
fb_draw_ship_single(struct ctfb* ctfb_ptr, struct ship* ship_ptr, char color_code){
	if(!ctfb_ptr)exit(EXIT_FAILURE);
	if(!ship_ptr)exit(EXIT_FAILURE);
	
	wchar_t (*fbtb_ptr_cstd)[ctfb_ptr->sizey][ctfb_ptr->sizex]=(void*)ctfb_ptr->fbtb_ptr;	//framebuffer_table_pointer_casted
	unsigned char (*frmt_ptr_cstd)[ctfb_ptr->sizey][ctfb_ptr->sizex][3]=(void*)ctfb_ptr->frmt_ptr;	//risky


	//2+ move from the edge if the screen; (x or y)*2+i*2  *2 alligns to the grid
	if(ship_ptr->shdir){
		for(int i=0;i<ship_ptr->shsize;i++){
			(*fbtb_ptr_cstd)[2+ship_ptr->say*2][2+ship_ptr->sax*2+i*2]='#';
			(*frmt_ptr_cstd)[2+ship_ptr->say*2][2+ship_ptr->sax*2+i*2][0]=color_code;
		}
		
	}else{
		for(int j=0;j<ship_ptr->shsize;j++){
			(*fbtb_ptr_cstd)[2+ship_ptr->say*2+j*2][2+ship_ptr->sax*2]='#';		//2+ align to the grid, 
			(*frmt_ptr_cstd)[2+ship_ptr->say*2+j*2][2+ship_ptr->sax*2][0]=color_code;
		}
	}
}

void 
fb_draw_ships(struct ctfb* ctfb_ptr, struct state* state_ptr, unsigned char noarg, ...){
	if(!ctfb_ptr)exit(EXIT_FAILURE);
	if(!state_ptr)exit(EXIT_FAILURE);
	if(noarg<1||noarg>state_ptr->nopl)exit(EXIT_FAILURE);
	
	va_list vl;
	va_start(vl, noarg);
	uint8_t arg=0;
	
	struct ply* (*ply_ptr_cst)[state_ptr->nopl]=(void*)state_ptr->ply_ptr;

	for(int i=0;i<noarg;i++){
		arg=va_arg(vl,int);
		//fprintf to stderr easy debug
//		fprintf(stderr,"arg %d = %d\n",i,arg);
//		fprintf(stderr,"pln=%d %d\n", (*ply_ptr_cst)[arg]->pln, (*ply_ptr_cst)[arg]->shtbl_size);

		for(int j=0;j<(*ply_ptr_cst)[arg]->shtbl_size;j++){
			fb_draw_ship_single(ctfb_ptr, (*( (*ply_ptr_cst)[arg]->shtbl_ptr +j)), (*ply_ptr_cst)[arg]->pcol);
			fprintf(stderr,"shsize=%d\n",(*( (*ply_ptr_cst)[arg]->shtbl_ptr +j))->shsize );
		}
	}
	va_end(vl);
}


void
fb_draw_ship_single_f(state* state_ptr, ship* ship_ptr, void* v_ctfb_ptr){
	if(!state_ptr)exit(EXIT_FAILURE);
	if(!ship_ptr)exit(EXIT_FAILURE);
	if(!v_ctfb_ptr)exit(EXIT_FAILURE);

	uint8_t color_code=ship_ptr->ply->pcol;

	struct ctfb* ctfb_ptr=(struct ctfb*)v_ctfb_ptr;
	wchar_t (*fbtb_ptr_cstd)[ctfb_ptr->sizey][ctfb_ptr->sizex]=(void*)ctfb_ptr->fbtb_ptr;	//framebuffer_table_pointer_casted
	unsigned char (*frmt_ptr_cstd)[ctfb_ptr->sizey][ctfb_ptr->sizex][3]=(void*)ctfb_ptr->frmt_ptr;	//risky


	//2+ move from the edge if the screen; (x or y)*2+i*2  *2 alligns to the grid
	if(ship_ptr->shdir){
		for(int i=0;i<ship_ptr->shsize;i++){
			(*fbtb_ptr_cstd)[2+ship_ptr->say*2][2+ship_ptr->sax*2+i*2]='#';
			(*frmt_ptr_cstd)[2+ship_ptr->say*2][2+ship_ptr->sax*2+i*2][0]=color_code;
		}
		
	}else{
		for(int j=0;j<ship_ptr->shsize;j++){
			(*fbtb_ptr_cstd)[2+ship_ptr->say*2+j*2][2+ship_ptr->sax*2]='#';		//2+ align to the grid, 
			(*frmt_ptr_cstd)[2+ship_ptr->say*2+j*2][2+ship_ptr->sax*2][0]=color_code;
		}
	}
}
