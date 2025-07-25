# Lazer / Dick Smith VZ-200 Clone

A hand-wired Dick Smith clone, built on bussed proto board from spare parts.

## Goals

- Built with what I have on hand, only spare parts
- Should be mostly software compatible with the VZ200
- Analog and video boards should be modular to play around with the video circuit
- Not necessarily a period accurate recreation but should have real RAM, ROM and CPU
- Use microcontrollers, programmable logic when needed to simplify the design

### Why?

Simple, it's there -- and I needed a cheap summer project.

### What we have accomplished so far

Built a simple SBC that fully supports the memory map, as well as bolted on a minimally decoded UART chip to test things out. Built a SDCC toolchain to build test programs mostly. Started work on the video/IO board. Still have to build out the analog video output section - this will likely be a hand-etched board or something similar to keep noise down. Year is still young... only 2 months to VCFMW though... should be interesting.

### Licence

(C) 2025 D. Collins - MIT License for simplicity

