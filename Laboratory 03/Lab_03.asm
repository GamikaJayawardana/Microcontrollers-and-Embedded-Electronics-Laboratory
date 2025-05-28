
_knightrider:

;Lab_03.c,1 :: 		void knightrider(void) {
;Lab_03.c,4 :: 		TRISB = 0x00; // Hint: Set all pins of PORTB as outputs
	CLRF       TRISB+0
;Lab_03.c,6 :: 		PORTB = 0x01; // Hint: Initialize PORTB to light the first LED (RB0)
	MOVLW      1
	MOVWF      PORTB+0
;Lab_03.c,8 :: 		for (i = 1; i <= 7; i++) {
	MOVLW      1
	MOVWF      R2+0
	MOVLW      0
	MOVWF      R2+1
L_knightrider0:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightrider11
	MOVF       R2+0, 0
	SUBLW      7
L__knightrider11:
	BTFSS      STATUS+0, 0
	GOTO       L_knightrider1
;Lab_03.c,9 :: 		PORTB = (PORTB << 1); // Hint: Shift the lit LED to the left
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Lab_03.c,11 :: 		Delay_ms(100); // Hint: Delay for smoother animation
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_knightrider3:
	DECFSZ     R13+0, 1
	GOTO       L_knightrider3
	DECFSZ     R12+0, 1
	GOTO       L_knightrider3
	DECFSZ     R11+0, 1
	GOTO       L_knightrider3
	NOP
;Lab_03.c,8 :: 		for (i = 1; i <= 7; i++) {
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;Lab_03.c,12 :: 		}
	GOTO       L_knightrider0
L_knightrider1:
;Lab_03.c,14 :: 		for (i = 7; i >= 1; i--) {
	MOVLW      7
	MOVWF      R2+0
	MOVLW      0
	MOVWF      R2+1
L_knightrider4:
	MOVLW      128
	XORWF      R2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightrider12
	MOVLW      1
	SUBWF      R2+0, 0
L__knightrider12:
	BTFSS      STATUS+0, 0
	GOTO       L_knightrider5
;Lab_03.c,15 :: 		PORTB = (PORTB >> 1 ); // Hint: Shift the lit LED to the right
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Lab_03.c,17 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_knightrider7:
	DECFSZ     R13+0, 1
	GOTO       L_knightrider7
	DECFSZ     R12+0, 1
	GOTO       L_knightrider7
	DECFSZ     R11+0, 1
	GOTO       L_knightrider7
	NOP
;Lab_03.c,14 :: 		for (i = 7; i >= 1; i--) {
	MOVLW      1
	SUBWF      R2+0, 1
	BTFSS      STATUS+0, 0
	DECF       R2+1, 1
;Lab_03.c,18 :: 		}
	GOTO       L_knightrider4
L_knightrider5:
;Lab_03.c,19 :: 		}
L_end_knightrider:
	RETURN
; end of _knightrider

_main:

;Lab_03.c,20 :: 		void main() {
;Lab_03.c,21 :: 		CMCON = 0x07; // Hint: Disable comparators
	MOVLW      7
	MOVWF      CMCON+0
;Lab_03.c,22 :: 		TRISA = 0xff; // Hint: Set all PORTA pins as digital I/O
	MOVLW      255
	MOVWF      TRISA+0
;Lab_03.c,23 :: 		while (1) // Hint: Enter a condition for the infinite loop
L_main8:
;Lab_03.c,24 :: 		knightrider(); // Call the knightrider function
	CALL       _knightrider+0
	GOTO       L_main8
;Lab_03.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
