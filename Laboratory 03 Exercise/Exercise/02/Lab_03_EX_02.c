void knightrider(void) {
    int i;

    // Step 1: Set all pins of PORTB as outputs
    TRISB = 0b00000000; // Set all PORTB pins as output

    // Step 2: Initialize PORTB with the middle LEDs lit (RB3 and RB4)
    PORTB = 0b00011000; // RB3 and RB4 ON (center LEDs)

    // Step 3: Move LEDs from center to ends (both directions)
    for (i = 0; i < 3; i++) {
        PORTB = (PORTB << 1) | (PORTB >> 1); // Expand outward
        Delay_ms(100); // Delay for smooth animation
    }

    // Step 4: Move LEDs back from ends to center
    for (i = 0; i < 3; i++) {
        PORTB = (PORTB >> 1) & (PORTB << 1); // Contract inward
        Delay_ms(100); // Delay for smooth animation
    }
}

void main() {
    CMCON = 0b00000111; // Disable comparators (for older PICs)
    TRISA = 0b00000000; // Set PORTA as digital output

    while (1) { // Infinite loop
        knightrider(); // Call the LED chaser function
    }
}