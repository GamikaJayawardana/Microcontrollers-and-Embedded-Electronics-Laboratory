
_knightrider:

;MyProject.c,1 :: 		void knightrider(void) {
;MyProject.c,3 :: 		TRISB = 0b00000000;
	CLRF       TRISB+0
;MyProject.c,5 :: 		PORTB = 0b00000001;
	MOVLW      1
	MOVWF      PORTB+0
;MyProject.c,7 :: 		for (i = 0; i <= 3; i++) {
	CLRF       R2+0
	CLRF       R2+1
L_knightrider0:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightrider11
	MOVF       R2+0, 0
	SUBLW      3
L__knightrider11:
	BTFSS      STATUS+0, 0
	GOTO       L_knightrider1
;MyProject.c,8 :: 		PORTB = (PORTB << 2);
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MyProject.c,9 :: 		Delay_ms(100);
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
;MyProject.c,7 :: 		for (i = 0; i <= 3; i++) {
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;MyProject.c,10 :: 		}
	GOTO       L_knightrider0
L_knightrider1:
;MyProject.c,12 :: 		for (i = 0; i <= 3; i++) {
	CLRF       R2+0
	CLRF       R2+1
L_knightrider4:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__knightrider12
	MOVF       R2+0, 0
	SUBLW      3
L__knightrider12:
	BTFSS      STATUS+0, 0
	GOTO       L_knightrider5
;MyProject.c,13 :: 		PORTB = (PORTB >> 2);
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;MyProject.c,14 :: 		Delay_ms(100);
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
;MyProject.c,12 :: 		for (i = 0; i <= 3; i++) {
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;MyProject.c,15 :: 		}
	GOTO       L_knightrider4
L_knightrider5:
;MyProject.c,16 :: 		}
L_end_knightrider:
	RETURN
; end of _knightrider

_main:

;MyProject.c,18 :: 		void main() {
;MyProject.c,19 :: 		CMCON = 0b00000111;
	MOVLW      7
	MOVWF      CMCON+0
;MyProject.c,20 :: 		TRISA = 0b00000000;
	CLRF       TRISA+0
;MyProject.c,22 :: 		while (1) {
L_main8:
;MyProject.c,23 :: 		knightrider();
	CALL       _knightrider+0
;MyProject.c,24 :: 		}
	GOTO       L_main8
;MyProject.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
