Heres a little VZ200 Clone.

General idea - use only spare parts to make a working computer by hand wireing.
just for the fun of it.

Step 1) build the SBC board, make a basic schematic.
  Contains the basic computer: RAM, ROM, Decode and some very basic Serial IO.
  This is mostly done, tested the loopback on the UART to USB chip and its
  working so I am confident that I can throw electrons at the SBC.

  basic concerns from this point, ground planes on the board are not that great, 
  would need to most likely build those up with large jump wires between the 
  rails. 

  I expect ringing on all the signals and the clock lines. but as the clock is ~3Mhz 
  can't really discribe this computer as "a high speed device". we will do our best 
  to manage transmission interfearence useing pull ups and dampening resistors where 
  needed.
  

Step 2) Test SBC
  Make a very small "Hello World program and then maybe a monitor to test using 
  the serial chip. (or maybe port one) 


  (C) 2025 D. Collins -- Released under MIT Licence for simplicity 
