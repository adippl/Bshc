CC=gcc -std=c11 -g -Wall -pedantic

output: main.o state.o conf.o screen.o
	$(CC) -o bsh main.o state.o conf.o screen.o

main.o: main.c
	$(CC) -c main.c

state.o: state.c
	$(CC) -c state.c
conf.o:	conf.c
	$(CC) -c conf.c
screen.o: screen.c
	$(CC) -c screen.c


cl:
	rm *.o
nk:	cl
	rm bsh
	
