
_main:

;MyProject.c,7 :: 		void main()
;MyProject.c,10 :: 		TRISB = 0x01; // Hint: Set RB0 as input, others as output
	MOVLW      1
	MOVWF      TRISB+0
;MyProject.c,11 :: 		TRISA = 0x00; // Hint: Set all port A pins as output
	CLRF       TRISA+0
;MyProject.c,12 :: 		CMCON = 0x07; // Hint: Disable comparators
	MOVLW      7
	MOVWF      CMCON+0
;MyProject.c,13 :: 		OPTION_REG = 0x00; // Hint: Configure option register
	CLRF       OPTION_REG+0
;MyProject.c,15 :: 		INTCON.GIE = 1; // Hint: Enable global interrupts
	BSF        INTCON+0, 7
;MyProject.c,16 :: 		INTCON.PEIE = 1; // Hint: Enable peripheral interrupts
	BSF        INTCON+0, 6
;MyProject.c,17 :: 		INTCON.INTE = 1; // Hint: Enable RB0/INT interrupt
	BSF        INTCON+0, 4
;MyProject.c,22 :: 		while (1){ // Hint: Enter an appropriate condition for the loop
L_main0:
;MyProject.c,24 :: 		PORTB.RB2 = 0; // Hint: Set RB2 to low
	BCF        PORTB+0, 2
;MyProject.c,25 :: 		PORTA.RA0 = 1; // Hint: Set RA0 to high
	BSF        PORTA+0, 0
;MyProject.c,26 :: 		PORTA.RA1 = 0; // Hint: Set RA1 to low
	BCF        PORTA+0, 1
;MyProject.c,27 :: 		if (a == 50) delay_ms(50);
	MOVLW      0
	XORWF      _a+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      50
	XORWF      _a+0, 0
L__main24:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
	GOTO       L_main4
L_main2:
;MyProject.c,28 :: 		else if (a == 200) delay_ms(200);
	MOVLW      0
	XORWF      _a+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVLW      200
	XORWF      _a+0, 0
L__main25:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
L_main5:
L_main4:
;MyProject.c,31 :: 		PORTA.RA0 = 0; // Hint: Set RA0 to low
	BCF        PORTA+0, 0
;MyProject.c,32 :: 		PORTA.RA1 = 1; // Hint: Set RA1 to high
	BSF        PORTA+0, 1
;MyProject.c,33 :: 		if (a == 50) delay_ms(50);
	MOVLW      0
	XORWF      _a+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVLW      50
	XORWF      _a+0, 0
L__main26:
	BTFSS      STATUS+0, 2
	GOTO       L_main7
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	NOP
	GOTO       L_main9
L_main7:
;MyProject.c,34 :: 		else if (a == 200) delay_ms(200);
	MOVLW      0
	XORWF      _a+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVLW      200
	XORWF      _a+0, 0
L__main27:
	BTFSS      STATUS+0, 2
	GOTO       L_main10
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
L_main10:
L_main9:
;MyProject.c,36 :: 		INTCON.INTF = 0; // Hint: Clear the external interrupt flag
	BCF        INTCON+0, 1
;MyProject.c,37 :: 		}
	GOTO       L_main0
;MyProject.c,38 :: 		}
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

;MyProject.c,40 :: 		void interrupt() {
;MyProject.c,41 :: 		if (INTCON.INTF) {  // Hint: Check the external interrupt flag (INTCON.INTF)
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt12
;MyProject.c,43 :: 		PORTB.RB1 = 1; // Hint: Set RB1 to high
	BSF        PORTB+0, 1
;MyProject.c,44 :: 		PORTB.RB2 = 0; // Hint: Set RB2 to low
	BCF        PORTB+0, 2
;MyProject.c,45 :: 		if (b == 50) delay_ms(50);
	MOVLW      0
	XORWF      _b+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt30
	MOVLW      50
	XORWF      _b+0, 0
L__interrupt30:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt13
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_interrupt14:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt14
	DECFSZ     R12+0, 1
	GOTO       L_interrupt14
	NOP
	NOP
	GOTO       L_interrupt15
L_interrupt13:
;MyProject.c,46 :: 		else if (b == 200) delay_ms(200);
	MOVLW      0
	XORWF      _b+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt31
	MOVLW      200
	XORWF      _b+0, 0
L__interrupt31:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt16
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_interrupt17:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt17
	DECFSZ     R12+0, 1
	GOTO       L_interrupt17
	DECFSZ     R11+0, 1
	GOTO       L_interrupt17
L_interrupt16:
L_interrupt15:
;MyProject.c,49 :: 		PORTB.RB1 = 0; // Hint: Set RB1 to low
	BCF        PORTB+0, 1
;MyProject.c,50 :: 		PORTB.RB2 = 1; // Hint: Set RB2 to high
	BSF        PORTB+0, 2
;MyProject.c,51 :: 		if (b == 50) delay_ms(50);
	MOVLW      0
	XORWF      _b+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt32
	MOVLW      50
	XORWF      _b+0, 0
L__interrupt32:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt18
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_interrupt19:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt19
	DECFSZ     R12+0, 1
	GOTO       L_interrupt19
	NOP
	NOP
	GOTO       L_interrupt20
L_interrupt18:
;MyProject.c,52 :: 		else if (b == 200) delay_ms(200);
	MOVLW      0
	XORWF      _b+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt33
	MOVLW      200
	XORWF      _b+0, 0
L__interrupt33:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt21
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_interrupt22:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt22
	DECFSZ     R12+0, 1
	GOTO       L_interrupt22
	DECFSZ     R11+0, 1
	GOTO       L_interrupt22
L_interrupt21:
L_interrupt20:
;MyProject.c,56 :: 		temp = a;
	MOVF       _a+0, 0
	MOVWF      _temp+0
	MOVF       _a+1, 0
	MOVWF      _temp+1
;MyProject.c,57 :: 		a = b;
	MOVF       _b+0, 0
	MOVWF      _a+0
	MOVF       _b+1, 0
	MOVWF      _a+1
;MyProject.c,58 :: 		b = temp;
	MOVF       _temp+0, 0
	MOVWF      _b+0
	MOVF       _temp+1, 0
	MOVWF      _b+1
;MyProject.c,60 :: 		INTCON.INTF = 0; // Hint: Clear the external interrupt flag
	BCF        INTCON+0, 1
;MyProject.c,61 :: 		}
L_interrupt12:
;MyProject.c,63 :: 		}
L_end_interrupt:
L__interrupt29:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt
