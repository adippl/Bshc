#include "main.h"


void
test_struct_inits(){
	printf("\n");
	
	struct ctfb* kkk=ctfb_fb_init(FSIZE_X,FSIZE_Y);
	kkk->delete(&kkk);
	printf("ctfb %p\n",(void*)kkk);

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


void lol(state* str_p, ship* ship_p, void* arg){
	fprintf(stdin, "shsize=%d", ship_p->shsize);
}
void test_ang(){
	vec p2={.x=0,.y=0};
	float angle=vec_angle(&p2)*(180/3.14);
	fprintf(stderr,"1:%f\n",angle);

	p2.x=1; p2.y=-1;
	angle=vec_angle(&p2)*(180/3.14);
	fprintf(stderr,"9=%f\n",angle);

	p2.x=-1; p2.y=-1;
	angle=vec_angle(&p2)*(180/3.14);
	fprintf(stderr,"9=%f\n",angle);

	p2.x=-1; p2.y=1;
	angle=vec_angle(&p2)*(180/3.14);
	fprintf(stderr,"9=%f\n",angle);
}

int 
main(int argc, char **argv){
	time_t tt;		//FIXIT
	srand(time(&tt));	//FIXIT
	setlocale(LC_ALL, "en_US.utf8");
	
	float a =-1.1f;
	printf("float %f float\n",a/0.1);

	//test_ang();
	//test_shot();
	

//	struct state* state_ptr=state_init(3);	//TODO
	
	//struct ctfb* ptr=fb_drawMap(ctfb_fb_init(FSIZE_X,FSIZE_Y));
	//fb_draw_ship_single(ptr,*((*state_ptr->ply_ptr+0)->shtbl_ptr+0),0);
	//fb_draw_ship_single(ptr,*((*state_ptr->ply_ptr+0)->shtbl_ptr+1),0);
	//ptr->clear();
	//ptr->gotoxy(0,0);
	//ctfb_fb_screenDraw(ptr);
	//ptr->gotoxy(0,52);
	//ctfb_fb_free(&ptr);

	struct ctfb* ctfb_ptr=ctfb_fb_init(FSIZE_X,FSIZE_Y);
	fb_drawMap(ctfb_ptr);

	ctfb_ptr->draw(ctfb_ptr);
	sleep(9999);
//	char kek=fb_inputInputShipsAndDraw(ctfb_ptr, state_ptr, 0);	//TODO
	
						//	fb_draw_ships(ctfb_ptr, state_ptr,1,0);
	ctfb_fb_screenDraw(ctfb_ptr);

//		state_ship_move_ship(state_ptr, (*( (*(state_ptr->ply_ptr+0))->shtbl_ptr+0 )), 10, 10, 0);
//		ply_do_f_for_all_ships(&lol, state_ptr, (*(state_ptr->ply_ptr+0)), NULL);
//		fb_clear_and_map(ctfb_ptr);
////		fb_draw_ships(ctfb_ptr, state_ptr,1,0);
//		ply_do_f_for_all_ships(&fb_draw_ship_single_f, NULL, (*(state_ptr->ply_ptr+0)) ,(void*)ctfb_ptr);
//		ctfb_fb_screenDraw(ctfb_ptr);

//fb_draw_ship_single_f(state* state_ptr, ship* ship_ptr, void* v_ctfb_ptr){

//	printf("\nkkke%d\n",(int)kek);

	
}
