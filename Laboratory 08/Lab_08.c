// Step 1: Declare the main function
void main() {

    // Step 2: Configuration settings: output and initialization
    CMCON = 0x07;       // Disable comparators (set all to digital)
    TRISB = 0x00;       // Set all port B pins as output
    PORTB = 0x00;       // Initialize PORTB to 0

    // Step 3: PWM initialization and start
    PWM1_Init(5000);    // Initialize PWM1 module with the frequency of 5kHz
    PWM1_Start();       // Start the PWM1 module operation

    // Step 4: Define the infinite loop
    while(1) {          // Infinite loop

        // Step 5: PWM duty cycle variation
        unsigned short duty_cycle;  // Declare an unsigned short variable ‘duty_cycle’

        // Step 5.1: Increasing duty cycle loop
        for (duty_cycle = 0; duty_cycle <= 255; duty_cycle += 5) {
            PWM1_Set_Duty(duty_cycle);  // Set the duty cycle
            Delay_ms(50);               // Delay to observe the change in LED brightness
        }

        // Step 5.2: Decreasing duty cycle loop
        for (duty_cycle = 255; duty_cycle >= 5; duty_cycle -= 5) {
            PWM1_Set_Duty(duty_cycle);  // Set the duty cycle
            Delay_ms(50);               // Delay to observe the change in LED brightness
        }
    }
}
