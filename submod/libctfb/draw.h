#ifndef _CTFB_DRAW_H
#define _CTFB_DRAW_H
#include "conf.h"
#include "term.h"

const wchar_t FRAMECHARS[11];	//utf box drawing characters
const wchar_t FRAMECHARSD[11];	//utf box drawing characters

#define CTFB_FH (0)
#define CTFB_FV (1)
#define CTFB_FTL (2)
#define CTFB_FTR (3)
#define CTFB_FBL (4)
#define CTFB_FBR (5)
#define CTFB_FHL (6)
#define CTFB_FHR (7)
#define CTFB_FVT (8)
#define CTFB_FVB (9)
#define CTFB_FX (10)

#define CTFB_VERT (1)
#define CTFB_HOR (2)
#define CTFB_VERTF (11)
#define CTFB_HORF (22)

#define CTFB_TRANSPARENT (100)
#define CTFB_SPACE (101)

int ctfb_emplaceString_noform(
	obj_ctfb *this,
	uint16_t posx,
	uint16_t posy,
	uint16_t strlen,
	uint_fast8_t mode,
	wchar_t *wstring);

int ctfb_fillRectangle(
	obj_ctfb *this,
	uint16_t posx,
	uint16_t posy,
	uint16_t lenx,
	uint16_t leny,
	fwchar *ap_fwchar);

int ctfb_fillRectangleWith(
	obj_ctfb *this,
	uint16_t posx,
	uint16_t posy,
	uint16_t lenx,
	uint16_t leny,
	uint_fast8_t mode);

int ctfb_formatRectangle(
	obj_ctfb *this,
	uint16_t posx,
	uint16_t posy,
	uint16_t lenx,
	uint16_t leny,
	fwchar *ap_fwchar);

int ctfb_drawWin(
	obj_ctfb *this,
	uint16_t posx,
	uint16_t posy,
	uint16_t lenx,
	uint16_t leny);

int ctfb_lineToArr( /* generates garbage results for 2nd octant TODO BUG 1 */
	TEMPLATE3(arr,arrStrct,ctvc2) *arr,
	ctvc2* src, 
	ctvc2* dest);
	
int
ctfb_drawFromVec(
	obj_ctfb *this,
	TEMPLATE3(arr,arrStrct,ctvc2)* ap_vecArr,
	fwchar *ap_fwchar);

int
ctfb_drawDiagLine(
	obj_ctfb *this,
	ctvc2* src,
	ctvc2* dest,
	fwchar *ap_fwchar);

#endif // _CTFB_DRAW_H
