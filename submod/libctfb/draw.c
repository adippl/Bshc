#include "draw.h"

//const wchar_t FRAMECHARS[11]={0x2500,0x2502,0x250c,0x2510,0x2514,0x2518,0x251c,0x2525,0x252c,0x2534,0x253c};	// ─│┌┐└┘├┤┬┴┼
const wchar_t FRAMECHARS[11]=L"─│┌┐└┘├┤┬┴┼";	// ─│┌┐└┘├┤┬┴┼
const wchar_t FRAMECHARSD[11]=L"═║╔╗╚╝╠╣╦╩╬";	// ─│┌┐└┘├┤┬┴┼
//═║╒╓╔╕╖╗╘╙╚╛╜╝╞╟╠╡╢╣╤╥╦╧╨╩╪╫╬
//═║╔╗╚╝╠╣╦╩╬


int
ctfb_emplaceString_noform(
	obj_ctfb *this,
	uint16_t posx,
	uint16_t posy,
	uint16_t strlen,
	uint_fast8_t mode,
	wchar_t *wstring){
	
	NULL_P_CHECK(this);
	NULL_P_CHECK(wstring);
	
	/* mode
	 * 1 basic horizontal
	 * 2 basic vertical
	 * 11 folding vertical
	 * 22 folding horizontal
	 *
	 * string length check separate for readibility
	 */
	
	switch(mode){
		case(CTFB_VERT):
			if(posx+strlen>this->sizex)
				return(1);
			break;
		case(CTFB_HOR):
			if(posy+strlen>this->sizey)
				return(1);
			break;
		case(CTFB_VERTF):
			if(posx+strlen>this->area)
				return(1);
			break;
		case(CTFB_HORF):
			if(posy+strlen>this->area)
				return(1);
			break;
		default:
				return(2);
			break;
		}
	
	switch(mode){
		case(CTFB_VERT):
			for(uint_fast16_t i=0;i<strlen;i++){
				//ctfb_setwchar(this,posx+i,posy,*(wstring+i),0);
				ctfb_setwchar_noform(this,posx+i,posy,*(wstring+i));
				}
			return(0);
			break;
		case(CTFB_HOR):
			for(uint_fast16_t i=0;i<strlen;i++){
				ctfb_setwchar_noform(this,posx,posy+i,*(wstring+i));
				}
			return(0);
			break;
		case(CTFB_VERTF):
			fprintf(stderr,"%s mode %u unimplemented",__func__,mode);
			return(3);
			break;
		case(CTFB_HORF):
			fprintf(stderr,"%s mode %u unimplemented",__func__,mode);
			return(3);
			break;
		default:
				return(2);
			break;
		}
	return(99);}

int
ctfb_fillRectangle(
	obj_ctfb *this,
	uint16_t posx,
	uint16_t posy,
	uint16_t lenx,
	uint16_t leny,
	fwchar *ap_fwchar){
	
	NULL_P_CHECK(this);
	NULL_P_CHECK(ap_fwchar);
	
	/* addding one to left size to avoid subtracting on right */
	if(	posx>=this->sizex ||
		posx+lenx>=this->sizex+1 ||
		posy>=this->sizey ||
		posy+leny>=this->sizey+1){
		fprintf(stderr,"err %s index out of bounds %d %d %d %d \n",__func__,posx,posy,lenx,leny);
		return(1);}
		
	CTFB_GET_RAW_2D_fwchar_ARRAY(fwchar_array,this);
	
	for(uint16_t i=0;i<leny;i++){
		for(uint16_t j=0;j<lenx;j++){
		(*fwchar_array)[posy+i][posx+j]=*ap_fwchar;
		}}
	return(0);}

int
ctfb_fillRectangleWith(
	obj_ctfb *this,
	uint16_t posx,
	uint16_t posy,
	uint16_t lenx,
	uint16_t leny,
	uint_fast8_t mode){
	
	NULL_P_CHECK(this);

	fwchar fw={0};
	switch(mode){
		case(CTFB_TRANSPARENT):
			fw.argc=4;
			fw.arg1=1;
			fw.arg2='C';
			fw.arg3=0;
			fw.wchar='\0';
			break;
		case(CTFB_SPACE):
			fw.argc=0;
			fw.arg1=0;
			fw.arg2=0;
			fw.arg3=0;
			fw.wchar=' ';
			break;
		default:
			return(1);
			break;}
	if(ctfb_fillRectangle(this,posx,posy,lenx,leny,&fw))return(2);
	return(0);}


