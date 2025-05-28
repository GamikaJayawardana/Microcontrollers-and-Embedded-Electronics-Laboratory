
_main:

;Lab_04.c,2 :: 		void main()
;Lab_04.c,5 :: 		TRISB = 0x01; // Hint: Set RB0 as input, others as output
	MOVLW      1
	MOVWF      TRISB+0
;Lab_04.c,6 :: 		TRISA = 0x00; // Hint: Set all port A pins as output
	CLRF       TRISA+0
;Lab_04.c,7 :: 		CMCON = 0x07; // Hint: Disable comparators
	MOVLW      7
	MOVWF      CMCON+0
;Lab_04.c,8 :: 		OPTION_REG = 0x00; // Hint: Configure option register
	CLRF       OPTION_REG+0
;Lab_04.c,10 :: 		INTCON.GIE = 1; // Hint: Enable global interrupts
	BSF        INTCON+0, 7
;Lab_04.c,11 :: 		INTCON.PEIE = 1; // Hint: Enable peripheral interrupts
	BSF        INTCON+0, 6
;Lab_04.c,12 :: 		INTCON.INTE = 1; // Hint: Enable RB0/INT interrupt
	BSF        INTCON+0, 4
;Lab_04.c,14 :: 		while (1){ // Hint: Enter an appropriate condition for the loop
L_main0:
;Lab_04.c,16 :: 		PORTB.RB2 = 0; // Hint: Set RB2 to low
	BCF        PORTB+0, 2
;Lab_04.c,17 :: 		PORTA.RA0 = 1; // Hint: Set RA0 to high
	BSF        PORTA+0, 0
;Lab_04.c,18 :: 		PORTA.RA1 = 0; // Hint: Set RA1 to low
	BCF        PORTA+0, 1
;Lab_04.c,19 :: 		delay_ms(100);// Hint: Pauses the execution for 100 milliseconds
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;Lab_04.c,21 :: 		PORTA.RA0 = 0; // Hint: Set RA0 to low
	BCF        PORTA+0, 0
;Lab_04.c,22 :: 		PORTA.RA1 = 1; // Hint: Set RA1 to high
	BSF        PORTA+0, 1
;Lab_04.c,23 :: 		delay_ms(100);//Hint: Pauses the execution for 100 milliseconds
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;Lab_04.c,24 :: 		INTCON.INTF = 0; // Hint: Clear the external interrupt flag
	BCF        INTCON+0, 1
;Lab_04.c,25 :: 		}
	GOTO       L_main0
;Lab_04.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Lab_04.c,28 :: 		void interrupt() {
;Lab_04.c,29 :: 		if (INTCON.INTF) {  // Hint: Check the external interrupt flag (INTCON.INTF)
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt4
;Lab_04.c,31 :: 		PORTB.RB1 = 1; // Hint: Set RB1 to high
	BSF        PORTB+0, 1
;Lab_04.c,32 :: 		PORTB.RB2 = 0; // Hint: Set RB2 to low
	BCF        PORTB+0, 2
;Lab_04.c,33 :: 		delay_ms(200); // Hint: Pauses the execution for 100 milliseconds
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_interrupt5:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt5
	DECFSZ     R12+0, 1
	GOTO       L_interrupt5
	DECFSZ     R11+0, 1
	GOTO       L_interrupt5
;Lab_04.c,35 :: 		PORTB.RB1 = 0; // Hint: Set RB1 to low
	BCF        PORTB+0, 1
;Lab_04.c,36 :: 		PORTB.RB2 = 1; // Hint: Set RB2 to high
	BSF        PORTB+0, 2
;Lab_04.c,37 :: 		delay_ms(200);//Hint: Pauses the execution for 100 milliseconds
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_interrupt6:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt6
	DECFSZ     R12+0, 1
	GOTO       L_interrupt6
	DECFSZ     R11+0, 1
	GOTO       L_interrupt6
;Lab_04.c,38 :: 		INTCON.INTF = 0; // Hint: Clear the external interrupt flag
	BCF        INTCON+0, 1
;Lab_04.c,39 :: 		}
L_interrupt4:
;Lab_04.c,40 :: 		}
L_end_interrupt:
L__interrupt9:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
