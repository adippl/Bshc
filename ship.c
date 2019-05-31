#include "conf.h"


//uint8_t
//rand_gen(uint8_t* spread){
//	int v=*spread+SPREAD_DEF;	//SPREAD_DEF=1 by def
//
//	int rd=0;
//	
//	rd=0;
//	rd=rand()%v;	//value
//	if(rand()%2){	// + - sigh change
//		rd=rd*(-1);
//	}
//	return(rd);
//}
//
//struct shot*
//shot_gen(uint8_t noshells,uint8_t spread){
//	
//	struct shot* shot_ptr=shot(noshells);
//	if(!shot_ptr)exit(923);
//	
//	int16_t (*shots_arr)[noshells][2]=(void*)shot_ptr->shots_ptr;	//risky FIXIT
//	
//	for(int i=0;i<noshells;i++){
//		(*shots_arr)[i][0]=rand_gen(&spread);
//		(*shots_arr)[i][1]=rand_gen(&spread);
//		fprintf(stderr,"shell nr=%d\tx=%d\ty=%d\t\n",i,(*shots_arr)[i][0],(*shots_arr)[i][1]);
//	}
//	return(shot_ptr);
//}
