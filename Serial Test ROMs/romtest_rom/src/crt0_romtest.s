    .module crt0_romtest
    .globl _main

.area _HEADER (ABS)
.org 0x1000          ; ROM location
    jp _start

.area _CODE
_start:
    ld sp, #0x00FF   ; Safe stack at low RAM
    call _main
    jp 0x00E7        ; Return to monitor
