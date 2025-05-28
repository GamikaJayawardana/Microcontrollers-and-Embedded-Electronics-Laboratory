// Step 1: Declare the main function
void main() 
{
    // Step 2: Initialize configuration settings
    TRISB = 0x01; // Hint: Set RB0 as input, others as output
    TRISA = 0x00; // Hint: Set all port A pins as output
    CMCON = 0x07; // Hint: Disable comparators
    OPTION_REG = 0x00; // Hint: Configure option register
    // Step 3: Enable interrupts
    INTCON.GIE = 1; // Hint: Enable global interrupts
    INTCON.PEIE = 1; // Hint: Enable peripheral interrupts
    INTCON.INTE = 1; // Hint: Enable RB0/INT interrupt
    // Step 4: Define the infinite loop
    while (1){ // Hint: Enter an appropriate condition for the loop
      // Step 5: Set initial PORT values
        PORTB.RB2 = 0; // Hint: Set RB2 to low
        PORTA.RA0 = 1; // Hint: Set RA0 to high
        PORTA.RA1 = 0; // Hint: Set RA1 to low
        delay_ms(100);// Hint: Pauses the execution for 100 milliseconds
        // Step 6: Toggle PORT values
        PORTA.RA0 = 0; // Hint: Set RA0 to low
        PORTA.RA1 = 1; // Hint: Set RA1 to high
        delay_ms(100);//Hint: Pauses the execution for 100 milliseconds
        INTCON.INTF = 0; // Hint: Clear the external interrupt flag
    }
}
    // Step 7: Interrupt service routine
void interrupt() {
if (INTCON.INTF) {  // Hint: Check the external interrupt flag (INTCON.INTF)
       // Step 8: Set PORT values upon interrupt
       PORTB.RB1 = 1; // Hint: Set RB1 to high
       PORTB.RB2 = 0; // Hint: Set RB2 to low
       delay_ms(200); // Hint: Pauses the execution for 100 milliseconds
       // Step 9: Toggle PORT values
        PORTB.RB1 = 0; // Hint: Set RB1 to low
        PORTB.RB2 = 1; // Hint: Set RB2 to high
        delay_ms(200);//Hint: Pauses the execution for 100 milliseconds
        INTCON.INTF = 0; // Hint: Clear the external interrupt flag
    }
}