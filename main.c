
#include "conf.h"
#include "state.h"
#include "term.h"




int 
main(int argc, char **argv){
	setlocale(LC_ALL, "C.UTF-8");
//	setlocale(LC_ALL, "en_US.utf8");
	
//	resizexy(80,24);
	char c=0;

	struct chfb* p=fb_draw_map(fb_init());
	
	clear();
	do{
	//clear();
	gotoxy(0,0);
	fb_screen_draw(p);
	gotoxy(1,54);
	c=getchar();
	}while(c!='q');
	

	fb_free(&p);
	fprintf(stdout,"%p",(void*)p);
	fprintf(stdout,"\n%d",'0');

	//struct ship* s=ship_init(0);
	//ship_free(&s);
	//fprintf(stderr,"\n!%p!\n",(void*)s);
	//struct ply* s=ply_init(0,1);
	//ship_free(&s);
	//fprintf(stderr,"\n!%p!\n",(void*)s);
	//
	
	
	fprintf(stdout,"\033[31,1,4mHELLO\033[9m");
	fprintf(stdout,"\033[31;1;4mHello\033[0m");
	fprintf(stdout,"\033[32;1;4mHello\033[0m");
	fprintf(stdout,"post┼\n");

	for(int i=0;i<10;i++){
		fprintf(stdout,"!┼%lc!",FRAMECHARS[i]);
	}
	fprintf(stdout,"\n");
	char test=FRAMECHARS[10];
	int tset=FRAMECHARS[10];
	fprintf(stdout,"!┼%c!",test);
	fprintf(stdout,"!┼%c!",tset);


	//struct state* s=state_init(2);
	//fprintf(stderr,"\n!init!%p!\n",(void*)s);
	//fprintf(stderr,"\n!init!&%p!\n",(void*)&s);
	//state_free(&s);
	//fprintf(stderr,"\n!free!%p!\n",(void*)s);
}
