
_knightrider:

;Lab_03_EX_02.c,1 :: 		void knightrider(void) {
;Lab_03_EX_02.c,5 :: 		TRISB = 0b00000000; // Set all PORTB pins as output
	CLRF       TRISB+0
;Lab_03_EX_02.c,8 :: 		PORTB = 0b00011000; // RB3 and RB4 ON (center LEDs)
	MOVLW      24
	MOVWF      PORTB+0
;Lab_03_EX_02.c,11 :: 		for (i = 0; i < 3; i++) {
	CLRF       R3+0
	CLRF       R3+1
L_knightrider0:
	MOVLW      128
	XORWF      R3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightrider11
	MOVLW      3
	SUBWF      R3+0, 0
L__knightrider11:
	BTFSC      STATUS+0, 0
	GOTO       L_knightrider1
;Lab_03_EX_02.c,12 :: 		PORTB = (PORTB << 1) | (PORTB >> 1); // Expand outward
	MOVF       PORTB+0, 0
	MOVWF      R2+0
	RLF        R2+0, 1
	BCF        R2+0, 0
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	IORWF      R2+0, 0
	MOVWF      PORTB+0
;Lab_03_EX_02.c,13 :: 		Delay_ms(100); // Delay for smooth animation
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
;Lab_03_EX_02.c,11 :: 		for (i = 0; i < 3; i++) {
	INCF       R3+0, 1
	BTFSC      STATUS+0, 2
	INCF       R3+1, 1
;Lab_03_EX_02.c,14 :: 		}
	GOTO       L_knightrider0
L_knightrider1:
;Lab_03_EX_02.c,17 :: 		for (i = 0; i < 3; i++) {
	CLRF       R3+0
	CLRF       R3+1
L_knightrider4:
	MOVLW      128
	XORWF      R3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightrider12
	MOVLW      3
	SUBWF      R3+0, 0
L__knightrider12:
	BTFSC      STATUS+0, 0
	GOTO       L_knightrider5
;Lab_03_EX_02.c,18 :: 		PORTB = (PORTB >> 1) & (PORTB << 1); // Contract inward
	MOVF       PORTB+0, 0
	MOVWF      R2+0
	RRF        R2+0, 1
	BCF        R2+0, 7
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ANDWF      R2+0, 0
	MOVWF      PORTB+0
;Lab_03_EX_02.c,19 :: 		Delay_ms(100); // Delay for smooth animation
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
;Lab_03_EX_02.c,17 :: 		for (i = 0; i < 3; i++) {
	INCF       R3+0, 1
	BTFSC      STATUS+0, 2
	INCF       R3+1, 1
;Lab_03_EX_02.c,20 :: 		}
	GOTO       L_knightrider4
L_knightrider5:
;Lab_03_EX_02.c,21 :: 		}
L_end_knightrider:
	RETURN
; end of _knightrider

_main:

;Lab_03_EX_02.c,23 :: 		void main() {
;Lab_03_EX_02.c,24 :: 		CMCON = 0b00000111; // Disable comparators (for older PICs)
	MOVLW      7
	MOVWF      CMCON+0
;Lab_03_EX_02.c,25 :: 		TRISA = 0b00000000; // Set PORTA as digital output
	CLRF       TRISA+0
;Lab_03_EX_02.c,27 :: 		while (1) { // Infinite loop
L_main8:
;Lab_03_EX_02.c,28 :: 		knightrider(); // Call the LED chaser function
	CALL       _knightrider+0
;Lab_03_EX_02.c,29 :: 		}
	GOTO       L_main8
;Lab_03_EX_02.c,30 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
