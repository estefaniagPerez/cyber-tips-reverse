all: jump_function.sh

jump_function.sh: jump_function.o
	gcc -fno-stack-protector -o jump_function.sh jump_function.o -O0

jump_function.o: jump_function.c
	gcc -fno-stack-protector -c jump_function.c

clean:
	rm -f jump_function.o jump_function.sh
