#include "ui_term.h"

int
tuiInit(){
	struct termios termSettings;
	tcgetattr(STDIN_FILENO,&termSettings);
	//termSettings.c_lflag &=(~ICANON & ~ECHO);
	termNonBlocking();
	
	obj_cmenu mainMenu={0};
	int rc=0;
	strncpy((char*)&mainMenu.title,"Yet unnamed project",SSTRLENG);
	mainMenu.entryCount=4;
	
	strncpy((char*)&mainMenu.entry[0],"new",CMENU_KEY_SIZE);
	strncpy((char*)&mainMenu.entryDescription[0],"game",SSTRLENG);
	
	strncpy((char*)&mainMenu.entry[1],"load",CMENU_KEY_SIZE);
	strncpy((char*)&mainMenu.entryDescription[1],"world from savefile",SSTRLENG);
	
	strncpy((char*)&mainMenu.entry[2],"info",CMENU_KEY_SIZE);
	strncpy((char*)&mainMenu.entryDescription[2],"display informations",SSTRLENG);
	
	strncpy((char*)&mainMenu.entry[3],"exit",CMENU_KEY_SIZE);
	strncpy((char*)&mainMenu.entryDescription[3],"game back to terminal",SSTRLENG);

	mainMenu.mode=1;
	
	while(rc!=-1){
		switch(cmenuPromptUser(&mainMenu)){
		case(1):
			/* init new game */
			printf("NEWGAME\n");
			//worldNewGame();
			break;
		case(2):
			/* load save selection screen */
			printf("LOADGAME\n");
			//worldLoadGameSelectSave();
			break;
		case(3):
			/* displayInfo */
			printf("test main menu.\n type help and confirm with enter to display basic usage info \n"); 
			break;
		case(4):
			/* exit */
			printf("exiting...\n"); 
			rc=-1;
			break;
		default:
			/* in case sth bad happens */
			printf("%s internal error menu returned %i, exiting...",__func__,rc);
			exit(EXIT_FAILURE);}}
		
	tcsetattr(STDIN_FILENO,TCSANOW,&termSettings);
	
	/* fuckIt */
	//system("reset");
	
	return(rc);}
