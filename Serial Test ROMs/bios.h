#ifndef BIOS_H
#define BIOS_H

// Define function prototypes using actual addresses with inline asm
static void putc(char c) __naked {
    (void)c;  // Prevent unused param warning
    __asm
        ld a, l
        call 0x003E  ; _putc via jump table
        ret
    __endasm;
}

static void warm_start() __naked {
    __asm
        jp 0x0038  ; _warmst via jump table
    __endasm;
}

static char testc() __naked {
    __asm
        call 0x003B  ; _testc via jump table
        ld l, a      ; return A in L
        ret
    __endasm;
}

#endif // BIOS_H
