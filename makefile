#CC=gcc-7.3.0	-std=c11 -g -Wall -Werror -pedantic
#CC=gcc-8.2.0	-std=c18 -g -Wall -Werror -pedantic
CC=gcc-8.2.0	
#CC=clang-6.0	-std=c17 -Wall

CC_ARG= -std=c18 -lm -g -Wall -Werror -pedantic	-march=skylake -mtune=skylake

output:	main.o state.o conf.o term.o ui.o mth.o ship.o
	$(CC) $(CC_ARG)  -o bsh main.o state.o conf.o term.o ui.o mth.o ship.o

main.o:	main.c
	$(CC) $(CC_ARG)  -c main.c

state.o: state.c
	$(CC) $(CC_ARG)  -c state.c
conf.o:	conf.c
	$(CC) $(CC_ARG)  -c conf.c
term.o:	term.c
	$(CC) $(CC_ARG)  -c term.c
ui.o:	ui.c
	$(CC) $(CC_ARG)  -c ui.c
mth.o:	mth.c
	$(CC) $(CC_ARG)  -c mth.c
ship.o:	ship.c
	$(CC) $(CC_ARG)  -c ship.c

cl:
	rm *.o
nk:	cl
	rm bsh


#clang:
#	#CC=$(CLANG_CC)
#	#output:
#	
