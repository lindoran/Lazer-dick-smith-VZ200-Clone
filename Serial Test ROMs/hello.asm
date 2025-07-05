; Simple "Hello, world!" using the inbuilt monitor character output routine

CHOUT:  EQU     $0FAD         ; Character output routine address in monitor

        ORG     $7860         ; Start at user code address in RAM


START:
        LD      HL,MSG         ; HL points to message

NEXTCH: LD      A,(HL)         ; Get next character
        OR      A              ; End of string? (A==0)
        JP      Z,DONE         ; If zero, we're done

        CALL    CHOUT          ; Output character in A
        INC     HL             ; Next character
        JP      NEXTCH         ; Loop

DONE:   JP      DONE           ; Halt (infinite loop)




MSG:    DB      'Hello, world!',13,10,0  ;  message, CR, LF, zero-terminated