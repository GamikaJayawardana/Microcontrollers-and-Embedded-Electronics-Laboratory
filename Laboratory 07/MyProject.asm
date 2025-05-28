
_main:

;MyProject.c,1 :: 		void main() {
;MyProject.c,2 :: 		int i = 0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;MyProject.c,5 :: 		TRISB = 0b11000011;
	MOVLW      195
	MOVWF      TRISB+0
;MyProject.c,6 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;MyProject.c,9 :: 		while(1) {
L_main0:
;MyProject.c,12 :: 		if(PORTB == 0b00000001) {
	MOVF       PORTB+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;MyProject.c,13 :: 		PORTB = 0b00010100;
	MOVLW      20
	MOVWF      PORTB+0
;MyProject.c,14 :: 		while(i == 0) {
L_main3:
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      0
	XORWF      main_i_L0+0, 0
L__main12:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;MyProject.c,15 :: 		if(PORTB.RB6 == 1) {
	BTFSS      PORTB+0, 6
	GOTO       L_main5
;MyProject.c,16 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;MyProject.c,17 :: 		i = 1;
	MOVLW      1
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
;MyProject.c,18 :: 		}
L_main5:
;MyProject.c,19 :: 		}
	GOTO       L_main3
L_main4:
;MyProject.c,20 :: 		i = 0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;MyProject.c,21 :: 		}
	GOTO       L_main6
L_main2:
;MyProject.c,24 :: 		else if(PORTB == 0b00000010) {
	MOVF       PORTB+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;MyProject.c,25 :: 		PORTB = 0b00101000;
	MOVLW      40
	MOVWF      PORTB+0
;MyProject.c,26 :: 		while(i == 0) {
L_main8:
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      0
	XORWF      main_i_L0+0, 0
L__main13:
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;MyProject.c,27 :: 		if(PORTB.RB6 == 1) {
	BTFSS      PORTB+0, 6
	GOTO       L_main10
;MyProject.c,28 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;MyProject.c,29 :: 		i = 1;
	MOVLW      1
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
;MyProject.c,30 :: 		}
L_main10:
;MyProject.c,31 :: 		}
	GOTO       L_main8
L_main9:
;MyProject.c,32 :: 		i = 0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;MyProject.c,33 :: 		}
L_main7:
L_main6:
;MyProject.c,34 :: 		}
	GOTO       L_main0
;MyProject.c,35 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
