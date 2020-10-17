#include "cmenu.h"

void
cmenuPrintCommands(obj_cmenu* menu){
	printf("\n%s\n",menu->title);
	for(int i=0; i<menu->entryCount; i++){
		printf(" <%s> %s\n", menu->entry[i], menu->entryDescription[i]);}
	printf("\n");}

void
cmenuWriteAllTailingNulls(obj_cmenu* menu){
	menu->title[SSTRLENG-1]='\0';
	for(int i=0; i<CMENU_MAX_SIZE; i++){
		menu->entry[i][CMENU_KEY_SIZE-1]='\0';
		menu->entryDescription[i][SSTRLENG-1]='\0';}}

#define CMENU_ELSEIF(X) else if( (X)<menu->entryCount && !strncmp(bugger,menu->entry[(X)],CMENU_KEY_SIZE)) rc=(X)

int
cmenuPromptUser(obj_cmenu* menu){
	char bugger[CMENU_KEY_SIZE];
	int rcRead=0;
	int rc=-2;
	
	cmenuWriteAllTailingNulls(menu);
	termBlocking();
	
	while(rc==-2){
		memset(bugger,0,sizeof(bugger));
		cmenuPrintCommands(menu);
		printf("-> ");
		rcRead=read(STDIN_FILENO,bugger,CMENU_MAX_SIZE);
		printf("\n");
		if(rcRead<1)
			continue;
		printf("\033[2J");
		/* in my tests on linux read string ends with \n, this line replaces it with NULL */
		bugger[rcRead-1]='\0';
		
		if( 0<menu->entryCount && !strncmp(bugger,menu->entry[0],CMENU_KEY_SIZE)){
			rc=0;
			continue;}
		CMENU_ELSEIF(1);
		CMENU_ELSEIF(2);
		CMENU_ELSEIF(3);
		CMENU_ELSEIF(4);
		CMENU_ELSEIF(5);
		CMENU_ELSEIF(6);
		CMENU_ELSEIF(7);
		CMENU_ELSEIF(8);
		CMENU_ELSEIF(9);
		else if(!strncmp(bugger,"help",CMENU_KEY_SIZE)){
			printf("\033[2J");
			//cmenuPrintCommands(menu);
			printf("to select option, input one of the command keywords marked with < >\n\n");
			usleep(2*1000*1000);}
		else if(!strncmp(bugger,"exit",CMENU_KEY_SIZE))
			rc=-1;
		else{
			printf("ERROR unrecognized command.\n\tuse <help> to display command avalible in this menu,\n\tor <exit> to exit this menu\n\n");
			usleep(2*1000*1000);}
		}
		termNonBlocking();
		return(rc);}

