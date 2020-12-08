#include "input.h"

char
ctfb_getkeySimplified(int* specialKeyCode){
	NULL_P_CHECK(specialKeyCode);
	/* first char */ 
	char fc=getchar();
	char c='\0';
	if(fc>31&&fc<127)return(fc);
	
	switch(fc){
		case('\033'):
			c=getchar();
			if(c=='\033')*specialKeyCode=CTFB_ESC;
			
			if(c=='['){
				/* escape sequences */
				switch(getchar()){
					
					/* up */
					case 'A':
						*specialKeyCode=(CTFB_UP);
						break;
					case 'a':
						*specialKeyCode=(CTFB_UP_SHIFT);
						break;
					
					/* down */
					case 'B':
						*specialKeyCode=(CTFB_DOWN);
						break;
					case 'b':
						*specialKeyCode=(CTFB_DOWN_SHIFT);
						break;
						
					/* right */
					case 'C':
						*specialKeyCode=(CTFB_RIGHT);
						break;
					case 'c':
						*specialKeyCode=(CTFB_RIGHT_SHIFT);
						break;
						
					/* left */
					case 'D':
						*specialKeyCode=(CTFB_LEFT);
						break;
					case 'd':
						*specialKeyCode=(CTFB_LEFT_SHIFT);
						break;
					
					/* diagoal arrows */
					case '5':
						if(getchar()=='~')*specialKeyCode=(CTFB_NE);
						break;
					case '6':
						if(getchar()=='~')*specialKeyCode=(CTFB_SE);
						break;
					case '7':
						if(getchar()=='~')*specialKeyCode=(CTFB_NW);
						break;
					case '8':
						if(getchar()=='~')*specialKeyCode=(CTFB_SW);
						break;
					
					/* F1-4 keys */
					case'1':
						switch(getchar()){
							case'1':
								if(getchar()=='~')*specialKeyCode=(CTFB_F1);
								break;
							case'2':
								if(getchar()=='~')*specialKeyCode=(CTFB_F2);
								break;
							case'3':
								if(getchar()=='~')*specialKeyCode=(CTFB_F3);
								break;
							case'4':
								if(getchar()=='~')*specialKeyCode=(CTFB_F4);
								break;
							default:
								break;}
							break;
					/* end F1-4 keys*/
						
						
					default:
						break;}}
			if(c=='O'){
				/* diagoal arrows + SHIFT*/
				switch(getchar()){
					case 'y':
						*specialKeyCode=(CTFB_NE_SHIFT);
						break;
					case 's':
						*specialKeyCode=(CTFB_SE_SHIFT);
						break;
					case 'w':
						*specialKeyCode=(CTFB_NW_SHIFT);
						break;
					case 'q':
						*specialKeyCode=(CTFB_SW_SHIFT);
						break;
						
					default:
						break;}}
				/* end of escape sequences */
			break;
		case(4):
			*specialKeyCode=CTFB_ASCII4_CTRL_D;
			break;
		case(8):
			*specialKeyCode=CTFB_ASCII8_DEL;
			break;
		case(10):
			*specialKeyCode=CTFB_RET;
			break;
		case(21):
			*specialKeyCode=CTFB_ASCII21_CTRL_U;
			break;
		case(127):
			*specialKeyCode=CTFB_BACKSPACE;
			break;
		
		default:
			break;}
	return(fc);}

int
ctfb_isStdChar(char* ap_char){
	if(*ap_char>31&&*ap_char<127)return(0);
	return(1);}
