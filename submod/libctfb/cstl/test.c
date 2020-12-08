#include <stdio.h>
#include <stdlib.h>

#include "test_templateTU.h"

	#ifdef T
	#undef T
	#endif
	#define T int8_t

/* generic printing function passed by pointer to arr
 * void* (*objPrint)(void* p_obj);
 */
void* printInt8_t(void* p_obj){
	NULL_P_CHECK(p_obj);
	printf("printing int %d from %p\n",*(int8_t*)p_obj,p_obj);
	return(NULL);}
int
testArr(){
	printf("\ninitializing arr,int8_t,int8_t \n");
	TEMPLATE3(arr,arrStrct,T)* arr=TEMPLATE3(arr,Init,T)();
	
	printf("\nassinging object printing method to arr->objPrint=&printInt8_t\n");
	arr->objPrint=&printInt8_t;
	
	printf("\nrunning one _autoextend  arr,_autoextend,int8_t \n");
	TEMPLATE3(arr,_autoextend,T)(arr);
	
	printf("\ndumping object debug information arr,dump,int8_t \n");
	TEMPLATE3(arr,dump,T)(arr);
	
	printf("\niterate and pointers for 12 first positions in array arr,indexToPtr,int8_t \n");
	/* should return 10 pointers.
	 * 11th and 12th positions are out of bounds, returns NULL */
	for(int i=0;i<12;i++){
		printf("i=%d p=%p\n",i,(void*)TEMPLATE3(arr,indexToPtr,T)(arr,i));}
	
	/* initialize empty pointer*/
	T* p_tmp=NULL;
	printf("\nappend 19 squential intigers into the array arr,append,int8_t \n");
	for(int i=0;i<19;i++){
		/* get ptr */
		p_tmp=TEMPLATE3(arr,append,T)(arr);
		/* write to ptr, bitmask because it's only int8_t */
		*p_tmp=0xFF&i;}
	
	printf("\ndumping object debug information arr,dump,int8_t \n");
	TEMPLATE3(arr,dump,T)(arr);
	
	/* iterlate over array */
	printf("\niterating over array arr,iterNext,int8_t \n");
	/* while arr_iterNext_int8_T() returns non */
	while((p_tmp=TEMPLATE3(arr,iterNext,T)(arr))){printf("p_tmp=%p\n",p_tmp);}
	// more readable version
	//while	
	//	((p_tmp=TEMPLATE3(arr,iterNext,T))(arr) != NULL)
	//		{
	//		printf("p_tmp=%p\n",p_tmp);
	//		}
	
	/* testing iterating backwards from 0 position. shouldn't be possible */
	printf("\nresetting iterator position to start arr,iterResetStart,int8_t \n");
	TEMPLATE3(arr,iterResetStart,T)(arr);
	while(p_tmp=TEMPLATE3(arr,iterPrev,T)(arr)){printf("p_tmp=%p\n",p_tmp);}
	
	printf("\nresetting iterator position to end arr,iterResetEnd,int8_t \n");
	TEMPLATE3(arr,iterResetEnd,T)(arr);
	
	printf("\niterating from the last to first position arr,iterPrev,int8_t \n");
	while(p_tmp=TEMPLATE3(arr,iterPrev,T)(arr)){printf("p_tmp=%p\n",p_tmp);}
	
	/* execute */
	printf("\nexecute function (by pointer) on every object in arr ayy arr,execOnAll,int8_t \n");
	TEMPLATE3(arr,execOnAll,T)(arr,&printInt8_t);
	
	printf("\ndumping object debug information arr,dump,int8_t \n");
	TEMPLATE3(arr,dump,T)(arr);
	
	printf("\n freeing arr struct arr,Free,int8_t \n");
	TEMPLATE3(arr,Free,T)(arr);
	
	return(0);}

int
main(int argc, char** argv){
	printf("test\n");
	for(int i=0;i<argc;i++){
		printf("argc=%d\targn=%d\targv=%s\n",argc,i,*(argv+i));}
	testArr();
	return(0);}
