#include <fcntl.h>
#include <unistd.h>

int main(int argc, char **argv, char **envp) {
    int fd = open("/bin/sh", O_EXEC);
    if (fd < 0) return 1;

    char *args[] = { "echo", "hello", NULL };
    fexecve(fd, args, envp);

    return 1; // only reached on error
}
