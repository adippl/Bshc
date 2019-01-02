
#include "conf.h"
#include "term.h"
#include "state.h"

//const char FRAMECHARS[]="─│┌┐└┘├┤┬┴┼"; // DOESN'T WORK

const wchar_t FRAMECHARS[11]={0x2500,0x2502,0x250c,0x2510,0x2514,0x2518,0x251c,0x2525,0x252c,0x2534,0x253c};	// ─│┌┐└┘├┤┬┴┼

void
clear(){ fprintf(stdout,"\033[H\033[J");}
void
gotoxy(int x,int y){fprintf(stdout,"\033[%d;%dH",y,x);}
void
resizexy(int x,int y){fprintf(stdout,"\033[8;%d;%dt",y,x);}

struct chfb*
fb_init(){
	struct chfb* chfb_ptr=malloc(sizeof(struct chfb));
	if(!chfb_ptr)return(NULL);

	chfb_ptr->sizex=FSIZE_X;
        chfb_ptr->sizey=FSIZE_Y-2;
        chfb_ptr->area=chfb_ptr->sizex*chfb_ptr->sizey;
	
	chfb_ptr->msizex=SIZE_X*2+1;
        chfb_ptr->msizey=SIZE_Y*2+1;
        chfb_ptr->marea=chfb_ptr->msizex*chfb_ptr->msizey;
	 
	chfb_ptr->fbtb_ptr=malloc(sizeof(wchar_t)*chfb_ptr->area);
	if(!chfb_ptr->fbtb_ptr)return(NULL);
	for(int i=0;i<chfb_ptr->area;i++){
		*(chfb_ptr->fbtb_ptr+i)=' ';
	}

	chfb_ptr->frmt_ptr=malloc(sizeof(unsigned char)*chfb_ptr->area*3);
	if(!chfb_ptr->frmt_ptr)return(NULL);
	for(int j=0;j<chfb_ptr->area*3;j++){
		*(chfb_ptr->frmt_ptr+j)=0;
	}

	chfb_ptr->free=fb_free;

	return(chfb_ptr);
}
void
fb_free(struct chfb** chfb_ptr){
	if(!*chfb_ptr)exit(11);
	free((*chfb_ptr)->fbtb_ptr);
	free((*chfb_ptr)->frmt_ptr);
	free(*chfb_ptr);
	*chfb_ptr=NULL;
}


