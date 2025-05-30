
_main:

;MyProject.c,6 :: 		void main(){
;MyProject.c,8 :: 		TRISA = 0b00000001;
	MOVLW      1
	MOVWF      TRISA+0
;MyProject.c,9 :: 		TRISB = 0b10000000;
	MOVLW      128
	MOVWF      TRISB+0
;MyProject.c,10 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;MyProject.c,11 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MyProject.c,14 :: 		while(1) {
L_main0:
;MyProject.c,15 :: 		if(PORTB.RB7 == 1 && stop == 0){
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
;MyProject.c,16 :: 		count=count+2;
	MOVLW      2
	ADDWF      _count+0, 0
	MOVWF      R1+0
	MOVF       _count+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      _count+0
	MOVF       R1+1, 0
	MOVWF      _count+1
;MyProject.c,17 :: 		if(count > 9){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVF       R1+0, 0
	SUBLW      9
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;MyProject.c,18 :: 		count = 1;
	MOVLW      1
	MOVWF      _count+0
	MOVLW      0
	MOVWF      _count+1
;MyProject.c,19 :: 		}
L_main5:
;MyProject.c,20 :: 		PORTB = numbers[count];
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
;MyProject.c,21 :: 		stop = 1;
	MOVLW      1
	MOVWF      _stop+0
	MOVLW      0
	MOVWF      _stop+1
;MyProject.c,22 :: 		Delay_ms(100);
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
;MyProject.c,23 :: 		}
	GOTO       L_main7
L_main4:
;MyProject.c,24 :: 		else if (PORTB.RB7 == 0){
	BTFSC      PORTB+0, 7
	GOTO       L_main8
;MyProject.c,25 :: 		stop = 0;
	CLRF       _stop+0
	CLRF       _stop+1
;MyProject.c,26 :: 		}
L_main8:
L_main7:
;MyProject.c,27 :: 		}
	GOTO       L_main0
;MyProject.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
