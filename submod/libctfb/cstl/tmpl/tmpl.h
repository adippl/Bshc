
#ifndef _CTEMPL_H_
#define _CTEMPL_H_

/* template macros */
#define _CAT(X,Y) X##_##Y
#define TEMPLATE(X,Y) _CAT(X,Y)
#define CAT(X,Y) _CAT(X,Y)

#define _CAT3(X,Y,Z) X##_##Y##_##Z
#define TEMPLATE3(X,Y,Z) _CAT3(X,Y,Z)

#define EXIT_NULL_P_ERR EXIT_FAILURE

//#define CSTL_NULL_P_EXIT_TYPE_RETURN
#define CSTL_NULL_P_EXIT_RETURN_VAL 1

/*
#ifndef _CSTL_NO_NULL_P_R_ERRORMSG
	#define NULL_P_CHECK_RETFALSE(X) if(!(X))fprintf(stderr,"nullpointer detected during function %s %p",__func__,(void*)&(X)),RETURN(1)
	#endif
#ifdef _CSTL_NO_NULL_P_R_ERRORMSG
	#define NULL_P_CHECK_RETFALSE(X) if(!(X))RETURN(1)
	#endif
*/

#ifndef _CSTL_NO_NULL_P_CHECKS
	#ifdef CSTL_EXIT_TYPE_RETURN
		#define NULL_P_CHECK(X) if(!(X))fprintf(stderr,"nullpointer error at %s %p",__func__,(void*)&(X)),return(CSTL_NULL_P_EXIT_RETURN_VAL)
		#endif
	
	#ifndef CSTL_EXIT_TYPE_RETURN
		#define NULL_P_CHECK(X) if(!(X))fprintf(stderr,"nullpointer error at %s %p",__func__,(void*)&(X)),exit(EXIT_NULL_P_ERR)
		#endif
	
	#endif

#ifdef _CSTL_NO_NULL_P_CHECKS
	/* if is always false, should be optimized out */
	#define NULL_P_CHECK(X) if(0)printf("this shouldn't be possible %p",(void*)(X))
	#endif


#include <stdint.h>
#include <string.h>
#include <stdlib.h>

#define HARR_DEF_ALLOCSIZE 10
//#define HARR_DEF_MAPALLOCSIZE 10
#define HARR_DEF_MAPALLOCSIZE 5

#define ARR_DEF_ALLOCSIZE 10

#define _CSTL_VERSION $Id$

#endif //_CTEMPL_H_
