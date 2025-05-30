
_main:

;Lab_09.c,6 :: 		void main(){
;Lab_09.c,8 :: 		TRISA = 0b00000001;
	MOVLW      1
	MOVWF      TRISA+0
;Lab_09.c,9 :: 		TRISB = 0b10000000;
	MOVLW      128
	MOVWF      TRISB+0
;Lab_09.c,10 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;Lab_09.c,11 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;Lab_09.c,14 :: 		while(1) {
L_main0:
;Lab_09.c,15 :: 		if(PORTB.RB7 == 1 && stop == 0){
	BTFSS      PORTB+0, 7
	GOTO       L_main4
	MOVLW      0
	XORWF      _stop+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      0
	XORWF      _stop+0, 0
L__main11:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
L__main9:
;Lab_09.c,16 :: 		count++;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;Lab_09.c,17 :: 		if(count > 10){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVF       _count+0, 0
	SUBLW      10
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;Lab_09.c,18 :: 		count = 0;
	CLRF       _count+0
	CLRF       _count+1
;Lab_09.c,19 :: 		}
L_main5:
;Lab_09.c,20 :: 		PORTB = numbers[count];
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
;Lab_09.c,21 :: 		stop = 1;
	MOVLW      1
	MOVWF      _stop+0
	MOVLW      0
	MOVWF      _stop+1
;Lab_09.c,22 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
;Lab_09.c,23 :: 		}
	GOTO       L_main7
L_main4:
;Lab_09.c,24 :: 		else if (PORTB.RB7 == 0){
	BTFSC      PORTB+0, 7
	GOTO       L_main8
;Lab_09.c,25 :: 		stop = 0;
	CLRF       _stop+0
	CLRF       _stop+1
;Lab_09.c,26 :: 		}
L_main8:
L_main7:
;Lab_09.c,27 :: 		}
	GOTO       L_main0
;Lab_09.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
