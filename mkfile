#generic c/c++ mkfile 
NAME=bshc
CC=cc


#CC=gcc
#CCXX=g++
_CCARG= -g -Wall -Wextra -pedantic -fpie
CCARG= -std=c99  -DDEBUG $_CCARG $CCX
#CCXXARG= -std=c++2a -g -Wall -pedantic -fPIC $CXXEXTRA
LDARG= $LDX

#SRC=`{ls -1 *.cpp|sed 's/....$//'; ls -1 *.c|sed 's/..$//'; }
#OBJ=`{ls -1 *.cpp|sed 's/....$/.o/'; ls -1 *.c|sed 's/..$/.o/'; }
SRC=`{ls -1 *.c|sed 's/..$//'; }
OBJ=`{ls -1 *.c|sed 's/..$/.o/'; }
EOBJ= submod/pdjson/pdjson.o 

EXEC=a.out
#LIBSO=$NAME.so
#LIBA=$NAME.a

run: output
	./$EXEC

#test: lib-shared
#	gcc test.c -o test.out

output: $OBJ pdjson
	$CC $LDARG $OBJ $EOBJ -o $EXEC

#libstatic: $OBJ
##	DARG=-static
#	ar rcs $LIBA $OBJ
#libshared: $OBJ
#	$CC -shared -o $LIBSO $OBJ

%.o:	%.cpp
	$CCXX $CCXXARG -c $prereq -o $target
%.o:	%.c
	$CC $CCARG -c $prereq -o $target

testCC:	$OBJ
	$CC $CCARG -c tests/tests.c -o tests/tests.o
_test:	$OBJ testCC pdjson
	$CC $LDARG $OBJ $EOBJ tests/tests.o -o bshc_test.out
test:
	mk _test CCX=-D_TESTS CC=$CC 
testcl:
	rm -f tests/*.o bshc_test.out

pdjson:
	cd submod/pdjson/
	make
pdjsoncl:
	cd submod/pdjson/
	make clean

cl: testcl
	rm -f *.o *.gch
nk: cl pdjsoncl
	rm -f $EXEC
	rm -f $LIBSO $LIBA

wc: nk
	wc -l *.c *.h mkfile tests/* res/*.json


# vim : set ft=make:
