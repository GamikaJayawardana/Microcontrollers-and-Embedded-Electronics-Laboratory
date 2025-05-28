
_main:

;MyProject.c,4 :: 		void main() {
;MyProject.c,5 :: 		unsigned short duty_cycle = 0;
	CLRF       main_duty_cycle_L0+0
;MyProject.c,9 :: 		CMCON = 0x07;       // Disable comparators
	MOVLW      7
	MOVWF      CMCON+0
;MyProject.c,10 :: 		TRISB = 0x00;       // Set PORTB as output
	CLRF       TRISB+0
;MyProject.c,11 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;MyProject.c,13 :: 		TRISA = 0x06;       // RA1 and RA2 as inputs, others as outputs
	MOVLW      6
	MOVWF      TRISA+0
;MyProject.c,14 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;MyProject.c,16 :: 		PWM1_Init(5000);    // 5kHz PWM frequency
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;MyProject.c,17 :: 		PWM1_Start();       // Start PWM
	CALL       _PWM1_Start+0
;MyProject.c,19 :: 		while(1) {
L_main0:
;MyProject.c,21 :: 		if (sw1 == 1) {
	BTFSS      RA1_bit+0, BitPos(RA1_bit+0)
	GOTO       L_main2
;MyProject.c,22 :: 		if (duty_cycle < 100) {
	MOVLW      100
	SUBWF      main_duty_cycle_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;MyProject.c,23 :: 		duty_cycle += 10;   // Increase brightness by 10%
	MOVLW      10
	ADDWF      main_duty_cycle_L0+0, 1
;MyProject.c,24 :: 		}
L_main3:
;MyProject.c,25 :: 		}
L_main2:
;MyProject.c,28 :: 		if (sw2 == 1) {
	BTFSS      RA2_bit+0, BitPos(RA2_bit+0)
	GOTO       L_main4
;MyProject.c,29 :: 		if (duty_cycle >= 10) {
	MOVLW      10
	SUBWF      main_duty_cycle_L0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main5
;MyProject.c,30 :: 		duty_cycle -= 10;   // Decrease brightness by 10%
	MOVLW      10
	SUBWF      main_duty_cycle_L0+0, 1
;MyProject.c,31 :: 		}
L_main5:
;MyProject.c,32 :: 		}
L_main4:
;MyProject.c,35 :: 		duty_value = (unsigned short)((duty_cycle * 255) / 100);
	MOVF       main_duty_cycle_L0+0, 0
	MOVWF      R0+0
	MOVLW      255
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
;MyProject.c,36 :: 		PWM1_Set_Duty(duty_value);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,39 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;MyProject.c,40 :: 		}
	GOTO       L_main0
;MyProject.c,41 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
