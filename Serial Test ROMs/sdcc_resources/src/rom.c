#include "rom.h"

// PUTC: send char in A, waits for UART ready
void putc(char c) __naked {
    (void)c;  
    __asm  // calling convention char c is in A
        call 0x0FAD    ; ROM PUTC
        ret
    __endasm;
}

// TESTC: returns 0 if no char, else char in A
char testc() __naked {
    __asm
        call 0x0FA5    ; ROM TESTC
        ret // in a (sdcc calling convention)
    __endasm;

}

// ENTMON: jumps to monitor (restores stack)
void entmon()  {
    __asm
        jp 0x00E7      ; ROM ENTMON
    __endasm;
}

// c routines to make life easy

// print a string literal 
void puts(const char* s) {
    while (*s) {
        if (*s == '\n') putc('\r');
        putc(*s++);
    }
}