int
ctfb_formatRectangle(
	obj_ctfb *this,
	uint16_t posx,
	uint16_t posy,
	uint16_t lenx,
	uint16_t leny,
	fwchar *ap_fwchar){
	
	NULL_P_CHECK(this);
	NULL_P_CHECK(ap_fwchar);
	
	/*addding one to left size to avoid subtracting on right*/
	if(	posx>=this->sizex ||
		posx+lenx>=this->sizex+1 ||
		posy>=this->sizey ||
		posy+leny>=this->sizey+1){
		fprintf(stderr,"err %s index out of bounds %d %d %d %d \n",__func__,posx,posy,lenx,leny);
		return(1);}
		
	CTFB_GET_RAW_2D_fwchar_ARRAY(fwchar_array,this);

	for(uint16_t i=0;i<leny;i++){
		for(uint16_t j=0;j<lenx;j++){
		(*fwchar_array)[posy+i][posx+j].argc=ap_fwchar->argc;
		(*fwchar_array)[posy+i][posx+j].arg1=ap_fwchar->arg1;
		(*fwchar_array)[posy+i][posx+j].arg2=ap_fwchar->arg2;
		(*fwchar_array)[posy+i][posx+j].arg3=ap_fwchar->arg3;
		}}
	return(0);}

int
ctfb_drawWin(
	obj_ctfb *this,
	uint16_t posx,
	uint16_t posy,
	uint16_t lenx,
	uint16_t leny){
	
	NULL_P_CHECK(this);
	fwchar fw={0};
	if(lenx<3||leny<3){
		fprintf(stderr,"err %s window too small",__func__);
		return(1);}
	if(	posx>=this->sizex ||
		posx+lenx>=this->sizex+1 ||
		posy>=this->sizey ||
		posy+leny>=this->sizey+1){
		#ifdef DEBUG
		fprintf(stderr,"err %s index out of bounds %d %d %d %d \n",__func__,posx,posy,lenx,leny);
		#endif
		return(1);}
	
	/* outline mode */
	uint_fast8_t oxl=0;
	uint_fast8_t oyl=0;
	uint_fast8_t oxr=0;
	uint_fast8_t oyr=0;
	if(posx>0){oxl=1;oxr=2;}
	if(posy>0){oyl=1;oyr=2;}
	if(posx+lenx+1<this->sizex)oxr+=2;
	if(posy+leny+1<this->sizey)oyr+=2;
	/* stupid */
	if((posx>0)&&(posx+lenx+1<this->sizex))oxr=3;
	if((posy>0)&&(posy+leny+1<this->sizey))oyr=3;
	fprintf(stderr,"%d %d %d %d\n",oxl,oyl,oxr,oyr);
	
	//ctfb_fillRectangleWith(this,posx,posy,lenx,leny,CTFB_SPACE);
	ctfb_fillRectangleWith(	this,
							posx-oxl,
							posy-oyl,
							lenx+oxr,
							leny+oyr,
							CTFB_SPACE);
	
	fw.wchar=FRAMECHARSD[CTFB_FH];
	ctfb_fillRectangle(this,posx+1,posy,lenx-1,1,&fw);
	ctfb_fillRectangle(this,posx+1,posy+leny,lenx-1,1,&fw);
	fw.wchar=FRAMECHARSD[CTFB_FV];
	ctfb_fillRectangle(this,posx,posy+1,1,leny-1,&fw);
	ctfb_fillRectangle(this,posx+lenx,posy+1,1,leny-1,&fw);
	this->setwchar_noform(this,posx,posy,L'X');
	this->setwchar_noform(this,posx,posy+leny,FRAMECHARSD[CTFB_FBL]);
	this->setwchar_noform(this,posx+lenx,posy+leny,FRAMECHARSD[CTFB_FBR]);
	this->setwchar_noform(this,posx+lenx,posy,FRAMECHARSD[CTFB_FTR]);
	return(0);}

/* 
 * Bresenham's algo from:
 * http://tech-algorithm.com/articles/drawing-line-using-bresenham-algorithm/
 * void line(int x,int y,int x2, int y2, int color) {
 *     int w = x2 - x ;
 *     int h = y2 - y ;
 *     int dx1 = 0, dy1 = 0, dx2 = 0, dy2 = 0 ;
 *     if (w<0) dx1 = -1 ; else if (w>0) dx1 = 1 ;
 *     if (h<0) dy1 = -1 ; else if (h>0) dy1 = 1 ;
 *     if (w<0) dx2 = -1 ; else if (w>0) dx2 = 1 ;
 *     int longest = Math.abs(w) ;
 *     int shortest = Math.abs(h) ;
 *     if (!(longest>shortest)) {
 *         longest = Math.abs(h) ;
 *         shortest = Math.abs(w) ;
 *         if (h<0) dy2 = -1 ; else if (h>0) dy2 = 1 ;
 *         dx2 = 0 ;            
 *     }
 *     int numerator = longest >> 1 ;
 *     for (int i=0;i<=longest;i++) {
 *         putpixel(x,y,color) ;
 *         numerator += shortest ;
 *         if (!(numerator<longest)) {
 *             numerator -= longest ;
 *             x += dx1 ;
 *             y += dy1 ;
 *         } else {
 *             x += dx2 ;
 *             y += dy2 ;
 *         }
 *     }
 * }
 */

