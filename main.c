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
}


int 
main(int argc, char **argv){
//	setlocale(LC_ALL, "C.UTF-8");
	setlocale(LC_ALL, "en_US.utf8");
	
	int32_t c=0;

	struct chfb* p=fb_draw_map(fb_init());
	
	clear();
	do{
	//clear();
	gotoxy(0,0);
	fb_screen_draw(p);
	gotoxy(1,SIZE_Y*2+1+1+1);
	c=getchar();
	}while(c!='q');
	fb_free(&p);


	struct state* s=state_init(2);
	fprintf(stderr,"\n!init=%p!\n",(void*)s);
	state_free(&s);
	fprintf(stderr,"\n!free=%p!\n",(void*)s);
	
	//void* ptr=(void*)fld_init(2);
	//fprintf(stderr,"init=%p\n",ptr);
	//fld_free(&ptr);
	//fprintf(stderr,"free=%p\n",(void*)s);

	//fprintf(stdout,"\n");
	//for(int i=0;i<11;i++){
	//	fprintf(stdout,"%lc\n",FRAMECHARS[i]);
	//}
	//fprintf(stdout,"\nfield test\n");
	//
	//printf("\nlel\n");
	//c=getchar();
	//printf("%d",c);
	//prtnch('a',2,31,1);
	//prtnch('a',1,31);
	//prtnch(0x2693,2,34,1);


	struct state* state_ptr=state_init(2);
	//	(*state_ptr->pln+0)->shtbl_size+0
	ship_place(state_ptr,*((*state_ptr->ply_ptr+0)->shtbl_ptr+0),0,0,0);

	ship_place(state_ptr,*((*state_ptr->ply_ptr+0)->shtbl_ptr+1),0,0,1);
	char test=ship_placecheck(state_ptr,*(*state_ptr->ply_ptr+0)->shtbl_ptr+0,2,1,0);
	printf("test=%d",test);
	
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
	//fb_input_ships_and_draw(struct chfb* chfb_ptr, struct state* state_ptr, char pln){
	char kek=fb_input_ships_and_draw(chfb_ptr, state_ptr, 0);
	printf("\n%d",(int)kek);
	
	printf("\n\n%ld!%ld",sizeof(wchar_t),sizeof(uint16_t));
	
}
