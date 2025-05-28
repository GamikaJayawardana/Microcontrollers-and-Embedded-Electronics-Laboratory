void knightrider(void) {
    int i;
    TRISB = 0b00000000;

    PORTB = 0b00000001;

    for (i = 0; i <= 3; i++) {
        PORTB = (PORTB << 2);
        Delay_ms(100);
    }

    for (i = 0; i <= 3; i++) {
        PORTB = (PORTB >> 2);
        Delay_ms(100);
    }
}

void main() {
    CMCON = 0b00000111;
    TRISA = 0b00000000;

    while (1) {
        knightrider();
    }
}