#include <wchar.h>

#include "conf.h"
#include "state.h"
#include "term.h"
#include "ui.h"


void
test_struct_inits(){
	printf("\n");
	
	struct chfb* kkk=chfb();
	kkk->free(&kkk);
	printf("chfb %p\n",(void*)kkk);

	struct ship* k=ship(3,(void*)0x0);
	k->free(&k);
	printf("ship %p \n",(void*)kkk);
	
	struct fld* f=fld(2);
	f->free(&f);
	printf("fld %p \n",(void*)f);

	struct ply* pl=ply(1);
	pl->free(&pl);
	printf("ply %p \n",(void*)pl);

	struct state* st=state(2);
	st->free(&st);
	printf("state %p \n",(void*)st);
	
	struct shot* shot_ptr=shot(10);
	shot_ptr->free(&shot_ptr);
}
void
test_shot(){
	wchar_t c=0;
	struct shot* a=NULL;
	
	do{
		//gotoxy(1,SIZE_Y*2+3);
		//screen_clear_area(0,52,FSIZE_X,FSIZE_Y-52);	//FIXIT
		fprintf(stdout,"shell spread test, enter q to exit");
		a=shot_gen(5);
		a->free(&a);
		c=getchar();
	}while(c!='q');
}


int 
main(int argc, char **argv){
	time_t tt;		//FIXIT
	srand(time(&tt));	//FIXIT
//	setlocale(LC_ALL, "C.UTF-8");
	setlocale(LC_ALL, "en_US.utf8");
	


	//int32_t c=0;

	//struct chfb* p=fb_draw_map(fb_init());
	//

	//clear();
	//do{
	//gotoxy(0,0);
	//fb_screen_draw(p);
	//gotoxy(1,SIZE_Y*2+3);
	//screen_clear_area(0,52,FSIZE_X,FSIZE_Y-52);	//FIXIT
	//fprintf(stdout,"shell spread test, enter q to exit");
	//c=getchar();
	//}while(c!='q');
	//fb_free(&p);

	test_shot();

	struct state* state_ptr=state_init(2);
	
	struct chfb* ptr=fb_draw_map(fb_init());
	fb_draw_ship_single(ptr,*((*state_ptr->ply_ptr+0)->shtbl_ptr+0),0);
	fb_draw_ship_single(ptr,*((*state_ptr->ply_ptr+0)->shtbl_ptr+1),0);
	clear();
	gotoxy(0,0);
	fb_screen_draw(ptr);
	gotoxy(0,52);
	fb_free(&ptr);

	struct chfb* chfb_ptr=chfb();
	fb_draw_map(chfb_ptr);

	fb_screen_draw(chfb_ptr);
	char kek=fb_input_ships_and_draw(chfb_ptr, state_ptr, 0);
	
	fb_draw_ships(chfb_ptr, state_ptr,1,0);
	fb_screen_draw(chfb_ptr);
	kek=getchar();
	printf("\n%d",(int)kek);
	
	printf("\n\n%ld!%ld",sizeof(wchar_t),sizeof(uint16_t));
	
}
