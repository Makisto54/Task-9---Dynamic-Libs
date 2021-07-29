OBJ = add.o sub.o mul.o div.o

.PHONY: clean

main: $(OBJ) libmylib.so main.o
	gcc -g main.o -o main -L. -l mylib

libmylib.so: $(OBJ)
	gcc -shared -o libmylib.so $(OBJ)
	
add.o: add.c functions.h 
	gcc -fPIC -c -g add.c -o add.o

sub.o: sub.c functions.h 
	gcc -fPIC -c -g sub.c -o sub.o

mul.o: mul.c functions.h 
	gcc -fPIC -c -g mul.c -o mul.o

div.o: div.c functions.h 
	gcc -fPIC -c -g div.c -o div.o	

main.o: main.c
	gcc -c -g main.c -o main.o

clean: 
	rm *o main libmylib.so