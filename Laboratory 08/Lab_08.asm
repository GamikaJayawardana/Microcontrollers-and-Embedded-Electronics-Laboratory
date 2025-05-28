
_main:

;Lab_08.c,2 :: 		void main() {
;Lab_08.c,5 :: 		CMCON = 0x07;       // Disable comparators (set all to digital)
	MOVLW      7
	MOVWF      CMCON+0
;Lab_08.c,6 :: 		TRISB = 0x00;       // Set all port B pins as output
	CLRF       TRISB+0
;Lab_08.c,7 :: 		PORTB = 0x00;       // Initialize PORTB to 0
	CLRF       PORTB+0
;Lab_08.c,10 :: 		PWM1_Init(5000);    // Initialize PWM1 module with the frequency of 5kHz
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Lab_08.c,11 :: 		PWM1_Start();       // Start the PWM1 module operation
	CALL       _PWM1_Start+0
;Lab_08.c,14 :: 		while(1) {          // Infinite loop
L_main0:
;Lab_08.c,20 :: 		for (duty_cycle = 0; duty_cycle <= 255; duty_cycle += 5) {
	CLRF       main_duty_cycle_L1+0
L_main2:
	MOVF       main_duty_cycle_L1+0, 0
	SUBLW      255
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;Lab_08.c,21 :: 		PWM1_Set_Duty(duty_cycle);  // Set the duty cycle
	MOVF       main_duty_cycle_L1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Lab_08.c,22 :: 		Delay_ms(50);               // Delay to observe the change in LED brightness
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
;Lab_08.c,20 :: 		for (duty_cycle = 0; duty_cycle <= 255; duty_cycle += 5) {
	MOVLW      5
	ADDWF      main_duty_cycle_L1+0, 1
;Lab_08.c,23 :: 		}
	GOTO       L_main2
L_main3:
;Lab_08.c,26 :: 		for (duty_cycle = 255; duty_cycle >= 5; duty_cycle -= 5) {
	MOVLW      255
	MOVWF      main_duty_cycle_L1+0
L_main6:
	MOVLW      5
	SUBWF      main_duty_cycle_L1+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;Lab_08.c,27 :: 		PWM1_Set_Duty(duty_cycle);  // Set the duty cycle
	MOVF       main_duty_cycle_L1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Lab_08.c,28 :: 		Delay_ms(50);               // Delay to observe the change in LED brightness
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;Lab_08.c,26 :: 		for (duty_cycle = 255; duty_cycle >= 5; duty_cycle -= 5) {
	MOVLW      5
	SUBWF      main_duty_cycle_L1+0, 1
;Lab_08.c,29 :: 		}
	GOTO       L_main6
L_main7:
;Lab_08.c,30 :: 		}
	GOTO       L_main0
;Lab_08.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
