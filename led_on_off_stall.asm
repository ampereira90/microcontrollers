.NOLIST ; Output of listing off
.INCLUDE "tn13def.inc" ; Read port definitions
.LIST ; Output of listing on

.equ cCounter = 100 ; define the number of downcounts

Start:
      ldi R16,LOW(RAMEND)
      out SPL,R16
      sbi DDRB,DDB0 ; Set portpin PB0 as output
Loop:
     cbi PORTB,PORTB0 ;  LED ON
     sbi PORTB, PORTB0 ; LED OFF
     rjmp Loop         ; jump relative back to label

Stall:
      ...
      ret