#ifndef CONF_H
#define CONF_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdbool.h>
#include <time.h>
#include <locale.h>
#include <wchar.h>
#include <unistd.h>
#include <math.h>
#include <unistd.h>

#include "submod/pdjson/pdjson.h"
#include "submod/libctfb/ctfb.h"


/*
 * #include "submod/cstl/tmpl/tmpl.h"
 *
 * macroc copied stright from headerfile. include didn't work 
 */
#define _CAT(X,Y) X##_##Y
//#define _CAT3(X,Y) X##_##Y##_##Z
#define OBJF(X,Y) _CAT(X,Y)
#define OBF(X,Y) _CAT3(obj,X,Y)


//#define STRUCTCOPPIER(X,Y,Z) ((X)->(Z))=((Y)->(Z))
#define STRUCTCOPPIER(X,Y,Z) (X->Z)=(Y->Z)
#define _STRUCTCOPPIER_E(X,Y,Z) (X->Z)=(Y.Z)

#define M_PI	(3.14159265358979323846264338327950288)
#define M_PI_2	(1.57079632679489661923132169163975144)

#define SSTRLENG (64)

#define F_MAIN_CONF "res/conf.json"

//extern const int FSIZE_X,FSIZE_Y;	//frame size FSIZE_X=SIZE_X*2+1 FSIZE_Y=SIZE_Y*2+1+11
//extern const int SIZE_X,SIZE_Y;		//map size
//extern const int SIZE_Y_CORRECTION;		//map size quickFIX FIX IT TODO
//
//extern const int SH3L,SH4L,SH5L;	//ship length
//extern const int MAX_NSH3,MAX_NSH4,MAX_NSH5;	//max ammount of ships
//
//extern const char DPLYCOL[4];	//default player col
//
//extern const char SPREAD_DEF;
//extern const char SH3_NOSH,SH4_NOSH,SH5_NOSH;
//
//
//
////experimental object macros
////universal destructor macro
//#define del(p_struct) ((struct generic*)p_struct)->destr((void*)&p_struct)
//
////copy
////#define copy(p_struct) ((struct generic*)p_struct)->copy((void*)&p_struct)
//
//void obj_free(void** obj_pp);
//
//struct
//ob_gen{
//	void (*dstr)(void** obj_pp);//generic destructor
//};
void objFree(void* p_obj);	//generic destructor

#define DUMP_STRUCT_int(X,Y) fprintf(stderr,"\t%s %d\n",#Y,X->Y)
#define DUMP_STRUCT_size_t(X,Y) fprintf(stderr,"\t%s %ld\n",#Y,X->Y)
#define DUMP_STRUCT_uint(X,Y) fprintf(stderr,"\t%s %u\n",#Y,X->Y)
#define DUMP_STRUCT_int64(X,Y) fprintf(stderr,"\t%s %ld\n",#Y,X->Y)
#define DUMP_STRUCT_uint(X,Y) fprintf(stderr,"\t%s %u\n",#Y,X->Y)
#define DUMP_STRUCT_char(X,Y) fprintf(stderr,"\t%s %c\n",#Y,X->Y)
#define DUMP_STRUCT_string(X,Y) fprintf(stderr,"\t%s %s\n",#Y,X->Y)
#define DUMP_STRUCT_voidPtr(X,Y) fprintf(stderr,"\t%s %p\n",#Y,(void*)X->Y)

/*
#define DUMP_STRUCT_GEN(X,Y) _Generic((Y), \
	int: fprintf(stderr,"\t%s %d\n",#Y,X->Y), \
	size_t: fprintf(stderr,"\t%s %d\n",#Y,X->Y), \
	void*: fprintf(stderr,"\t%s %d\n",#Y,X->Y), \
	char*: fprintf(stderr,"\t%s %d\n",#Y,X->Y), \
	default: fprintf(stderr,"\t DUMP_STRUCT UNSUPPORTED_TYPE %s\n",#Y))
*/


/* TODO move to separate file*/
#ifndef NO_TERM
	#include <termios.h>
	#include <fcntl.h>
	struct termios termSettingBackup;
	void termUnbuff();
	void termUnbuffRestore();
	void termNonBlocking();
	void termBlocking();
#endif // NO_TERM

#endif // CONF_H

