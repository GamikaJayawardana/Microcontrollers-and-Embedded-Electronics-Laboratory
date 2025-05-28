
_main:

;Lab_02.c,5 :: 		void main() {
;Lab_02.c,7 :: 		CMCON = 0x07 ;  // Hint: Disable Comparator
	MOVLW      7
	MOVWF      CMCON+0
;Lab_02.c,8 :: 		TRISA = 0x04 ;  // Hint: Configure TRISA register
	MOVLW      4
	MOVWF      TRISA+0
;Lab_02.c,9 :: 		TRISB = 0x00 ;  // Hint: Configure TRISB register
	CLRF       TRISB+0
;Lab_02.c,10 :: 		PORTB =0xff  ;  // Hint: Initialize PORTB register
	MOVLW      255
	MOVWF      PORTB+0
;Lab_02.c,11 :: 		RA2_bit = 0x00 ;  // Hint: Set RA2_bit to low state
	BCF        RA2_bit+0, BitPos(RA2_bit+0)
;Lab_02.c,14 :: 		do {
L_main0:
;Lab_02.c,16 :: 		if(sw == 1 ) {
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main3
;Lab_02.c,18 :: 		PORTB = 0x00 ;
	CLRF       PORTB+0
;Lab_02.c,19 :: 		}
	GOTO       L_main4
L_main3:
;Lab_02.c,22 :: 		PORTB = 0xff ;
	MOVLW      255
	MOVWF      PORTB+0
;Lab_02.c,23 :: 		}
L_main4:
;Lab_02.c,24 :: 		} while(1); // Hint: Enter a condition for the infinite loop
	GOTO       L_main0
;Lab_02.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
