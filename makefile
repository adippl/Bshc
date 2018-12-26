CC=gcc -std=c11 -g -Wall -pedantic

output: main.o state.o conf.o term.o
	$(CC) -o bsh main.o state.o conf.o term.o

main.o: main.c
	$(CC) -c main.c

state.o: state.c
	$(CC) -c state.c
conf.o:	conf.c
	$(CC) -c conf.c
term.o: term.c
	$(CC) -c term.c


cl:
	rm *.o
nk:	cl
	rm bsh
	
