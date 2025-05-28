// Step 1: Define pin assignments for motor control
sbit Forward at RA0_bit;
sbit Reverse at RA1_bit;
sbit Brake at RA2_bit;

void main() {

    // Step 2: Initialize configuration settings
    CMCON = 0x07;      // Disable comparators
    TRISA = 0x07;      // Set RA0, RA1, RA2 as input (1), others as output (0)
    TRISB = 0x00;      // Set all Port B pins as output
    PORTB = 0x00;      // Initialize PORTB to 0

    // Step 3: Define the infinite loop
    while(1) {         // Infinite loop

        // Step 4: Handling “Forward” Conditions
        if (!Forward) {
            PORTB = 0x03;   // Clear Port B output latch
            RB0_bit = 1;    // Set RB0 high
            RB1_bit = 1;    // Set RB1 high
            RB2_bit = 0;    // Set RB2 low
        }
        // Step 5: Handling “Reverse” Conditions
        else if (!Reverse) {
            PORTB = 0x05;   // Clear Port B output latch
            RB0_bit = 1;    // Set RB0 high
            RB1_bit = 0;    // Set RB1 low
            RB2_bit = 1;    // Set RB2 high
        }
        // Step 6: Handling “Brake” Conditions
        else if (!Brake) {
            // Step 7: Perform actions for braking
            PORTB = 0x00;   // Ensure PORTB is cleared
        }
    }
}
