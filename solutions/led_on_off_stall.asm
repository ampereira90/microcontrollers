.NOLIST ; Output of listing off
.INCLUDE "tn13def.inc" ; Read port definitions
.LIST ; Output of listing on

.equ cCounter = 100 ; define the number of downcounts

Start:
      ldi R16,LOW(RAMEND)
      out SPL,R16
      sbi DDRB,DDB0 ; Set portpin PB0 as output
Loop:
     cbi PORTB,PORTB0 ; Clear portpin PB0  LED ON
     rcall Stall
     sbi PORTB, PORTB0 ; LED OFF
     rcall Stall
     rjmp Loop         ; jump relative back to label

Stall:
      ldi R16, cCounter ; load 8bit register with that constant
SecStall:
      dec R16 ; decrease counter by one  1 cycle
      brne SecStall ; branch if zero flag was not set in last instruction     2 cycles
      ret
