#include "ui.h"


uint16_t
input_int(char* arr){
	uint16_t ret_var=0;
	wchar_t discard;
	for(;;){
		fprintf(stdout,"%s",arr);
		if(scanf("%hu",&ret_var)!=1){
			fprintf(stderr,"INPUT ERROR\n");
			fscanf(stdin,"%lc",&discard);
			//fseek(stdin,0,SEEK_END);
			continue;
		}
		break;
	}
	return(ret_var);
}

uint16_t
input_int_range(char* arr, uint16_t max){
	uint16_t ret_var=0;
	do{
		ret_var=input_int(arr);
	}while(!(ret_var<max));

	return(ret_var);
}


int
ctfb_winYN(	obj_ctfb *this, wchar_t *msg, size_t maxstrlen){
	NULL_P_CHECK(this);
	NULL_P_CHECK(msg);
	if(maxstrlen<1){
		fprintf(stderr,"err %s maxstrlen<1",__func__);
		return(-1);}
	if(maxstrlen+4>this->sizex){
		fprintf(stderr,"err %s maxstrlen too long for current screen length",__func__);
		return(-1);}

	obj_ctfb *errscreen=ctfb_copyDeep(this);
	NULL_P_CHECK(errscreen);
	ctfb_fillWithEmpty(errscreen);
	
	/* calculating window error location */
	uint16_t posx=0;
	uint16_t posy=0;
	uint16_t lenx=0;
	int16_t leny=0;
	posx=errscreen->sizex/2-(maxstrlen+4/2);
	lenx=maxstrlen+4;
	posy=errscreen->sizey/2-6;
	leny=7;
	fprintf(stderr,"debug winYN %u %u %u %u \n",posx,posy,lenx,leny);

	ctfb_drawWin(errscreen,posx,posy,lenx,leny);
	ctfb_emplaceString_noform(errscreen,posx+2,posy+2,maxstrlen,CTFB_VERT,msg);

	wchar_t yes[]=L"YES";
	wchar_t no[]=L"no";
	/* vector structs make it a bit more tidy */
	ctvc2 Ypos={.x=posx+2,.y=posy+5};
	ctvc2 Npos={.x=posx+6,.y=posy+5};
	
	ctfb_emplaceString_noform(errscreen,Ypos.x,Ypos.y,3,CTFB_VERT,yes);
	ctfb_emplaceString_noform(errscreen,Npos.x,Npos.y,2,CTFB_VERT,no);

	fwchar fwnorm={.argc=2,.arg1=0,.arg2=37}; //white normal
	fwchar fwinv={.argc=2,.arg1=7,.arg2=37}; //white inversed

	struct termios term={0};
	ctfb_termUnbuff(&term);
	
	int retval=1;
	char c='\0';
	bool loop=true;
	while(loop){
		if(retval){
			ctfb_formatRectangle(errscreen,Ypos.x,Ypos.y,2,1,&fwnorm);
			ctfb_formatRectangle(errscreen,Npos.x,Npos.y,2,1,&fwinv);}
		else{
			ctfb_formatRectangle(errscreen,Ypos.x,Ypos.y,2,1,&fwinv);
			ctfb_formatRectangle(errscreen,Npos.x,Npos.y,2,1,&fwnorm);}
		errscreen->print(errscreen);
		
		int specialkey=0;
		c=ctfb_getkeySimplified(&specialkey);
		switch(c){
			case('y'):
				loop=false;
				retval=0;
				break;
			case('n'):
				loop=false;
				retval=1;
				break;
			case(CTFB_ESC_DEF):
				if(specialkey==CTFB_RIGHT)
					if(!retval)retval=1;
				if(specialkey==CTFB_LEFT)
					if(retval)retval=0;
				break;
			case(CTFB_RET_DEF):
				loop=false;
				break;
			default:
				break;}}

	errscreen->print(errscreen);
	errscreen->free(errscreen);
	this->print(this);
	ctfb_termRestore(&term);

	return(retval);}