int
ctfb_lineToArr( 
	TEMPLATE3(arr,arrStrct,ctvc2) *arr,
	ctvc2* src, 
	ctvc2* dest){
	
	NULL_P_CHECK(arr);
	NULL_P_CHECK(src);
	NULL_P_CHECK(dest);
	
	ctvc2* p_vec=NULL;

	register int srcx=src->x;
	register int srcy=src->y;
	
	int w=dest->x-srcx;
	int h=dest->y-srcy;
	int dx1=0, dy1=0, dx2=0, dy2=0 ;
	if(w<0)dx1=-1;
		else if(w>0)dx1=1;
	if(h<0)dy1=-1;
		else if(h>0)dy1=1;
	if(w<0)dx2=-1;
		else if(w>0)dx2=1;
	int longest=abs(w) ;
	int shortest=abs(h) ;
	if(!(longest>shortest)){
		longest=abs(h) ;
		shortest=abs(w) ;
		if(h<0)dy2=-1;
			else if(h>0)dy2=1;
		dx2=0;}
	int numerator=longest>>1;
	for(int i=0;i<=longest;i++){
		if((p_vec=TEMPLATE3(arr,append,ctvc2)(arr))){
			p_vec->x=srcx;
			p_vec->y=srcy;}
		else{return(1);}
		//putpixel(x,y,color) ;
		numerator+=shortest;
		if(!(numerator<longest)){
			numerator-=longest;
			srcx+=dx1;
			srcy+=dy1;}
		else{
			srcx+=dx2;
			srcy+=dy2;}}
	
	return(0);}

int
ctfb_drawFromVec(
	obj_ctfb *this,
	TEMPLATE3(arr,arrStrct,ctvc2)* ap_vecArr,
	fwchar *ap_fwchar){
	
	NULL_P_CHECK(this);
	NULL_P_CHECK(ap_vecArr);
	NULL_P_CHECK(ap_fwchar);
	
	CTFB_GET_RAW_2D_fwchar_ARRAY(fwchar_array,this);
	ctvc2* vec=NULL;

	#ifdef DEBUG
		fprintf(stderr,"\nDEBUG %s drawing from array %p",__func__,(void*)ap_vecArr);  
		ap_vecArr->objPrint=(void* (*)(void*))ctvc2ArrDump;
		TEMPLATE3(arr,dump,ctvc2)(ap_vecArr);
	#endif

	TEMPLATE3(arr,iterResetStart,ctvc2)(ap_vecArr);
	while((vec=TEMPLATE3(arr,iterNext,ctvc2)(ap_vecArr))!=NULL){
		if(vec->x<this->sizex&&vec->y<this->sizey){	/* bounds checks */
			(*fwchar_array)[vec->y][vec->x]=*ap_fwchar;
			//#ifdef DEBUG
			//fprintf(stderr,"%s iterate over results\n");
			//ctvc2ArrDump(vec);
			//#endif
			}
			#ifdef DEBUG
			else{
			fprintf(stderr,"!!!err func %s y=%u x=%u  INDEX OUT OF BOUNDS\n",__func__,vec->y,vec->x);
			}
			#endif
		}
	return(0);}

int
ctfb_drawDiagLine(
	obj_ctfb *this,
	ctvc2* src,
	ctvc2* dest,
	fwchar *ap_fwchar){
	
	NULL_P_CHECK(this);
	NULL_P_CHECK(src);
	NULL_P_CHECK(dest);
	NULL_P_CHECK(ap_fwchar);
	
	TEMPLATE3(arr,arrStrct,ctvc2)* arr=TEMPLATE3(arr,Init,ctvc2)();
	
	if(ctfb_lineToArr(arr,src,dest)){
		TEMPLATE3(arr,Free,ctvc2)(arr);
		return(1);}
	
	ctfb_drawFromVec(this,arr,ap_fwchar);
	
	TEMPLATE3(arr,Free,ctvc2)(arr);
	return(0);}
