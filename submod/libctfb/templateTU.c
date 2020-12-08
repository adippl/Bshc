

#include "conf.h"

#ifdef T
#undef T
#endif
#define T int8_t
#include "cstl/tmpl/arr.c"

#ifdef T
#undef T
#endif
#define T fwchar
#include "cstl/tmpl/arr.c"

#ifdef T
#undef T
#endif
#define T ctvc2
#include "cstl/tmpl/arr.c"
