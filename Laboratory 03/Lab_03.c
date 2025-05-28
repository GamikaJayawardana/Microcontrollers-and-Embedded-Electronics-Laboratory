void knightrider(void) {
    int i;
   // Step 1: Set all pins of PORTB as outputs
    TRISB = 0x00; // Hint: Set all pins of PORTB as outputs
   // Step 2: Initialize PORTB with the first LED lit
    PORTB = 0x01; // Hint: Initialize PORTB to light the first LED (RB0)
   // Step 3: Define the left shift loop
    for (i = 1; i <= 7; i++) {
    PORTB = (PORTB << 1); // Hint: Shift the lit LED to the left
   // Step 4: Delay for smoother animation
        Delay_ms(100); // Hint: Delay for smoother animation
    }
   // Step 5: Define the right shift loop
    for (i = 7; i >= 1; i--) {
        PORTB = (PORTB >> 1 ); // Hint: Shift the lit LED to the right
   // Step 6: Delay for smoother animation
        Delay_ms(100);
    }
}
void main() {
    CMCON = 0x07; // Hint: Disable comparators
    TRISA = 0xff; // Hint: Set all PORTA pins as digital I/O
    while (1) // Hint: Enter a condition for the infinite loop
    knightrider(); // Call the knightrider function
    }
