
_main:

;LED_Blink.c,2 :: 		void main() {
;LED_Blink.c,3 :: 		TRISA.RA2=0;
	BCF        TRISA+0, 2
;LED_Blink.c,5 :: 		while (1){
L_main0:
;LED_Blink.c,6 :: 		PORTA.RA2=1;
	BSF        PORTA+0, 2
;LED_Blink.c,7 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;LED_Blink.c,8 :: 		PORTA.RA2=0;
	BCF        PORTA+0, 2
;LED_Blink.c,9 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;LED_Blink.c,10 :: 		}
	GOTO       L_main0
;LED_Blink.c,11 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
