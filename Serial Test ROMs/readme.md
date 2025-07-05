This is David Dunfield's Serial Language Monitor. This must be assembled with the archived 16-bit / 32-bit DOS/WIN32 (requires something at least as old as Windows XP) assembler ASMZ80.EXE written by David Dunfield (not to be confused with the Linux cross assembler).

The assembler can be found in the tools directory in this folder or at https://dunfield.themindfactory.com/dnlddds.htm. The file is XTOOLS.ZIP; all the monitors and assemblers for many other platforms are there as well. It's a bit cryptic, but if you read his extensive documentation it works out. There's a lot of information in there... you are going to have to install it to a directory in Windows -- I just installed a small Windows XP install on VirtualBox and it just worked. The file XTOOLS.ZIP has EVERYTHING you need to install it inside the documentation.

The monitor has been ported to use the 68B50 UART, with the VZ memory map. It is only serial for the time being—just something simple to upload test code and try out the hardware flow control.

Here is supplied a compiled and working version for your reference.

Having worked on Dave Dunfield's source code, it's a rule of thumb of mine that it's always better to just use his tools to assemble, build, or whatever with what he built it with. His code is great, but the comments and formatting make it very difficult to pull into something like a modern dev environment like VS Code, and then just build with no issues in a modern cross compiler. He even has made a Virtual Machine for modernizing the process, but I've never looked into it, figuring the old stuff "just works".

Whatever UART was used in the original code "LOOKS" like it is going to work with a 6850, but some of the registers were backwards so it must not be.