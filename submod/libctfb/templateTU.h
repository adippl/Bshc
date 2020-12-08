#ifndef _CTFB_TEMPLATETL_H_
#define _CTFB_TEMPLATETL_H_

#include "conf.h"

#ifdef T
#undef T
#endif
#define T int8_t
#include "cstl/tmpl/arr.h"

#ifdef T
#undef T
#endif
#define T fwchar
#include "cstl/tmpl/arr.h"

#ifdef T
#undef T
#endif
#define T ctvc2
#include "cstl/tmpl/arr.h"

#endif // _CTFB_TEMPLATETL_H_
