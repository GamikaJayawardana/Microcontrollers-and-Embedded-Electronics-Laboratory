
_main:

;ex_02.c,8 :: 		void main(){
;ex_02.c,9 :: 		TRISA = 0b00000001; // RA0 as input
	MOVLW      1
	MOVWF      TRISA+0
;ex_02.c,10 :: 		TRISB = 0b10000000; // RB7 as input, others output
	MOVLW      128
	MOVWF      TRISB+0
;ex_02.c,11 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;ex_02.c,12 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;ex_02.c,14 :: 		while(1){
L_main0:
;ex_02.c,15 :: 		if(PORTB.RB7 == 1 && stop == 0){
	BTFSS      PORTB+0, 7
	GOTO       L_main4
	MOVLW      0
	XORWF      _stop+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      0
	XORWF      _stop+0, 0
L__main12:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
L__main10:
;ex_02.c,16 :: 		count++;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;ex_02.c,17 :: 		if(count > max_limit){
	MOVLW      128
	XORWF      _max_limit+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVF       _count+0, 0
	SUBWF      _max_limit+0, 0
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;ex_02.c,18 :: 		count = 0;
	CLRF       _count+0
	CLRF       _count+1
;ex_02.c,19 :: 		max_limit++;
	INCF       _max_limit+0, 1
	BTFSC      STATUS+0, 2
	INCF       _max_limit+1, 1
;ex_02.c,20 :: 		if(max_limit > 5){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _max_limit+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVF       _max_limit+0, 0
	SUBLW      5
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;ex_02.c,21 :: 		max_limit = 3; // reset cycle
	MOVLW      3
	MOVWF      _max_limit+0
	MOVLW      0
	MOVWF      _max_limit+1
;ex_02.c,22 :: 		}
L_main6:
;ex_02.c,23 :: 		}
L_main5:
;ex_02.c,24 :: 		PORTB = numbers[count];
	MOVF       _count+0, 0
	ADDLW      _numbers+0
	MOVWF      R0+0
	MOVLW      hi_addr(_numbers+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _count+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
;ex_02.c,25 :: 		stop = 1;
	MOVLW      1
	MOVWF      _stop+0
	MOVLW      0
	MOVWF      _stop+1
;ex_02.c,26 :: 		Delay_ms(100); // debounce
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;ex_02.c,27 :: 		}
	GOTO       L_main8
L_main4:
;ex_02.c,28 :: 		else if(PORTB.RB7 == 0){
	BTFSC      PORTB+0, 7
	GOTO       L_main9
;ex_02.c,29 :: 		stop = 0;
	CLRF       _stop+0
	CLRF       _stop+1
;ex_02.c,30 :: 		}
L_main9:
L_main8:
;ex_02.c,31 :: 		}
	GOTO       L_main0
;ex_02.c,32 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
