#include <stdio.h>
#include <unistd.h>

int main(int argc, char *argv[]){
    if(argc == 1){
        fprintf(stderr, "usage: %s SHELL\n", argv[0]);
        return 1;
    }
    setuid(0);
    setgid(0);
    execvp(argv[1], &argv[1]);
}
