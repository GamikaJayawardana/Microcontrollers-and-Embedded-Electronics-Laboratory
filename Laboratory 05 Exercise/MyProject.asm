
_Move_Delay:

;MyProject.c,20 :: 		void Move_Delay() {
;MyProject.c,21 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Move_Delay0:
	DECFSZ     R13+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R12+0, 1
	GOTO       L_Move_Delay0
	DECFSZ     R11+0, 1
	GOTO       L_Move_Delay0
	NOP
;MyProject.c,22 :: 		}
L_end_Move_Delay:
	RETURN
; end of _Move_Delay

_main:

;MyProject.c,24 :: 		void main(){
;MyProject.c,25 :: 		CCP1CON = 0x00;
	CLRF       CCP1CON+0
;MyProject.c,26 :: 		T1CON = 0x00;
	CLRF       T1CON+0
;MyProject.c,27 :: 		VRCON = 0x00;
	CLRF       VRCON+0
;MyProject.c,28 :: 		INTCON = 0x00;
	CLRF       INTCON+0
;MyProject.c,29 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;MyProject.c,32 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;MyProject.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,35 :: 		Delay_ms(10);
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
;MyProject.c,36 :: 		Lcd_Out(1,1,txt1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,37 :: 		Move_Delay();
	CALL       _Move_Delay+0
;MyProject.c,40 :: 		while(1) {
L_main2:
;MyProject.c,41 :: 		pos1=5;
	MOVLW      5
	MOVWF      _pos1+0
	MOVLW      0
	MOVWF      _pos1+1
;MyProject.c,43 :: 		for(i = 1; i < 17; i++) {
	MOVLW      1
	MOVWF      _i+0
L_main4:
	MOVLW      17
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;MyProject.c,44 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,45 :: 		Lcd_Out(1,i,txt1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       _i+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,46 :: 		Move_Delay();
	CALL       _Move_Delay+0
;MyProject.c,43 :: 		for(i = 1; i < 17; i++) {
	INCF       _i+0, 1
;MyProject.c,47 :: 		}
	GOTO       L_main4
L_main5:
;MyProject.c,50 :: 		for(i = 16; i > 0; i--) {
	MOVLW      16
	MOVWF      _i+0
L_main7:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;MyProject.c,51 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;MyProject.c,52 :: 		Lcd_Out(2,i,txt1);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       _i+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;MyProject.c,53 :: 		Move_Delay();
	CALL       _Move_Delay+0
;MyProject.c,50 :: 		for(i = 16; i > 0; i--) {
	DECF       _i+0, 1
;MyProject.c,54 :: 		}
	GOTO       L_main7
L_main8:
;MyProject.c,56 :: 		}
	GOTO       L_main2
;MyProject.c,60 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
