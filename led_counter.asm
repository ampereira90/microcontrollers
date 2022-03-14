.NOLIST ; Output of listing off
.INCLUDE "tn13def.inc" ; Read port definitions
.LIST ; Output of listing on

.equ smallStall = 20
.equ firstVal = 5
.equ secVal = 2

Start:
      ldi R16,LOW(RAMEND) ; fetch end of SRAM
      out SPL,R16         ; set stack pointer to that
      sbi DDRB,DDB0 ; Set portpin PB0 as output
      cbi DDRB,DDB1 ; Set portpin PB1 as intput
      sbi PORTB,PORTB0 ; LED OFF

      ldi R24,firstVal  ; load firstVal into the R24 register
      ldi R25,secVal

      in R16,PINB       ; read PINB bits into the R16 register
      
      ...

Loop:
      cbi PORTB,PORTB0 ; Clear portpin PB0  LED ON

      ...

      sbi PORTB,PORTB0 ; LED OFF
      
      ...
