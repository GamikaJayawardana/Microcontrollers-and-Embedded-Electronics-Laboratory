#line 1 "D:/(D) Documents/Lessons/Year 03 Sem 01/BECS 31421 – Microcontrollers and Embedded Electronics Laboratory/Laboratory 10 Exercise/EX02/Lab_10_ex_02.c"
sbit sw1 at RB0_bit;
int state = 0;
int last_state = 1;

void main() {
 TRISB = 0x01;
 PORTB = 0x00;

 while (1) {
 if (sw1 == 1 ) {
 delay_ms(50) ;
 RB2_bit=1 ;
 if ( sw1==1){
 last_state = 0;
 state = !state;
 RB1_bit = state;
 delay_ms(50);
 } }
 else if (sw1 == 0){
 RB2_bit=0 ;
 }

 }
}
