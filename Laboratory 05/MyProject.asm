
_Move_Delay:

;MyProject.c,23 :: 		void Move_Delay() {
;MyProject.c,24 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_Move_Delay0:
	DECFSZ     R13+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R12+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R11+0, 1
	GOTO       L_Move_Delay0
	NOP
	NOP
;MyProject.c,25 :: 		}
L_end_Move_Delay:
	RETURN
; end of _Move_Delay

_main:

;MyProject.c,27 :: 		void main(){
;MyProject.c,28 :: 		CCP1CON = 0x00;
	CLRF       CCP1CON+0
;MyProject.c,29 :: 		T1CON = 0x00;
	CLRF       T1CON+0
;MyProject.c,30 :: 		VRCON = 0x00;
	CLRF       VRCON+0
;MyProject.c,31 :: 		INTCON = 0x00;
	CLRF       INTCON+0
;MyProject.c,32 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;MyProject.c,34 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,35 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,36 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,37 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	NOP
;MyProject.c,38 :: 		Lcd_Out(1,5,txt1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,39 :: 		Lcd_Out(2,3,txt2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,40 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;MyProject.c,41 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,42 :: 		Lcd_Out(1,6,txt3);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt3+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,43 :: 		Lcd_Out(2,6,txt4);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt4+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,44 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;MyProject.c,47 :: 		for(i=0; i<4; i++) {
	CLRF       _i+0
L_main4:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;MyProject.c,48 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,49 :: 		Move_Delay();
	CALL       _Move_Delay+0
;MyProject.c,47 :: 		for(i=0; i<4; i++) {
	INCF       _i+0, 1
;MyProject.c,50 :: 		}
	GOTO       L_main4
L_main5:
;MyProject.c,52 :: 		while(1) {
L_main7:
;MyProject.c,53 :: 		for(i=0; i<9; i++) {
	CLRF       _i+0
L_main9:
	MOVLW      9
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;MyProject.c,54 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,55 :: 		Move_Delay();
	CALL       _Move_Delay+0
;MyProject.c,53 :: 		for(i=0; i<9; i++) {
	INCF       _i+0, 1
;MyProject.c,56 :: 		}
	GOTO       L_main9
L_main10:
;MyProject.c,58 :: 		for(i=0; i<5; i++) {
	CLRF       _i+0
L_main12:
	MOVLW      5
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main13
;MyProject.c,59 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
	MOVLW      28
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,60 :: 		Move_Delay();
	CALL       _Move_Delay+0
;MyProject.c,58 :: 		for(i=0; i<5; i++) {
	INCF       _i+0, 1
;MyProject.c,61 :: 		}
	GOTO       L_main12
L_main13:
;MyProject.c,62 :: 		}
	GOTO       L_main7
;MyProject.c,63 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