struct chfb*
fb_draw_map(struct chfb* chfb_ptr){
	if(!chfb_ptr)return(NULL);
	wchar_t (*fbtb_ptr_cstd)[chfb_ptr->sizey][chfb_ptr->sizex]=(void*)chfb_ptr->fbtb_ptr;	//risky
	unsigned char (*frmt_ptr_cstd)[chfb_ptr->sizey][chfb_ptr->sizex][3]=(void*)chfb_ptr->frmt_ptr;	//risky
	
	for(int i=0;i<(chfb_ptr->msizey);i++){
		for(int j=0;j<chfb_ptr->msizex;j++){
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
	for(int j=0;j<chfb_ptr->msizex/2;j+=1){
		(*fbtb_ptr_cstd)[0][j*2+2]=j%10+'0';
		(*frmt_ptr_cstd)[0][j*2+2][0]=(j/10>0)?30+j/10:37;	//if j>10 colour numer set by line above
	}
	for(int i=2;i<chfb_ptr->msizey;i+=2){
		(*fbtb_ptr_cstd)[i][0]=i/2+47+49;
		(*frmt_ptr_cstd)[i][0][0]=(i/6>0)?30+i/6:37;
	}
	

	//draw bottom border
	for(int i=0;i<chfb_ptr->sizex;i++){
		(*fbtb_ptr_cstd)[chfb_ptr->msizey][i]=i%2?FRAMECHARS[9]:FRAMECHARS[0];
	}

	return(chfb_ptr);
}

void
fb_screen_draw_bw(struct chfb* chfb_ptr){	//backup, legacy function prints black and white screen 
	if(!chfb_ptr)exit(11);
	resizexy(FSIZE_X,FSIZE_Y);

	for(int i=0;i<chfb_ptr->sizey;i++){
		for(int j=0;j<chfb_ptr->sizex;j++){
			fprintf(stdout,"%lc",*(chfb_ptr->fbtb_ptr+i*chfb_ptr->sizex+j));
		}
		fprintf(stdout,"\n");
	}
}
void
fb_screen_draw(struct chfb* chfb_ptr){
	if(!chfb_ptr)exit(11);
	resizexy(FSIZE_X,FSIZE_Y);
	wchar_t (*fbtb_ptr_cstd)[chfb_ptr->sizey][chfb_ptr->sizex]=(void*)chfb_ptr->fbtb_ptr;	//risky
	unsigned char (*frmt_ptr_cstd)[chfb_ptr->sizey][chfb_ptr->sizex][3]=(void*)chfb_ptr->frmt_ptr;	//risky

	for(int i=0;i<chfb_ptr->sizey;i++){
		for(int j=0;j<chfb_ptr->sizex;j++){
			//fprintf(stdout,"%lc",(*fbtb_ptr_cstd)[i][j]);
			
			// IFs below are check format_tabel for number of formatting variables assigned to the char
			// 0-empty 1-presetn()
			//	000
			//	100
			//	110
			//	111

			if((*frmt_ptr_cstd)[i][j][0]==0&&(*frmt_ptr_cstd)[i][j][1]==0&&(*frmt_ptr_cstd)[i][j][2]==0){
				fprintf(stdout,"%lc",(*fbtb_ptr_cstd)[i][j]);

			}else if((*frmt_ptr_cstd)[i][j][0]!=0&&(*frmt_ptr_cstd)[i][j][1]==0&&(*frmt_ptr_cstd)[i][j][2]==0){
				prtnch((*fbtb_ptr_cstd)[i][j],1,(*frmt_ptr_cstd)[i][j][0]);

			}else if((*frmt_ptr_cstd)[i][j][0]!=0&&(*frmt_ptr_cstd)[i][j][1]!=0&&(*frmt_ptr_cstd)[i][j][2]==0){
				prtnch((*fbtb_ptr_cstd)[i][j],2,(*frmt_ptr_cstd)[i][j][0],(*frmt_ptr_cstd)[i][j][1]);

			}else if((*frmt_ptr_cstd)[i][j][0]!=0&&(*frmt_ptr_cstd)[i][j][1]!=0&&(*frmt_ptr_cstd)[i][j][2]!=0){
				prtnch((*fbtb_ptr_cstd)[i][j],2,(*frmt_ptr_cstd)[i][j][0],(*frmt_ptr_cstd)[i][j][1],(*frmt_ptr_cstd)[i][j][2]);
			}
		}
		fprintf(stdout,"\n");
	}
}

void prtnch(wchar_t chr, unsigned char nofarg,...){
	if(nofarg<1||nofarg>3)exit(EXIT_FAILURE);

	va_list vl;
	va_start(vl, nofarg); 

	switch(nofarg){
		case 1:
			fprintf(stdout,"\033[%dm%lc\033[0m",va_arg(vl,int),chr);
		break;
		case 2:
			fprintf(stdout,"\033[%d;%dm%lc\033[0m",va_arg(vl,int),va_arg(vl,int),chr);
		break;
		case 3:
			fprintf(stdout,"\033[%d;%d;%dm%lc\033[0m",va_arg(vl,int),va_arg(vl,int),va_arg(vl,int),chr);
		break;
	} 
	va_end(vl);
}


void
fb_draw_ship_single(struct chfb* chfb_ptr, struct ship* ship_ptr, char color_code){
	if(!chfb_ptr)exit(EXIT_FAILURE);
	if(!ship_ptr)exit(EXIT_FAILURE);
	
	wchar_t (*fbtb_ptr_cstd)[chfb_ptr->sizey][chfb_ptr->sizex]=(void*)chfb_ptr->fbtb_ptr;	//risky
	unsigned char (*frmt_ptr_cstd)[chfb_ptr->sizey][chfb_ptr->sizex][3]=(void*)chfb_ptr->frmt_ptr;	//risky

color_code=31;	//TEMP, DELETE

	//2+ move from the edge if the screen; i*2 allign to the grid
	if(ship_ptr->shdir){
		for(int i=0;i<ship_ptr->shsize;i++){
			(*fbtb_ptr_cstd)[2+ship_ptr->say][2+ship_ptr->sax+i*2]='#';
			(*frmt_ptr_cstd)[2+ship_ptr->say][2+ship_ptr->sax+i*2][0]=color_code;
			
		}
		
	}else{
		for(int j=0;j<ship_ptr->shsize;j++){
			(*fbtb_ptr_cstd)[2+ship_ptr->say+j*2][2+ship_ptr->sax]='#';		
			(*frmt_ptr_cstd)[2+ship_ptr->say+j*2][2+ship_ptr->sax][0]=color_code;
		}
	}
	
	//return((void*)0x1);
}


