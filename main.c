#include "main.h"



int 
main(int argc, char **argv){
	time_t tt;		//FIXIT
	srand(time(&tt));	//FIXIT
	setlocale(LC_ALL, "en_US.utf8");
	
	float a =-1.1f;
	printf("float %f float\n",a/0.1);

	
}
