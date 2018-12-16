CC=gcc -std=c11 -g -Wall -pedantic

output: main.o state.o conf.o
	$(CC) -o bsh main.o state.o conf.o

main.o: main.c
	$(CC) -c main.c

state.o: state.c
	$(CC) -c state.c
conf.o:	conf.c
	$(CC) -c conf.c


cl:
	rm *.o
nk:	cl
	rm bsh
	
