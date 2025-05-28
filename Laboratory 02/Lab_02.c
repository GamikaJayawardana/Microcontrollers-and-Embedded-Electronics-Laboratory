 // Define the address and bit for the switch
sbit sw at RA2_bit; // Define sw at RA2 bit

  // Main function
void main() {
     // Step 1: Initialize configuration settings
    CMCON = 0x07 ;  // Hint: Disable Comparator
    TRISA = 0x04 ;  // Hint: Configure TRISA register
    TRISB = 0x00 ;  // Hint: Configure TRISB register
    PORTB =0xff  ;  // Hint: Initialize PORTB register
    RA2_bit = 0x00 ;  // Hint: Set RA2_bit to low state
    
    // Step 2: Enter the first loop
    do {
    // Step 3: Check the state of the switch
        if(sw == 1 ) {
        // Step 4: If the switch is pressed, set PORTB to be low
            PORTB = 0x00 ;
        }
        else {
        // Step 5: If the switch is not pressed, set PORTB to be high
            PORTB = 0xff ;
        }
    } while(1); // Hint: Enter a condition for the infinite loop
}
