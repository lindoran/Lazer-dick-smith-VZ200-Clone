; crt0.s - Custom startup for SDCC on Z80 SBC
.module crt0

.globl _main        ; SDCC expects _main
.globl l__INITIALIZER
.globl s__INITIALIZER
.globl s__INITIALIZED

.area _HEADER (ABS)
.org 0x7860
    jp _start       ; Entry point

.area _CODE
_start:
    ld sp, #0xFFFF
    call gsinit     ; Initialize global/static variables
    call _main      ; Call C main()
    jp 0x00E7       ; Return to monitor via ENTMON

; Segment ordering for linker
.area _HOME
.area _CODE
.area _GSINIT
.area _GSFINAL
.area _DATA
.area _BSEG
.area _BSS
.area _HEAP

; Global/static initializer
.area _GSINIT
gsinit:
    ld bc, #l__INITIALIZER
    ld a, b
    or a, c
    ret z
    ld de, #s__INITIALIZED
    ld hl, #s__INITIALIZER
    ldir
    ret

.area _GSFINAL
    ret
