
_main:

;MyProject.c,6 :: 		void main() {
;MyProject.c,9 :: 		CMCON = 0x07;      // Disable comparators
	MOVLW      7
	MOVWF      CMCON+0
;MyProject.c,10 :: 		TRISA = 0x07;      // Set RA0, RA1, RA2 as input (1), others as output (0)
	MOVLW      7
	MOVWF      TRISA+0
;MyProject.c,11 :: 		TRISB = 0x00;      // Set all Port B pins as output
	CLRF       TRISB+0
;MyProject.c,12 :: 		PORTB = 0x00;      // Initialize PORTB to 0
	CLRF       PORTB+0
;MyProject.c,15 :: 		while(1) {         // Infinite loop
L_main0:
;MyProject.c,18 :: 		if (!Forward) {
	BTFSC      RA0_bit+0, BitPos(RA0_bit+0)
	GOTO       L_main2
;MyProject.c,19 :: 		PORTB = 0x03;   // Clear Port B output latch
	MOVLW      3
	MOVWF      PORTB+0
;MyProject.c,20 :: 		RB0_bit = 1;    // Set RB0 high
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;MyProject.c,21 :: 		RB1_bit = 1;    // Set RB1 high
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
;MyProject.c,22 :: 		RB2_bit = 0;    // Set RB2 low
	BCF        RB2_bit+0, BitPos(RB2_bit+0)
;MyProject.c,23 :: 		}
	GOTO       L_main3
L_main2:
;MyProject.c,25 :: 		else if (!Reverse) {
	BTFSC      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_main4
;MyProject.c,26 :: 		PORTB = 0x05;   // Clear Port B output latch
	MOVLW      5
	MOVWF      PORTB+0
;MyProject.c,27 :: 		RB0_bit = 1;    // Set RB0 high
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;MyProject.c,28 :: 		RB1_bit = 0;    // Set RB1 low
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
;MyProject.c,29 :: 		RB2_bit = 1;    // Set RB2 high
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
;MyProject.c,30 :: 		}
	GOTO       L_main5
L_main4:
;MyProject.c,32 :: 		else if (!Brake) {
	BTFSC      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main6
;MyProject.c,34 :: 		PORTB = 0x00;   // Ensure PORTB is cleared
	CLRF       PORTB+0
;MyProject.c,35 :: 		}
L_main6:
L_main5:
L_main3:
;MyProject.c,36 :: 		}
	GOTO       L_main0
;MyProject.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
