#ifndef _CTFB_TERM_H
#define _CTFB_TERM_H

#include "conf.h"
#include "templateTU.h"

//typedef struct fwchar{
//	uint8_t argc;
//	uint8_t arg1;
//	uint8_t arg2;
//	uint8_t arg3;
//	wchar_t wchar;
//	}frmttdwchar;

#define CTFB_GET_RAW_2D_fwchar_ARRAY(X,Y) fwchar (*(X))[(Y)->sizey][(Y)->sizex]=(void*)TEMPLATE3(arr,_getRawPtr,fwchar)((Y)->p_fwcharArr);	//risky




typedef struct obj_ctfb obj_ctfb;
struct	obj_ctfb { //char frame buffer
//	//CAT(obj,T)* (*init)();
//	//void (*free)(struct Tstrct** pp_struct);
//	//CAT(obj,T)* (*copy)(struct Tstrct* p_struct);
//	//CAT(obj,T)* (*copyDeep)(struct Tstrct* p_struct);
//	//size_t objSize;
//	//uint16_t objName;
	/* standard object header */
	#ifdef T
	#undef T
	#endif
	#define T ctfb
	#include "cstl/tmpl/obj.h"
	#undef T
	void* (*ctfb_copyArrays)(obj_ctfb* ap_src, obj_ctfb* ap_dest);
	obj_ctfb* (*setSize)(obj_ctfb* this, uint16_t x,uint16_t y);
	void (*clear)();	//
	void (*gotoxy)(uint16_t x,uint16_t y);	//
	void (*resizeTerm)(uint16_t x,uint16_t y);	//
	void (*print)(obj_ctfb* this);	//
	void (*setwchar_noform)(obj_ctfb* this, uint_fast16_t x, uint_fast16_t y, wchar_t wch);
	void (*setwchar)(obj_ctfb* this,uint_fast16_t x,uint_fast16_t y,wchar_t wch,int nofarg,...);
	
	void (*arr_iterResetStart)(arr_arrStrct_fwchar* ap_struct);	/* pointers to iterator functions */
	fwchar* (*arr_iterNext)(arr_arrStrct_fwchar* ap_struct);
	//void TEMPLATE3(arr,iterResetStart,T)(arrStrctT* ap_struct);	/* just for completeness sake */
	//void TEMPLATE3(arr,iterResetEnd,T)(arrStrctT* ap_struct);	/* changes iterIndex to end position*/
	
	uint16_t sizex;	//frame size x
	uint16_t sizey;	//frame size y
	uint32_t area;	//frame area
	TEMPLATE3(arr,arrStrct,fwchar)* p_fwcharArr;
};


obj_ctfb*	ctfb_init();	//allocates ctfb struct
void		ctfb_free(obj_ctfb* this);	//frees memory of ctfb struct; changes pointer to null
obj_ctfb*	ctfb_copy(obj_ctfb* this);
obj_ctfb*	ctfb_copyDeep(obj_ctfb* this);

obj_ctfb*	ctfb_setSize(obj_ctfb* this, uint16_t x,uint16_t y);

void ctfb_clearTerm();	//clears terminal (prints clear signal to stdout)
void ctfb_clear(obj_ctfb* this);	//
void ctfb_gotoxy(uint16_t x,uint16_t y);	//changes cursor position (prints to stdout)
void ctfb_resizexy(uint16_t x,uint16_t y);	//resizes terminal window (prints to stdout)
void ctfb_prntch(wchar_t chr, unsigned char nofarg,...);	//prints utf8 char with ANSI escape code specific formating; 1=<nofarg=<3
void ctfb_prntfwch(fwchar* wch);


//void ctfb_ScreenDrawNoFormat(obj_ctfb* ctfb);	//draws screen, chars only
//void ctfb_screenDraw(obj_ctfb* ctfb);		//draws screen with formatting
void ctfb_screenDraw_new(obj_ctfb* this);

void ctfb_setwchar_noform(obj_ctfb* this, uint_fast16_t x, uint_fast16_t y, wchar_t wch);
void ctfb_setwchar(obj_ctfb* this,uint_fast16_t x,uint_fast16_t y,wchar_t wch,int nofarg,...);
void ctfb_fillWithEmpty(obj_ctfb* this);

void ctfb_screenClearArea(uint16_t x, uint16_t y, uint16_t xm, uint16_t ym);

#define CTFB_MOVECURSORUP(X) fprintf(stdout,"\33[%d'%c[0m",(X),A)
#define CTFB_MOVECURSORDOWN(X) fprintf(stdout,"\33[%d'%c[0m",(X),B)
#define CTFB_MOVECURSORRIGHT(X) fprintf(stdout,"\33[%d'%c[0m",(X),C)
#define CTFB_MOVECURSORLEFT(X) fprintf(stdout,"\33[%d'%c[0m",(X),D)

void ctfb_termUnbuff(struct termios *ap_struct);
void ctfb_termRestore(struct termios *ap_struct);


#endif	//_CTFB_TERM_H
