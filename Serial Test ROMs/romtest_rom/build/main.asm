;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _puthex16
	.globl _puts
	.globl _entmon
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:7: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:10: puts("March test...\n");
	ld	hl, #___str_0
	call	_puts
;src/main.c:12: for (addr = RAM_START; addr <= RAM_END; ++addr)
	ld	bc, #0x7860
00113$:
;src/main.c:13: *addr = 0x00;
	xor	a, a
	ld	(bc), a
;src/main.c:12: for (addr = RAM_START; addr <= RAM_END; ++addr)
	inc	bc
	ld	a, #0xff
	cp	a, c
	sbc	a, b
	jr	NC, 00113$
;src/main.c:15: for (addr = RAM_START; addr <= RAM_END; ++addr) {
	ld	bc, #0x7860
00115$:
;src/main.c:16: if (*addr != 0x00) {
	ld	a, (bc)
	or	a, a
	jr	Z, 00103$
;src/main.c:17: puts("Error @ ");
	push	bc
	ld	hl, #___str_1
	call	_puts
	pop	bc
;src/main.c:18: puthex16((unsigned int)(unsigned short)addr);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	_puthex16
	ld	hl, #___str_2
	call	_puts
	pop	bc
00103$:
;src/main.c:21: *addr = 0xFF;
	ld	a, #0xff
	ld	(bc), a
;src/main.c:15: for (addr = RAM_START; addr <= RAM_END; ++addr) {
	inc	bc
	ld	a, #0xff
	cp	a, c
	sbc	a, b
	jr	NC, 00115$
;src/main.c:24: for (addr = RAM_END; ; --addr) {
	ld	bc, #0xffff
00117$:
;src/main.c:25: if (*addr != 0xFF) {
	ld	a, (bc)
	inc	a
	jr	Z, 00106$
;src/main.c:26: puts("Error @ ");
	push	bc
	ld	hl, #___str_1
	call	_puts
	pop	bc
;src/main.c:27: puthex16((unsigned int)(unsigned short)addr);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	_puthex16
	ld	hl, #___str_2
	call	_puts
	pop	bc
00106$:
;src/main.c:30: *addr = 0x00;
	xor	a, a
	ld	(bc), a
;src/main.c:31: if (addr == RAM_START) break;
	ld	a, c
	sub	a, #0x60
	jr	NZ, 00183$
	ld	a, b
	sub	a, #0x78
	jr	Z, 00109$
00183$:
;src/main.c:24: for (addr = RAM_END; ; --addr) {
	dec	bc
	jr	00117$
00109$:
;src/main.c:34: for (addr = RAM_START; addr <= RAM_END; ++addr) {
	ld	bc, #0x7860
00119$:
;src/main.c:35: if (*addr != 0x00) {
	ld	a, (bc)
	or	a, a
	jr	Z, 00120$
;src/main.c:36: puts("Final err @ ");
	push	bc
	ld	hl, #___str_3
	call	_puts
	pop	bc
;src/main.c:37: puthex16((unsigned int)(unsigned short)addr);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	call	_puthex16
	ld	hl, #___str_2
	call	_puts
	pop	bc
00120$:
;src/main.c:34: for (addr = RAM_START; addr <= RAM_END; ++addr) {
	inc	bc
	ld	a, #0xff
	cp	a, c
	sbc	a, b
	jr	NC, 00119$
;src/main.c:42: puts("Test done.\n");
	ld	hl, #___str_4
	call	_puts
;src/main.c:43: entmon();
;src/main.c:44: }
	jp	_entmon
___str_0:
	.ascii "March test..."
	.db 0x0a
	.db 0x00
___str_1:
	.ascii "Error @ "
	.db 0x00
___str_2:
	.db 0x0a
	.db 0x00
___str_3:
	.ascii "Final err @ "
	.db 0x00
___str_4:
	.ascii "Test done."
	.db 0x0a
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
