
#include "conf.h"
#include "term.h"

//const char FRAMECHARS[]="─│┌┐└┘├┤┬┴┼"; // DOESN'T WORK

const int32_t FRAMECHARS[11]={0x2500,0x2502,0x250c,0x2510,0x2514,0x2518,0x251c,0x2525,0x252c,0x2534,0x253c};	// ─│┌┐└┘├┤┬┴┼

void
clear(){ fprintf(stdout,"\033[H\033[J");}
void
gotoxy(int x,int y){fprintf(stdout,"\033[%d;%dH",y,x);}
void
resizexy(int x,int y){fprintf(stdout,"\033[8;%d;%dt",y,x);}

struct chfb*
fb_init(){
	struct chfb* chfb=malloc(sizeof(struct chfb));
	if(!chfb)return(NULL);

	chfb->sizex=SIZE_X*2+1;
        chfb->sizey=SIZE_Y*2+1;
        chfb->area=chfb->sizex*chfb->sizey;
	
	chfb->msizex=SIZE_X*2+1;
        chfb->msizey=SIZE_Y*2+1;
        chfb->marea=chfb->msizex*chfb->msizey;
	 
	chfb->fbtb_ptr=malloc(sizeof(int32_t)*chfb->area);
	if(!chfb->fbtb_ptr)return(NULL);
	for(int i=0;i<chfb->area;i++){
		*(chfb->fbtb_ptr+i)=' ';
	}
	return(chfb);
}
void
fb_free(struct chfb** chfb){
	if(!*chfb)exit(11);
	free((*chfb)->fbtb_ptr);
	free(*chfb);
	*chfb=NULL;
}


struct chfb*
fb_draw_map(struct chfb* chfb){
	if(!chfb)return(NULL);
	
	for(int i=0;i<(chfb->sizey);i++){
		for(int j=0;j<chfb->sizex;j++){
			if(i%2==1&&j%2==1){
				//*(chfb->fbtb_ptr+i*chfb->sizex+j)='+';
				*(chfb->fbtb_ptr+i*chfb->sizex+j)=FRAMECHARS[10];
			}else if(j%2==0&&i%2==1){
				//*(chfb->fbtb_ptr+i*chfb->sizex+j)='-';
				*(chfb->fbtb_ptr+i*chfb->sizex+j)=FRAMECHARS[0];
			}else if(j%2==1&&i%2==0){
				//*(chfb->fbtb_ptr+i*chfb->sizex+j)='|';
				*(chfb->fbtb_ptr+i*chfb->sizex+j)=FRAMECHARS[1];
			}
			else{
				*(chfb->fbtb_ptr+i*chfb->sizex+j)=' ';
			}
		}
	}
	int k=0;
	for(int j=0;j<chfb->sizex/2;j+=1){
		*(chfb->fbtb_ptr+2+0*chfb->sizex+j*2)=j%10+48;	//+47 converts j into number
		//*(chfb->fbtb_ptr+0*chfb->sizex+j)=j/2+47;	//+47 converts j into number
		
	}
	//for(int j=2;j<chfb->sizex;j+=2){
	//	*(chfb->fbtb_ptr+0*chfb->sizex+j)=j/2%10+47;	//+47 converts j into number
	//	//*(chfb->fbtb_ptr+0*chfb->sizex+j)=j/2+47;	//+47 converts j into number
	//	
	//}
	for(int i=2;i<chfb->sizex;i+=2){
		*(chfb->fbtb_ptr+i*chfb->sizex+0)=i/2+47+49;	//+47 converts i into number, +49 converts it into a letter
	}


	return(chfb);
}
void
fb_screen_draw(struct chfb* chfb){
	if(!chfb)exit(11);
	resizexy(FSIZE_X,FSIZE_Y);

	for(int i=0;i<chfb->sizey;i++){
		for(int j=0;j<chfb->sizex;j++){
			fprintf(stdout,"%lc",*(chfb->fbtb_ptr+i*chfb->sizex+j));
		}
		fprintf(stdout,"\n");
	}
}

