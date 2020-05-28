#generic c/c++ mkfile 
NAME=bshc
CC=cc


CC=gcc
#CCXX=g++
_CCARG= -g -Wall -Wextra -pedantic -Wendif-labels -Wcomment -fpie
CCARG= -std=c99  -DDEBUG $_CCARG $CCX
#CCXXARG= -std=c++2a -g -Wall -pedantic -fPIC $CXXEXTRA
LDARG= $LDX

#SRC=`{ls -1 *.cpp|sed 's/....$//'; ls -1 *.c|sed 's/..$//'; }
#OBJ=`{ls -1 *.cpp|sed 's/....$/.o/'; ls -1 *.c|sed 's/..$/.o/'; }
SRC=`{ls -1 *.c|sed 's/..$//'; }
OBJ=`{ls -1 *.c|sed 's/..$/.o/'; }

EXEC=a.out
#LIBSO=$NAME.so
#LIBA=$NAME.a

run: output
	./$EXEC

#test: lib-shared
#	gcc test.c -o test.out

output: $OBJ
	$CC $LDARG $OBJ -o $EXEC

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
test:	$OBJ testCC
	$CC $LDARG $OBJ tests/tests.o -o bshc_test.out
testcl:
	rm -f tests/*.o bshc_test.out

cl: testcl
	rm -f *.o *.gch
nk: cl
	rm -f $EXEC
	rm -f $LIBSO $LIBA


# vim : set ft=make:
