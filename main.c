#include "main.h"




int
mainLoadRes(obj_resources* ptr){
	FILE* res_conf_json=fopen(F_MAIN_CONF,"r");
	bool error=false;
	
	if(!res_conf_json){
		fprintf(stderr,"test %s failed to open %s",__func__,F_MAIN_CONF);
		return(1);}
	else{
		const char* str=NULL;
		size_t strLength=0;
		
		json_stream JS={0};
		json_open_stream(&JS, res_conf_json);
		json_set_streaming(&JS,true);
		str=skipToNextObj(&JS,&strLength);
		resourcesFinalize(ptr);
		resourcesParse(ptr,&JS);
		if(error){
			fprintf(stderr,"PARISING ERROR %s\n",__func__);}
		resources_Dump(ptr);
		resourcesClean(ptr);
		json_close(&JS);
		fclose(res_conf_json);
		return(0);}}



#ifndef _TESTS
int 
main(int argc, char **argv){
	time_t tt;		//FIXIT
	srand(time(&tt));	//FIXIT
	setlocale(LC_ALL, "en_US.utf8");
	
	obj_resources resources={0};
	resourcesFinalize(&resources);
	mainLoadRes(&resources);
	
	
	
	
	
	
	resourcesClean(&resources);
}
#endif
