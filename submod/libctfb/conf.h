#ifndef _CTFB_CONF_H
#define _CTFB_CONF_H

#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <wchar.h>
#include <stdarg.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <string.h>
#include <unistd.h>
#include <termios.h>
#include <stdbool.h>


#include "cstl/tmpl/tmpl.h"

const uint16_t __VERS;

typedef struct fwchar{
	uint8_t argc;
	uint8_t arg1;
	uint8_t arg2;
	uint8_t arg3;
	wchar_t wchar;
	}fwchar;


typedef struct ctvc2{
	uint16_t x;
	uint16_t y;
	} ctvc2;

#ifdef DEBUG
void* ctvc2ArrDump(void* obj);
#endif

#endif // _CTFB_CONF_H

