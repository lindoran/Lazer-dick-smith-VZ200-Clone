#include "rom.h"

#define RAM_START ((unsigned char*)0x7860)
#define RAM_END   ((unsigned char*)0xFFFF)


void main() {
    unsigned char* addr;

    puts("March test...\n");

    for (addr = RAM_START; addr <= RAM_END; ++addr)
        *addr = 0x00;

    for (addr = RAM_START; addr <= RAM_END; ++addr) {
        if (*addr != 0x00) {
            puts("Error @ ");
            puthex16((unsigned int)(unsigned short)addr);
            puts("\n");
        }
        *addr = 0xFF;
    }

    for (addr = RAM_END; ; --addr) {
        if (*addr != 0xFF) {
            puts("Error @ ");
            puthex16((unsigned int)(unsigned short)addr);
            puts("\n");
        }
        *addr = 0x00;
        if (addr == RAM_START) break;
    }

    for (addr = RAM_START; addr <= RAM_END; ++addr) {
        if (*addr != 0x00) {
            puts("Final err @ ");
            puthex16((unsigned int)(unsigned short)addr);
            puts("\n");
        }
    }

    puts("Test done.\n");
    entmon();
}
