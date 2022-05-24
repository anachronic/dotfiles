#include <stdio.h>
#include <stdlib.h>
#include <linux/input.h>

int main() {
    setbuf(stdin, NULL), setbuf(stdout, NULL);

    struct input_event event;

    while(fread(&event, sizeof(event), 1, stdin) == 1) {
        if (event.type == EV_KEY && event.code == KEY_LEFTMETA) {
            event.code = KEY_LEFTALT;
        } else if (event.type == EV_KEY && event.code == KEY_LEFTALT) {
            event.code = KEY_LEFTMETA;
        }


        fwrite(&event, sizeof(event), 1, stdout);
    }
}
