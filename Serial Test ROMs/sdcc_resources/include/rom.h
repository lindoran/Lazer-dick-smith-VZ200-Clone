#ifndef ROM_H
#define ROM_H

extern void putc(char c);
extern char testc(void);
extern void entmon(void);
extern void puts(const char* s);
void puthex8(unsigned char val);
void puthex16(unsigned int val);


#endif
