.NOLIST ; Output of listing off
.INCLUDE "tn13def.inc" ; Read port definitions
.LIST ; Output of listing on

Start:
      ldi R16,LOW(RAMEND)
      out SPL,R16
      sbi DDRB,DDB0 ; Set portpin PB0 as output
Loop:
     cbi PORTB,PORTB0 ; Clear portpin PB0  LED ON - 2 cycles
     nop ; stall 1 cycle
     nop ; stall 1 cycle
     sbi PORTB, PORTB0 ; LED OFF - 2 cycles
     rjmp Loop         ; jump relative back to label
