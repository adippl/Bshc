#ifndef TESTS_H
#define TESTS_H

#include "../main.h"

#include <assert.h>

#define BUFFER_SIZE (1024)
#define JSON_VARSIZ_MAX (64)


/* doesn't work
 *
 * #define STEST (T) int test##T(){ \
 * 	printf("obj_"##T##" TEST\n"); \
 * 	T obj={0}; \
 * 	T objCopy={0}; \
 * 	T##_finalize(&obj); \
 * 	T##_finalize(&objCopy); \
 * 	T##_copy(&obj, &objCopy); \
 * 	T##_print(&obj); \
 * 	T##_print(&objCopy); \
 * 	T##_clean(&obj); \
 * 	T##_clean(&objCopy); \
 * 	printf("obj_"##T##" END OF TEST\n"); \
 * 	return(0);}
 */

#endif // TESTS_H

