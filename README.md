<p style="margin-top:0pt; margin-bottom:0pt; font-size:18pt;"><strong>VZ200 CLONE</strong></p>
<p style="margin-top:0pt; margin-bottom:0pt;"><strong>&nbsp;</strong></p>
<p style="margin-top:0pt; margin-bottom:0pt;"><strong>Step one:</strong> <strong>Build the SBC board, and make a basic schematic.</strong></p>
<p style="margin-top:0pt; margin-bottom:0pt;">&nbsp;Contains the basic computer: RAM, ROM, Decode and some very basic Serial IO. This is mostly done, tested the loop back on the UART to USB chip and its working so I am confident that I can throw electrons at the SBC.&nbsp;</p>
<p style="margin-top:0pt; margin-bottom:0pt; font-size:11pt;"><strong><em>basic concerns from this point:</em></strong></p>
<p style="margin-top:0pt; margin-bottom:0pt; font-size:11pt;">&nbsp;Ground planes on the board are not that great, would need to most likely build those up with large jump wires between the rails. &nbsp;I expect ringing on all the signals and the clock lines. but as the clock is ~3Mhz can&apos;t really describe this computer as &quot;a high speed device&quot;. &nbsp;We will do our best to manage transmission interference using pull ups and dampening resistors where needed.<strong><span style="font-size:11pt;">&nbsp;</span></strong></p>
<p style="margin-top:0pt; margin-bottom:0pt;"><strong>Step 2) Test SBC</strong></p>
<p style="margin-top:0pt; margin-bottom:0pt;"><strong>&nbsp;</strong>Make a very small &quot;Hello World&rdquo; program and then maybe a monitor to test using the serial chip. (or maybe port one) so we can test all the RAM and ROM space selection.</p>
<p style="margin-top:0pt; margin-bottom:0pt; font-size:11pt;">&nbsp;</p>
<p style="margin-top:0pt; margin-bottom:0pt; font-size:11pt;">&nbsp;</p>
<p style="margin-top:0pt; margin-bottom:0pt; font-size:11pt;">(C) 2025 D. Collins -- Released under MIT License for simplicity</p>

