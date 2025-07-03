; Simple "Hello, world!" for Z80 with 6850 UART at 80h/81h

        ORG     $0000         ; Start at user code address in RAM


START:  ; Initialize UART (6850 ACIA)
        LD      A,3            ; Master reset
        OUT     (80h),A
        OUT     (80h),A
        LD      A,%01110111    ; program mode
        OUT     (80h),A
        LD      A,$15          ; 8 data, 1 stop, no parity, /16 clock, RTS high, ints off
        OUT     (80h),A

        LD      HL,MSG         ; HL points to message

NEXTCH: LD      A,(HL)         ; Get next character
        OR      A              ; End of string? (A==0)
        JP      Z,DONE         ; If zero, we're done

WAITTX: IN      A,(80h)        ; Read UART status
        AND     2              ; TX ready?
        JR      Z,WAITTX       ; Wait if not ready

        LD      A,(HL)         ; Get character again
        OUT     (81h),A        ; Send to UART
        INC     HL             ; Next character
        JP      NEXTCH         ; Loop

DONE:   JP      DONE           ; Halt (infinite loop)



; VT100 clear screen: ESC [ 2 J, ESC [ H
MSG:    DB      'Hello, world!',13,10,0  ; Clear screen, home, message, CR, LF, zero-terminated