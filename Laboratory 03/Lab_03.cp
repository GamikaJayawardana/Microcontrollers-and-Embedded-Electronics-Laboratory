#line 1 "D:/(D) Documents/Lessons/Year 03 Sem 01/BECS 31421 – Microcontrollers and Embedded Electronics Laboratory/Laboratory 03/Lab_03.c"
void knightrider(void) {
 int i;

 TRISB = 0x00;

 PORTB = 0x01;

 for (i = 1; i <= 7; i++) {
 PORTB = (PORTB << 1);

 Delay_ms(100);
 }

 for (i = 7; i >= 1; i--) {
 PORTB = (PORTB >> 1 );

 Delay_ms(100);
 }
}
void main() {
 CMCON = 0x07;
 TRISA = 0xff;
 while (1)
 knightrider();
 }
