#line 1 "D:/(D) Documents/Lessons/Year 03 Sem 01/BECS 31421 – Microcontrollers and Embedded Electronics Laboratory/Laboratory 03/Exercise/02/Lab_03_EX_02.c"
void knightrider(void) {
 int i;


 TRISB = 0b00000000;


 PORTB = 0b00011000;


 for (i = 0; i < 3; i++) {
 PORTB = (PORTB << 1) | (PORTB >> 1);
 Delay_ms(100);
 }


 for (i = 0; i < 3; i++) {
 PORTB = (PORTB >> 1) & (PORTB << 1);
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
