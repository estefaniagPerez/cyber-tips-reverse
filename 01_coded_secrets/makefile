all: coded_secrets

coded_secrets: coded_secrets.o
		gcc -o coded_secrets.sh coded_secrets.o -O0

coded_secrets.o: coded_secrets.c
		gcc -c coded_secrets.c

clean:
		rm coded_secrets.o coded_secrets.sh