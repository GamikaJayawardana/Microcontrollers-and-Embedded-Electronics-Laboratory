#line 1 "D:/(D) Documents/Lessons/Year 03 Sem 01/BECS 31421 – Microcontrollers and Embedded Electronics Laboratory/Laboratary 02/Lab_02.c"

sbit sw at RA2_bit;


void main() {

 CMCON = 0x07 ;
 TRISA = 0x04 ;
 TRISB = 0x00 ;
 PORTB =0xff ;
 RA2_bit = 0x00 ;


 do {

 if(sw == 1 ) {

 PORTB = 0x00 ;
 }
 else {

 PORTB = 0xff ;
 }
 } while(1);
}
