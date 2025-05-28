#line 1 "D:/(D) Documents/Lessons/Year 03 Sem 01/BECS 31421 – Microcontrollers and Embedded Electronics Laboratory/Laboratory 07/MyProject.c"
void main() {
 int i = 0;


 TRISB = 0b11000011;
 PORTB = 0b00000000;


 while(1) {


 if(PORTB == 0b00000001) {
 PORTB = 0b00010100;
 while(i == 0) {
 if(PORTB.RB6 == 1) {
 PORTB = 0b00000000;
 i = 1;
 }
 }
 i = 0;
 }


 else if(PORTB == 0b00000010) {
 PORTB = 0b00101000;
 while(i == 0) {
 if(PORTB.RB6 == 1) {
 PORTB = 0b00000000;
 i = 1;
 }
 }
 i = 0;
 }
 }
}
