#line 1 "D:/(D) Documents/Lessons/Year 03 Sem 01/BECS 31421 – Microcontrollers and Embedded Electronics Laboratory/Laboratory 09 Exercise/EX_02/ex_02.c"
const unsigned char numbers[10] = {0x3F, 0x06, 0x5B, 0x4F, 0x66,
 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

int stop = 0;
int count = 0;
int max_limit = 3;

void main(){
 TRISA = 0b00000001;
 TRISB = 0b10000000;
 PORTA = 0x00;
 PORTB = 0x00;

 while(1){
 if(PORTB.RB7 == 1 && stop == 0){
 count++;
 if(count > max_limit){
 count = 0;
 max_limit++;
 if(max_limit > 5){
 max_limit = 3;
 }
 }
 PORTB = numbers[count];
 stop = 1;
 Delay_ms(100);
 }
 else if(PORTB.RB7 == 0){
 stop = 0;
 }
 }
}
