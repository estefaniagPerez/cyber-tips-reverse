#include <stdio.h>
#include <string.h>
#include <termios.h>
#include <unistd.h>
#define STR_SIZE 50

const char secret[STR_SIZE] = "super_sECret_passWorD!";

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

int main() {
    char input[STR_SIZE];
    disable_echo();

    // 1. Reads the users' input
    printf("Input the secret: ");
    fgets(input, STR_SIZE - 1, stdin);
    
    // 2. Remove line break
    input[strcspn(input, "\n")] = '\0';
    
    enable_echo();

    // 3. Check if secret is correct
    if(strcmp(secret, input) == 0) {
        printf("\nSecret Correct!!!\n");
    }
    else {
        printf("\nSecret Incorrect :(\n");
    }
    return 0;
}