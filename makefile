#CC=gcc -std=c11 -g -Wall -Werror -pedantic
CC=gcc-8.2.0 -std=c18 -g -Wall -Werror -pedantic	-march=skylake -mtune=skylake
CLANG_CC=clang-6.0 -std=c17 -Wall

output:	main.o state.o conf.o term.o ui.o
	$(CC) -o bsh main.o state.o conf.o term.o ui.o

main.o:	main.c
	$(CC) -c main.c

state.o: state.c
	$(CC) -c state.c
conf.o:	conf.c
	$(CC) -c conf.c
term.o:	term.c
	$(CC) -c term.c
ui.o:	ui.o
	$(CC) -c ui.c

cl:
	rm *.o
nk:	cl
	rm bsh


#//clang:
#//	CC=$(CLANG_CC)
#//	#output:
#//	
