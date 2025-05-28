
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
;MyProject.c,10 :: 		if(PORTB.RB0==1 && PORTB.RB1==1){
	BTFSS      PORTB+0, 0
	GOTO       L_main4
	BTFSS      PORTB+0, 1
	GOTO       L_main4
L__main22:
;MyProject.c,11 :: 		PORTB.RB2 = 0;
	BCF        PORTB+0, 2
;MyProject.c,12 :: 		PORTB.RB3 = 0;
	BCF        PORTB+0, 3
;MyProject.c,13 :: 		PORTB.RB4 = 0;
	BCF        PORTB+0, 4
;MyProject.c,14 :: 		PORTB.RB5 = 0;
	BCF        PORTB+0, 5
;MyProject.c,15 :: 		PORTB.RB7 = 0;
	BCF        PORTB+0, 7
;MyProject.c,16 :: 		}
	GOTO       L_main5
L_main4:
;MyProject.c,18 :: 		else if(PORTB.RB0 == 1){
	BTFSS      PORTB+0, 0
	GOTO       L_main6
;MyProject.c,19 :: 		for(i = 0; i < 10; i++) {
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main7:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      10
	SUBWF      main_i_L0+0, 0
L__main24:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;MyProject.c,20 :: 		PORTB.RB2 = 1; // Buzzer ON
	BSF        PORTB+0, 2
;MyProject.c,21 :: 		PORTB.RB5 = 1 ;
	BSF        PORTB+0, 5
;MyProject.c,22 :: 		Delay_ms(200); // Beep duration
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
;MyProject.c,23 :: 		PORTB.RB2 = 0; // Buzzer OFF
	BCF        PORTB+0, 2
;MyProject.c,24 :: 		PORTB.RB5 = 0 ;
	BCF        PORTB+0, 5
;MyProject.c,25 :: 		Delay_ms(100); // Wait for the remainder of the second
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
;MyProject.c,19 :: 		for(i = 0; i < 10; i++) {
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;MyProject.c,26 :: 		}
	GOTO       L_main7
L_main8:
;MyProject.c,28 :: 		PORTB.RB2 = 1;
	BSF        PORTB+0, 2
;MyProject.c,29 :: 		PORTB.RB5 = 1 ;
	BSF        PORTB+0, 5
;MyProject.c,30 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
	NOP
	NOP
;MyProject.c,31 :: 		PORTB.RB2 = 0;
	BCF        PORTB+0, 2
;MyProject.c,32 :: 		PORTB.RB5 = 0 ;
	BCF        PORTB+0, 5
;MyProject.c,33 :: 		PORTB.RB7 = 1;
	BSF        PORTB+0, 7
;MyProject.c,34 :: 		}
	GOTO       L_main13
L_main6:
;MyProject.c,36 :: 		else if(PORTB.RB1 == 1){
	BTFSS      PORTB+0, 1
	GOTO       L_main14
;MyProject.c,37 :: 		for(i = 0; i < 9; i++) {
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main15:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVLW      9
	SUBWF      main_i_L0+0, 0
L__main25:
	BTFSC      STATUS+0, 0
	GOTO       L_main16
;MyProject.c,38 :: 		PORTB.RB3 = 1; // Buzzer ON
	BSF        PORTB+0, 3
;MyProject.c,39 :: 		PORTB.RB4 = 1 ;
	BSF        PORTB+0, 4
;MyProject.c,40 :: 		Delay_ms(200); // Beep duration
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
;MyProject.c,41 :: 		PORTB.RB3 = 0; // Buzzer OFF
	BCF        PORTB+0, 3
;MyProject.c,42 :: 		PORTB.RB4 = 0;
	BCF        PORTB+0, 4
;MyProject.c,43 :: 		Delay_ms(100); // Wait for the remainder of the second
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
;MyProject.c,37 :: 		for(i = 0; i < 9; i++) {
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;MyProject.c,44 :: 		}
	GOTO       L_main15
L_main16:
;MyProject.c,46 :: 		PORTB.RB3 = 1;
	BSF        PORTB+0, 3
;MyProject.c,47 :: 		PORTB.RB4 = 1;
	BSF        PORTB+0, 4
;MyProject.c,48 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
;MyProject.c,49 :: 		PORTB.RB3 = 0;
	BCF        PORTB+0, 3
;MyProject.c,50 :: 		PORTB.RB4 = 0;
	BCF        PORTB+0, 4
;MyProject.c,51 :: 		PORTB.RB7 = 1;
	BSF        PORTB+0, 7
;MyProject.c,52 :: 		}
	GOTO       L_main21
L_main14:
;MyProject.c,55 :: 		PORTB.RB2 = 0;
	BCF        PORTB+0, 2
;MyProject.c,56 :: 		PORTB.RB3 = 0;
	BCF        PORTB+0, 3
;MyProject.c,57 :: 		PORTB.RB4 = 0;
	BCF        PORTB+0, 4
;MyProject.c,58 :: 		PORTB.RB5 = 0;
	BCF        PORTB+0, 5
;MyProject.c,59 :: 		PORTB.RB7 = 0;
	BCF        PORTB+0, 7
;MyProject.c,60 :: 		}
L_main21:
L_main13:
L_main5:
;MyProject.c,63 :: 		}
	GOTO       L_main0
;MyProject.c,64 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
