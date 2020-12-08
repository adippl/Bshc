#ifndef _TEST_TEMPLATETL_H_
#define _TEST_TEMPLATETL_H_


#ifdef T
#undef T
#endif
#define T int8_t
#include "tmpl/harr.h"

#ifdef T
#undef T
#endif
#define T int8_t
#include "tmpl/arr.h"

#endif // _TEST_TEMPLATETL_H_
