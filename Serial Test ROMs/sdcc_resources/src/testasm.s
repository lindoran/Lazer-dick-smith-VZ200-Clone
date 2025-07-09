; test_putc.s – Send a test byte to serial using ROM PUTC
; Assumes: monitor provides a routine at 0x0FAD for output

.org 0x7860

start:
    ld a, '>'        ; Test character to send
    call 0x0FAD      ; ROM PUTC
    jp 0x00E7        ; Return to monitor (ENTMON)
