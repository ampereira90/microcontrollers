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

      in R16,PINB       ; read PINB into the R16 register
      andi R16,0x02
      brne Add
      sub R24,R25
Add:
      add R24,R25
Loop:
      cbi PORTB,PORTB0 ; Clear portpin PB0  LED ON
      ldi R16,smallStall ; load 8bit register with that constant
      rcall Stall

      sbi PORTB,PORTB0 ; LED OFF
      ldi R16,smallStall ; load 8bit register with that constant
      rcall Stall

      dec R24
      brne Loop

Stall:
      ldi R16, cCounter ; load 8bit register with that constant
SecStall:
      dec R16 ; decrease counter by one  1 cycle
      brne SecStall ; branch if zero flag was not set in last instruction     2 cycles
      ret