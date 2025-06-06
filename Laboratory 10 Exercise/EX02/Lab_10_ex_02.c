sbit sw1 at RB0_bit;
int state = 0;        // Initialize relay state as OFF
int last_state = 1;   // Initialize button state as not pressed (active low)

void main() {
    TRISB = 0x01;     // Set RB0 as input (1), RB1 as output (0)
    PORTB = 0x00;     // Initialize PORTB to all zeros

    while (1) {
        if (sw1 == 1 ) {  // Detect button press (falling edge)
           delay_ms(50) ;
           RB2_bit=1 ;
           if ( sw1==1){
            last_state = 0;     // Button is now pressed
            state = !state;     // Toggle relay state (0?1 or 1?0)
            RB1_bit = state;    // Output state to RB1 (relay control)
            delay_ms(50);
        } }
        else if (sw1 == 0){
            RB2_bit=0 ;
            }

    }
}
