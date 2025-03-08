all: jump_function.sh

jump_function.sh: jump_function.o
		gcc -o jump_function.sh jump_function.o -O0 

jump_function.o: jump_function.c
		gcc -c jump_function.c

clean:
		rm jump_function.o jump_function.sh