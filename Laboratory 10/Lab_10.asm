
_main:

;Lab_10.c,5 :: 		void main() {
;Lab_10.c,6 :: 		TRISB = 0x01;     // Set RB0 as input (1), RB1 as output (0)
	MOVLW      1
	MOVWF      TRISB+0
;Lab_10.c,7 :: 		PORTB = 0x00;     // Initialize PORTB to all zeros
	CLRF       PORTB+0
;Lab_10.c,9 :: 		while (1) {
L_main0:
;Lab_10.c,10 :: 		if (sw1 == 0 && last_state == 1) {  // Detect button press (falling edge)
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main4
	MOVLW      0
	XORWF      _last_state+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      1
	XORWF      _last_state+0, 0
L__main10:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
L__main8:
;Lab_10.c,11 :: 		last_state = 0;     // Button is now pressed
	CLRF       _last_state+0
	CLRF       _last_state+1
;Lab_10.c,12 :: 		state = !state;     // Toggle relay state (0?1 or 1?0)
	MOVF       _state+0, 0
	IORWF      _state+1, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _state+0
	MOVWF      _state+1
	MOVLW      0
	MOVWF      _state+1
;Lab_10.c,13 :: 		RB1_bit = state;    // Output state to RB1 (relay control)
	BTFSC      _state+0, 0
	GOTO       L__main11
	BCF        RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L__main12
L__main11:
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
L__main12:
;Lab_10.c,14 :: 		Delay_ms(50);       // 50ms debounce delay
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;Lab_10.c,15 :: 		}
	GOTO       L_main6
L_main4:
;Lab_10.c,16 :: 		else if(sw1 == 1) {     // Button is released
	BTFSS      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main7
;Lab_10.c,17 :: 		last_state = 1;     // Reset to not pressed state
	MOVLW      1
	MOVWF      _last_state+0
	MOVLW      0
	MOVWF      _last_state+1
;Lab_10.c,18 :: 		}
L_main7:
L_main6:
;Lab_10.c,19 :: 		}
	GOTO       L_main0
;Lab_10.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
