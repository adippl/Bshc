/*  ctfb - C terminal handling library for linux/unix systems
 *  Copyright (C) 2020  Adam Prycki
 *  
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation version 2 of the License.
 *  
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *  
 *  You should have received a copy of the GNU General Public License along
 *  with this program; if not, write to the Free Software Foundation, Inc.,
 *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include "term.h"


void
ctfb_clearTerm(){ fprintf(stdout,"\033[H\033[J");}
void
ctfb_gotoxy(uint16_t x,uint16_t y){fprintf(stdout,"\033[%d;%dH",y,x);}
void
ctfb_resizexy(uint16_t x,uint16_t y){fprintf(stdout,"\033[8;%d;%dt",y,x);}

obj_ctfb*
ctfb_init(){
	obj_ctfb* p_ctfb=malloc(sizeof(obj_ctfb));
	NULL_P_CHECK(p_ctfb);

	p_ctfb->objSize=sizeof(obj_ctfb);
	p_ctfb->objName=0;
	p_ctfb->init=ctfb_init;
	p_ctfb->free=ctfb_free;
	p_ctfb->copy=ctfb_copyDeep;
	p_ctfb->copyDeep=ctfb_copyDeep;

	p_ctfb->setSize=ctfb_setSize;
	p_ctfb->clear=ctfb_clear;
	p_ctfb->gotoxy=ctfb_gotoxy;
	p_ctfb->resizeTerm=NULL;
	p_ctfb->print=ctfb_screenDraw_new;
	p_ctfb->setwchar_noform=ctfb_setwchar_noform;
	p_ctfb->setwchar=ctfb_setwchar;

	p_ctfb->p_fwcharArr=TEMPLATE3(arr,Init,fwchar)();
	p_ctfb->arr_iterResetStart=TEMPLATE3(arr,iterResetStart,fwchar);
	p_ctfb->arr_iterNext=TEMPLATE3(arr,iterNext,fwchar);

	return(p_ctfb);}

obj_ctfb*
ctfb_setSize(obj_ctfb* this, uint16_t x,uint16_t y){
	NULL_P_CHECK(this);
	this->sizex=x;
	this->sizey=y;
	this->area=x*y;
	TEMPLATE3(arr,extendBy,fwchar)(this->p_fwcharArr,this->area);
	this->p_fwcharArr->usedCapacity=x*y;

	return(this);}

void
ctfb_free(obj_ctfb* this){
	NULL_P_CHECK(this);
	this->p_fwcharArr->free(this->p_fwcharArr);
	free(this);
	this=NULL;}


void
ctfb_clear(obj_ctfb* this){
	NULL_P_CHECK(this);
	this->arr_iterResetStart(this->p_fwcharArr);
	memset(this->p_fwcharArr->p_array,0,sizeof(fwchar)*this->area);
	fwchar *fw=NULL;
	while((fw=this->arr_iterNext(this->p_fwcharArr))){
		fw->argc=0;
		fw->arg1=0;
		fw->arg2=0;
		fw->arg3=0;
		fw->wchar=' ';}
}


void
ctfb_screen_clearArea(uint16_t x, uint16_t y, uint16_t xm, uint16_t ym){
	ctfb_gotoxy(x,y);
	for(int j=0;j<ym;j++){
		for(int i=0;i<xm;i++){
			fprintf(stdout," ");}
		fprintf(stdout,"\n");}}


void
ctfb_screenClearArea(uint16_t x, uint16_t y, uint16_t xm, uint16_t ym){
	ctfb_gotoxy(x,y);
	for(int j=0;j<ym;j++){
		for(int i=0;i<xm;i++){
			fprintf(stdout," ");}
		fprintf(stdout,"\n");}}



void
ctfb_setwchar_noform(
	obj_ctfb* this,
	uint_fast16_t x,
	uint_fast16_t y,
	wchar_t wch){

	if(x+1>this->sizex||y+1>this->sizey){
		fprintf(stderr,"index out of bounds x=%ld y=%ld\n",x,y);
		return;}

	CTFB_GET_RAW_2D_fwchar_ARRAY(fwchar_array,this);
	(*fwchar_array)[y][x].argc=0;
	(*fwchar_array)[y][x].wchar=wch;}

void
ctfb_setwchar(
	obj_ctfb* this,
	uint_fast16_t x,
	uint_fast16_t y,
	wchar_t wch,
	int nofarg,
	...){

	if(nofarg<0||nofarg>3){
		fprintf(stderr,"wrong argument number at ");
		return;}
	if(x>this->sizex||y>this->sizey){
		fprintf(stderr,"index out of bounds x=%ld y=%ld\n",x,y);
		return;}

	CTFB_GET_RAW_2D_fwchar_ARRAY(fwchar_array,this);
	
	va_list vl;
	va_start(vl, nofarg); 
	switch(nofarg){
		case 0:
			(*fwchar_array)[x][y].wchar=wch;
			break;
		case 1:
			(*fwchar_array)[y][x].wchar=wch;
			(*fwchar_array)[y][x].arg1=0xFF&va_arg(vl,int);
			break;
		case 2:
			(*fwchar_array)[y][x].wchar=wch;
			(*fwchar_array)[y][x].arg1=0xFF&va_arg(vl,int);
			(*fwchar_array)[y][x].arg2=0xFF&va_arg(vl,int);
			break;
		case 3:
			(*fwchar_array)[y][x].wchar=wch;
			(*fwchar_array)[y][x].arg1=0xFF&va_arg(vl,int);
			(*fwchar_array)[y][x].arg2=0xFF&va_arg(vl,int);
			(*fwchar_array)[y][x].arg3=0xFF&va_arg(vl,int);
			break;
		case 4:
			(*fwchar_array)[y][x].wchar='\0';
			(*fwchar_array)[y][x].arg1=0xFF&va_arg(vl,int);
			(*fwchar_array)[y][x].arg2=0xFF&va_arg(vl,int);
			break;
		default:
			break;}
	va_end(vl);}

void
ctfb_prntfwch(fwchar* wch){
	switch(wch->argc){
		case(0):
			fprintf(stdout,"%lc",wch->wchar);
			break;
		case(1):
			fprintf(stdout,"\033[%dm%lc\033[0m",
				wch->arg1,wch->wchar);
			break;
		case(2):
			fprintf(stdout,"\033[%d;%dm%lc\033[0m",
				wch->arg1,wch->arg2,wch->wchar);
			break;
		case(3):
			fprintf(stdout,"\033[%d;%d;%dm%lc\033[0m",
				wch->arg1,wch->arg2,wch->arg3,wch->wchar);
			break;
		case(4):
			fprintf(stdout,"\033[%d;%c",
				wch->arg1,(char)wch->arg2);
			break;
		default:
			return;}}

void
ctfb_termResizeFailedMsg(){
	ctfb_clearTerm();
	printf("\n\n\nTERMINAL REIZE FAILED\n");
	printf("\n\n\nPress enter to retry resize\n");
	char c=getchar();
	printf("%c\n",c);/*unusedvariable warning*/
	return;}

