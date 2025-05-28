void main() {
    int i = 0;


    TRISB = 0b11000011;
    PORTB = 0b00000000;


    while(1) {
             if(PORTB.RB0==1 && PORTB.RB1==1){
                     PORTB.RB2 = 0;
                     PORTB.RB3 = 0;
                     PORTB.RB4 = 0;
                     PORTB.RB5 = 0;
                     PORTB.RB7 = 0;
             }
             
             else if(PORTB.RB0 == 1){
                        for(i = 0; i < 10; i++) {
                              PORTB.RB2 = 1; // Buzzer ON
                              PORTB.RB5 = 1 ;
                              Delay_ms(200); // Beep duration
                              PORTB.RB2 = 0; // Buzzer OFF
                              PORTB.RB5 = 0 ;
                              Delay_ms(100); // Wait for the remainder of the second
                        }
                        
                        PORTB.RB2 = 1;
                        PORTB.RB5 = 1 ;
                        Delay_ms(1000);
                        PORTB.RB2 = 0;
                        PORTB.RB5 = 0 ;
                        PORTB.RB7 = 1;
             }
             
             else if(PORTB.RB1 == 1){
                        for(i = 0; i < 9; i++) {
                              PORTB.RB3 = 1; // Buzzer ON
                              PORTB.RB4 = 1 ;
                              Delay_ms(200); // Beep duration
                              PORTB.RB3 = 0; // Buzzer OFF
                              PORTB.RB4 = 0;
                              Delay_ms(100); // Wait for the remainder of the second
                        }

                        PORTB.RB3 = 1;
                        PORTB.RB4 = 1;
                        Delay_ms(1000);
                        PORTB.RB3 = 0;
                        PORTB.RB4 = 0;
                        PORTB.RB7 = 1;
             }
             
             else{
                     PORTB.RB2 = 0;
                     PORTB.RB3 = 0;
                     PORTB.RB4 = 0;
                     PORTB.RB5 = 0;
                     PORTB.RB7 = 0;
             }


    }
}