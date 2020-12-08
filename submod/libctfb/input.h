#ifndef _CTFB_INPUT_H
#define _CTFB_INPUT_H
#include "conf.h"

static const uint8_t CTFB_ESC=27;
#define CTFB_ESC_DEF (27)
static const uint8_t CTFB_RET=10;
#define CTFB_RET_DEF (10)

static const uint8_t CTFB_ASCII4_CTRL_D=4;
static const uint8_t CTFB_ASCII8_DEL=8;
static const uint8_t CTFB_ASCII21_CTRL_U=21;
static const uint8_t CTFB_BACKSPACE=127;


static const uint8_t CTFB_UP=128;
static const uint8_t CTFB_LEFT=129;
static const uint8_t CTFB_RIGHT=130;
static const uint8_t CTFB_DOWN=131;

static const uint8_t CTFB_UP_SHIFT=132;
static const uint8_t CTFB_LEFT_SHIFT=133;
static const uint8_t CTFB_RIGHT_SHIFT=134;
static const uint8_t CTFB_DOWN_SHIFT=135;

static const uint8_t CTFB_NE=136;
static const uint8_t CTFB_SE=137;
static const uint8_t CTFB_NW=138;
static const uint8_t CTFB_SW=139;

static const uint8_t CTFB_NE_SHIFT=140;
static const uint8_t CTFB_SE_SHIFT=141;
static const uint8_t CTFB_NW_SHIFT=142;
static const uint8_t CTFB_SW_SHIFT=143;

static const uint8_t CTFB_F1=144;
static const uint8_t CTFB_F2=145;
static const uint8_t CTFB_F3=146;
static const uint8_t CTFB_F4=147;

char ctfb_getkeySimplified(int* specialKeyCode);
int ctfb_isStdChar(char* ap_char);

#endif // _CTFB_INPUT_H
