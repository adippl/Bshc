
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

	chfb->sizex=FSIZE_X;
        chfb->sizey=FSIZE_Y-1;
        chfb->area=chfb->sizex*chfb->sizey;
	
	chfb->msizex=SIZE_X*2+1;
        chfb->msizey=SIZE_Y*2+1;
        chfb->marea=chfb->msizex*chfb->msizey;
	 
	chfb->fbtb_ptr=malloc(sizeof(int32_t)*chfb->area);
	if(!chfb->fbtb_ptr)return(NULL);
	for(int i=0;i<chfb->area;i++){
		*(chfb->fbtb_ptr+i)=' ';
	}

	chfb->frmt_ptr=malloc(sizeof(unsigned char)*chfb->area*3);
	if(!chfb->frmt_ptr)return(NULL);
	for(int j=0;j<chfb->area*3;j++){
		*(chfb->frmt_ptr+j)=0;
	}

	return(chfb);
}
void
fb_free(struct chfb** chfb){
	if(!*chfb)exit(11);
	free((*chfb)->fbtb_ptr);
	free((*chfb)->frmt_ptr);
	free(*chfb);
	*chfb=NULL;
}


struct chfb*
fb_draw_map(struct chfb* chfb){
	if(!chfb)return(NULL);
	int32_t (*fbtb_ptr_cstd)[chfb->sizey][chfb->sizex]=(void*)chfb->fbtb_ptr;	//risky
	unsigned char (*frmt_ptr_cstd)[chfb->sizey][chfb->sizex][3]=(void*)chfb->frmt_ptr;	//risky
	
	for(int i=0;i<(chfb->msizey);i++){
		for(int j=0;j<chfb->msizex;j++){
			if(i%2==1&&j%2==1){
				//*(chfb->fbtb_ptr+i*chfb->msizex+j)='+';
				//*(chfb->fbtb_ptr+i*chfb->msizex+j)=FRAMECHARS[10];
				(*fbtb_ptr_cstd)[i][j]=FRAMECHARS[10];
			}else if(j%2==0&&i%2==1){
				//*(chfb->fbtb_ptr+i*chfb->msizex+j)='-';
				//*(chfb->fbtb_ptr+i*chfb->msizex+j)=FRAMECHARS[0];
				(*fbtb_ptr_cstd)[i][j]=FRAMECHARS[0];
			}else if(j%2==1&&i%2==0){
				//*(chfb->fbtb_ptr+i*chfb->msizex+j)='|';
				//*(chfb->fbtb_ptr+i*chfb->msizex+j)=FRAMECHARS[1];
				(*fbtb_ptr_cstd)[i][j]=FRAMECHARS[1];
			}
			else{
				//*(chfb->fbtb_ptr+i*chfb->msizex+j)=' ';
				(*fbtb_ptr_cstd)[i][j]=' ';
			}
		}
	}
	for(int j=0;j<chfb->msizex/2;j+=1){
		//*(chfb->fbtb_ptr+2+0*chfb->msizex+j*2)=j%10+'0';	//+48 converts j into number
		(*fbtb_ptr_cstd)[0][j*2+2]=j%10+'0';

		
	}
	for(int i=2;i<chfb->msizey;i+=2){
		//*(chfb->fbtb_ptr+i*chfb->msizex+0)=i/2+47+49;	//+47 converts i into number, +49 converts it into a letter
		(*fbtb_ptr_cstd)[i][0]=i/2+47+49;
	}


	return(chfb);
}
void
fb_screen_draw_bw(struct chfb* chfb){
	if(!chfb)exit(11);
	resizexy(FSIZE_X,FSIZE_Y);

	for(int i=0;i<chfb->sizey;i++){
		for(int j=0;j<chfb->sizex;j++){
			fprintf(stdout,"%lc",*(chfb->fbtb_ptr+i*chfb->sizex+j));
		}
		fprintf(stdout,"\n");
	}
}
void
fb_screen_draw(struct chfb* chfb){
	if(!chfb)exit(11);
	resizexy(FSIZE_X,FSIZE_Y);
	int32_t (*fbtb_ptr_cstd)[chfb->sizey][chfb->sizex]=(void*)chfb->fbtb_ptr;	//risky
	unsigned char (*frmt_ptr_cstd)[chfb->sizey][chfb->sizex][3]=(void*)chfb->frmt_ptr;	//risky

	for(int i=0;i<chfb->sizey;i++){
		for(int j=0;j<chfb->sizex;j++){
			//fprintf(stdout,"%lc",(*fbtb_ptr_cstd)[i][j]);

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

void prtnch(int32_t chr, unsigned char nofarg,...){
	if(nofarg<1||nofarg>3)exit(EXIT_FAILURE);

	va_list vl;
	va_start(vl, nofarg); 

	switch(nofarg){
		case 1:
			fprintf(stdout,"\033[%dm%c\033[0m",va_arg(vl,int),chr);
		break;
		case 2:
			fprintf(stdout,"\033[%d;%dm%c\033[0m",va_arg(vl,int),va_arg(vl,int),chr);
		break;
		case 3:
			fprintf(stdout,"\033[%d;%d;%dm%c\033[0m",va_arg(vl,int),va_arg(vl,int),va_arg(vl,int),chr);
		break;
	} 
	va_end(vl);
}

