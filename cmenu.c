#include "cmenu.h"

void
cmenuPrintCommands(obj_cmenu* menu){
	switch(menu->mode){
		case(0):
			printf("\n%s\n",menu->title);
			for(int i=0; i<menu->entryCount; i++){
				printf(" <%s> %s\n", menu->entry[i], menu->entryDescription[i]);}
			printf("\n");
			break;
		case(1):
			printf("\n%s\n",menu->title);
			for(int i=0; i<menu->entryCount; i++){
				printf(" <%d> %s %s\n",i+1 , menu->entry[i], menu->entryDescription[i]);}
			printf("\n");
			break; 
		default:
			printf("CMENU mode error");
			break;}}

void
cmenuWriteAllTailingNulls(obj_cmenu* menu){
	menu->title[SSTRLENG-1]='\0';
	for(int i=0; i<CMENU_MAX_SIZE; i++){
		menu->entry[i][CMENU_KEY_SIZE-1]='\0';
		menu->entryDescription[i][SSTRLENG-1]='\0';}}

#define CMENU_ELSEIF(X) else if( (X)<menu->entryCount && !strncmp(bugger,menu->entry[(X)],CMENU_KEY_SIZE)) rc=(X)+1

int
cmenuPromptUser(obj_cmenu* menu){
	char bugger[CMENU_KEY_SIZE];
	int rcRead=0;
	int rc=-2;
	int selectedInt=0;
	
	if(menu->mode==0){
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
				rc=1;
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
		}
	else if(menu->mode==1){
		termUnbuff();
		cmenuPrintCommands(menu);
		printf("-> ");
		while(rc==-2){
			memset(bugger,0,sizeof(bugger));
			usleep(100000);
			rcRead=read(STDIN_FILENO,bugger,CMENU_MAX_SIZE);
			//printf("\n");
			if(rcRead<1)
				continue;
			//printf("\033[2J");
			////fprintf(stderr,"rcRead=%d, bugger=%s val=%d\n", rcRead, bugger, bugger[0]);
			
			/* convert char to int */
			selectedInt=bugger[0]-48;
			if(selectedInt==0 && menu->entryCount==9){
				rc=10;
				continue;}
			if(selectedInt<0 || selectedInt>9 || 
				selectedInt>menu->entryCount ||
				selectedInt==0){
				//fprintf(stderr,"ERROR selectedInt=%d\n",selectedInt);
				continue;}
			fprintf(stderr,"selectedInt=%d\n",selectedInt);
			rc=selectedInt;
			fprintf(stderr,"rc=%d\n",rc);
			continue;}
		termUnbuffRestore();
		}
	return(rc);}
