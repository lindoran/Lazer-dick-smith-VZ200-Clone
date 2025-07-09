#include "rom.h"

#define RAM_START ((unsigned char*)0x7900)
#define RAM_END   ((unsigned char*)0xFFFF)

void main() {
    unsigned char* addr;

    puts("March test...\n");
    puts("Zero out RAM in User area 0x7900 - 0xFFFF\n");

    for (addr = RAM_START; ; ++addr) {
        *addr = 0x00;
        putc('\r');
        puthex16((unsigned int)(unsigned short)addr);
        if (addr == RAM_END)
            break;
    }

    puts("\nDid it Clear? Write 0xFF...\n");

    for (addr = RAM_START; ; ++addr) {
        if (*addr != 0x00) {
            puts("Error @ ");
            puthex16((unsigned int)(unsigned short)addr);
            puts("\n");
            entmon();
        }
        *addr = 0xFF;
        putc('\r');
        puthex16((unsigned int)(unsigned short)addr);
        if (addr == RAM_END)
            break;
    }

    puts("\nDid 0xFF get Written? Clear again...\n");

    for (addr = RAM_END; ; --addr) {
        if (*addr != 0xFF) {
            puts("Error @ ");
            puthex16((unsigned int)(unsigned short)addr);
            puts("\n");
            entmon();
        }
        *addr = 0x00;
        putc('\r');
        puthex16((unsigned int)(unsigned short)addr);
        if (addr == RAM_START)
            break;
    }

    for (addr = RAM_START; ; ++addr) {
        if (*addr != 0x00) {
            puts("Final err @ ");
            puthex16((unsigned int)(unsigned short)addr);
            puts("\n");
            entmon();
        }
        if (addr == RAM_END)
            break;
    }

    puts("\nTest done.\n");
    entmon();
}
