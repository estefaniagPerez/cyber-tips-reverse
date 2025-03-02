#include <stdio.h>
#include <string.h>
#include <termios.h>
#include <unistd.h>
#define STR_SIZE 10

void disable_echo() {
    struct termios tty;
    tcgetattr(STDIN_FILENO, &tty);
    tty.c_lflag &= ~ECHO;
    tcsetattr(STDIN_FILENO, TCSANOW, &tty);
}

void enable_echo() {
    struct termios tty;
    tcgetattr(STDIN_FILENO, &tty);
    tty.c_lflag |= ECHO;
    tcsetattr(STDIN_FILENO, TCSANOW, &tty);
}

int read_encrypt_key(char* result, int size) {
    FILE *file;
    char filename[] = "bad_practice.txt";
    char buffer[STR_SIZE];
    int real_size = STR_SIZE;

    if(real_size > size) {
        real_size = size;
    }

    // 1. Open file
    file = fopen(filename, "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    // 2. Read file
    if(fgets(buffer, sizeof(buffer), file) != NULL){
        printf("%s\n", buffer);
        strncpy(result, buffer, real_size);
    }

    // 3. Close file
    fclose(file);

    return 0;
}

void unencrypt_data(char* key) {
    // Here is where the real unencryption algorithm should be
    printf("Data Encrypted!!!\n");
}

int main() {
    char input[10];
    disable_echo();

    // 1. Unsafe read the users' input
    printf("Input the secret: ");
    scanf("%s", input);
    
    // 2. Remove line break
    input[strcspn(input, "\n")] = '\0';
    
    enable_echo();

    // only for testing, please comment in production
    /*
    if (read_encrypt_key(input, sizeof(input)) != 0){
        printf("Error reading key \n");
    }*/

    // 3. Un-encrypt
    unencrypt_data(input);

    return 0;
}