int
ctfb_termCheckSize(obj_ctfb* this){
	struct winsize w;
	ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);
    //w.ws_row
    //w.ws_col
	if(w.ws_col!=this->sizex||w.ws_row!=this->sizey)
		ctfb_resizexy(this->sizex,this->sizey);
	ioctl(STDOUT_FILENO, TIOCGWINSZ, &w);
	if(w.ws_col<this->sizex||w.ws_row<this->sizey)
		return(1);
	return(0);}

void
ctfb_screenDraw_new(obj_ctfb* this){
	NULL_P_CHECK(this);

	/* terminal size section */
	while(ctfb_termCheckSize(this)){
		ctfb_termResizeFailedMsg();}

	/* print section */
	/* TODO replace crude pointerarithmetic with function getting ptr from arr */
	CTFB_GET_RAW_2D_fwchar_ARRAY(fwchar_array,this);

	for(int i=0;i<this->sizey;i++){
		for(int j=0;j<this->sizex;j++){
			ctfb_prntfwch(&(*fwchar_array)[i][j]);
			}
		if(i<this->sizey-1)fprintf(stdout,"\n");
		}
	ctfb_gotoxy(0,0);
	return;}

void*
ctfb_copyArrays(obj_ctfb* ap_src, obj_ctfb* ap_dest){
	NULL_P_CHECK(ap_src);	
	NULL_P_CHECK(ap_dest);	
	/* size check */
	if(	ap_src->sizex==ap_dest->sizex&&
		ap_src->sizey==ap_dest->sizey&&
		ap_src->area==ap_dest->area)return(NULL);
	
	return memcpy(ap_dest->p_fwcharArr->p_array,
		ap_src->p_fwcharArr->p_array,
		ap_src->area*sizeof(fwchar));}

void
ctfb_dump(obj_ctfb* this){
	printf("\nx=%u y=%u area=%u p_fwcharArr=%p\n",
		this->sizex,
		this->sizey,
		this->area,
		(void*)this->p_fwcharArr);}

obj_ctfb*
ctfb_copyDeep(obj_ctfb* this){
	NULL_P_CHECK(this);
	//TEMPLATE3(arr,dump,fwchar)(this->p_fwcharArr);
	obj_ctfb* obj_ret=ctfb_init();
	NULL_P_CHECK(obj_ret);
	obj_ret->setSize(obj_ret,this->sizex,this->sizey);
	//TEMPLATE3(arr,dump,fwchar)(obj_ret->p_fwcharArr);
	ctfb_copyArrays(this,obj_ret);
	return(obj_ret);}


void
ctfb_fillWithEmpty(obj_ctfb* this){
	NULL_P_CHECK(this);
	fwchar *fw=NULL;
	while((fw=this->arr_iterNext(this->p_fwcharArr))){
		//printf("p=%p\n",fw);
		fw->argc=4;
		fw->arg1=1;
		fw->arg2='C';
		fw->arg3=0;
		fw->wchar='\0';}}

void
ctfb_termUnbuff(struct termios *ap_struct){
	NULL_P_CHECK(ap_struct);
	tcgetattr(STDIN_FILENO,ap_struct);
	struct termios new=*ap_struct;
	new.c_lflag &=(~ICANON & ~ECHO);
	tcsetattr(STDIN_FILENO,TCSANOW,&new);
	}
void
ctfb_termRestore(struct termios *ap_struct){
	NULL_P_CHECK(ap_struct);
	tcsetattr(STDIN_FILENO,TCSANOW,ap_struct);
	}
