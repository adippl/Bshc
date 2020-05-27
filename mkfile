
CC=gcc-9.1.0	

#CFLAG= -std=c18 -lm -g -Wall -Werror -pedantic	-march=westmere -mtune=skylake -fplan9-extensions -lm -L./lib/ -lctfb lib/libctfb.a
CFLAG= -std=c18 -g -Wall -Werror -pedantic	-march=westmere -mtune=skylake -fplan9-extensions 
LDFLAGS= -lm lib/libctfb.a
#LDFLAGS= -lm -L./lib/ -lctfb

output:	main.o state.o conf.o term.o ui.o mth.o ship.o libctfb.a
	$CC $CFLAG  -o bsh main.o state.o conf.o term.o ui.o mth.o ship.o $LDFLAGS

main.o:	main.c
	$CC $CFLAG  -c main.c

state.o: state.c
	$CC $CFLAG  -c state.c
conf.o:	conf.c
	$CC $CFLAG  -c conf.c
term.o:	term.c
	$CC $CFLAG  -c term.c
ui.o:	ui.c
	$CC $CFLAG  -c ui.c
mth.o:	mth.c
	$CC $CFLAG  -c mth.c
ship.o:	ship.c
	$CC $CFLAG  -c ship.c

libctfb.a:
	cd lib/
	mk

libctfb.a_nk:
	cd lib/
	mk nk

cl:
	rm *.o
nk:	cl libctfb.a_nk
	rm bsh

