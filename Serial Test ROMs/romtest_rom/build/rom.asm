;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module rom
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _putc
	.globl _testc
	.globl _entmon
	.globl _puts
	.globl _puthex8
	.globl _puthex16
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
;src/rom.c:4: void putc(char c) __naked {
;	---------------------------------
; Function putc
; ---------------------------------
_putc::
;src/rom.c:9: __endasm;
	call	0x0FAD ; ROM PUTC
	ret
;src/rom.c:10: }
;src/rom.c:13: char testc() __naked {
;	---------------------------------
; Function testc
; ---------------------------------
_testc::
;src/rom.c:17: __endasm;
	call	0x0FA5 ; ROM TESTC
	ret
;src/rom.c:19: }
;src/rom.c:22: void entmon()  {
;	---------------------------------
; Function entmon
; ---------------------------------
_entmon::
;src/rom.c:25: __endasm;
	jp	0x00E7 ; ROM ENTMON
;src/rom.c:26: }
	ret
;src/rom.c:31: void puts(const char* s) {
;	---------------------------------
; Function puts
; ---------------------------------
_puts::
;src/rom.c:32: while (*s) {
00103$:
	ld	a, (hl)
	or	a, a
	ret	Z
;src/rom.c:33: if (*s == '\n') putc('\r');
	sub	a, #0x0a
	jr	NZ, 00102$
	push	hl
	ld	a, #0x0d
	call	_putc
	pop	hl
00102$:
;src/rom.c:34: putc(*s++);
	ld	c, (hl)
	inc	hl
	push	hl
	ld	a, c
	call	_putc
	pop	hl
;src/rom.c:36: }
	jr	00103$
;src/rom.c:39: void puthex8(unsigned char val) {
;	---------------------------------
; Function puthex8
; ---------------------------------
_puthex8::
	ld	e, a
;src/rom.c:40: const char* hex = "0123456789ABCDEF";
	ld	bc, #___str_0+0
;src/rom.c:41: putc(hex[(val >> 4) & 0x0F]);
	ld	a, e
	rlca
	rlca
	rlca
	rlca
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	and	a, #0xf
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	d, (hl)
	push	bc
	push	de
	ld	a, d
	call	_putc
	pop	de
	pop	bc
;src/rom.c:42: putc(hex[val & 0x0F]);
	ld	d, #0x00
	ld	a, e
	and	a, #0x0f
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, (hl)
	ld	a, c
;src/rom.c:43: }
	jp	_putc
___str_0:
	.ascii "0123456789ABCDEF"
	.db 0x00
;src/rom.c:47: void puthex16(unsigned int val) {
;	---------------------------------
; Function puthex16
; ---------------------------------
_puthex16::
;src/rom.c:48: puthex8((val >> 8) & 0xFF);
	ld	c, h
	push	hl
	ld	a, c
	call	_puthex8
	pop	hl
;src/rom.c:49: puthex8(val & 0xFF);
	ld	a, l
;src/rom.c:50: }
	jp	_puthex8
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
