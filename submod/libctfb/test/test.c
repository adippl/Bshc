#include <locale.h>
#include <unistd.h>
#include "../ctfb.h"

void
testdraw_line(obj_ctfb* screen){

	fprintf(stderr,"\ndrawline test\n");
	fwchar npfw={0};
	//npfw.wchar=L'▒';
	npfw.wchar=L'#';
	
	ctvc2 src={0};
	ctvc2 dest={0};
	
	src.x=0;
	src.y=0;
	dest.x=2;
	dest.y=2;
	ctfb_drawDiagLine(screen,&src,&dest,&npfw);
	
	for(int i=0;i<(screen->sizey);i+=1){
		src.x=0;
		src.y=0;
		dest.x=screen->sizex;
		dest.y=i;
		ctfb_drawDiagLine(screen,&src,&dest,&npfw);
		usleep(10000);
		screen->print(screen);}
	
	for(int j=screen->sizex;j>(0);j-=1){
		src.x=0;
		src.y=0;
		dest.x=j;
		dest.y=screen->sizey;
		ctfb_drawDiagLine(screen,&src,&dest,&npfw);
		usleep(10000);
		screen->print(screen);}

	screen->clear(screen);

	for(int j=screen->sizex;j>0;j-=1){
		src.x=screen->sizex;
		src.y=screen->sizey;
		dest.x=j;
		dest.y=0;
		ctfb_drawDiagLine(screen,&src,&dest,&npfw);
		usleep(10000);
		screen->print(screen);}
		
	for(int i=0;i<screen->sizey;i+=1){
		src.x=screen->sizex;
		src.y=screen->sizey;
		dest.x=0;
		dest.y=i;
		ctfb_drawDiagLine(screen,&src,&dest,&npfw);
		usleep(10000);
		screen->print(screen);}
	
	getchar();
	screen->clear(screen);
	
	src.x=0;
	src.y=10;
	dest.x=10;
	dest.y=0;
	ctfb_drawDiagLine(screen,&src,&dest,&npfw);
	screen->print(screen);

	src.x=20;
	src.y=0;
	dest.x=0;
	dest.y=20;
	ctfb_drawDiagLine(screen,&src,&dest,&npfw);
	screen->print(screen);
	}

void
draw(){
	
	}

int main(){
	setlocale(LC_ALL,"");

	fwchar c={.argc=2,.arg1=2,.arg2=4,.arg3=0,.wchar='a'};
	ctfb_prntfwch(&c);

	//obj_ctfb* p=ctfb_init(10, 10);
	obj_ctfb* p=ctfb_init();
	p->setSize(p,80,20);
	p->print(p);
	obj_ctfb* q=ctfb_copyDeep(p);
	
	arr_dump_fwchar(p->p_fwcharArr);
	fwchar *fw=NULL;
	p->arr_iterResetStart(p->p_fwcharArr);
	while((fw=p->arr_iterNext(p->p_fwcharArr))){
		//printf("p=%p\n",fw);
		fw->wchar='~';
		}
	p->arr_iterResetStart(p->p_fwcharArr);
	for(int i=0;(fw=p->arr_iterNext(p->p_fwcharArr))!=NULL;i++){
		//printf("p=%p\n",fw);
		if(i%2)fw->wchar='-';}
	p->print(p);
	//p->clear(p);
	ctfb_fillWithEmpty(p);
	p->setwchar_noform(p,10,10,'t');
	p->setwchar_noform(p,11,10,'e');
	p->setwchar_noform(p,12,10,'s');
	p->setwchar_noform(p,13,10,'t');
	wchar_t *str=L"string";

	p->setwchar_noform(p,79,0,'X');
	p->setwchar_noform(p,78,0,'x');
	p->setwchar_noform(p,77,0,'x');
	p->setwchar_noform(p,76,0,'x');
	p->setwchar_noform(p,79,19,'Y');
	ctfb_emplaceString_noform(p,20,0,6,CTFB_VERT,str);
	fwchar npfw={0};
	//npfw.wchar=L'▒';
	npfw.wchar=L'X';
	ctfb_fillRectangleWith(p,29,9,10,10,CTFB_SPACE);
	ctfb_fillRectangleWith(p,77,17,2,2,CTFB_SPACE);
	ctfb_fillRectangleWith(p,0,0,2,2,CTFB_SPACE);
	p->arr_iterResetStart(p->p_fwcharArr);
	while((fw=p->arr_iterNext(p->p_fwcharArr))){
		fw->wchar='~';
		fw->argc=0;}
	p->print(p);
	ctfb_fillRectangleWith(p,5,5,70,10,CTFB_SPACE);
	ctfb_fillRectangle(p,10,10,9,9,&npfw);
	ctfb_drawWin(p,5,5,10,10);
	ctfb_drawWin(p,0,10,9,9);
	ctfb_drawWin(p,70,0,9,5);
	ctfb_drawWin(p,70,10,9,9);
	p->print(p);

	getchar();
	p->arr_iterResetStart(p->p_fwcharArr);
	while((fw=p->arr_iterNext(p->p_fwcharArr))){
		fw->wchar=L'.';
		fw->argc=0;}
	p->print(p);
	fprintf(stderr,"ctfb_winYN=%d\n",ctfb_winYN(p,L"testt",5));
	fprintf(stderr,"ctfb_winYN=%d\n",ctfb_winYN(p,L"12345678901234567890",20));
	
	//ctfb_drawWin(p,48,4,10,7);
	//p->print(p);
	

	testdraw_line(p);

	p->clear(p);
	q->free(q);
	p->free(p);

	getchar();

	//ctfb_clearTerm();
	//struct termios term = {0};
	//ctfb_termUnbuff(&term);
	//
	//char ch='\0';
	//do{
	//	ch=getchar();
	//	if(ch==EOF)break;
	//	printf("c=%c d=%d\n",ch,ch);
	//} while(ch!='q');
	//ctfb_termRestore(&term);

	return(0);
}
