#line 1 "D:/(D) Documents/Lessons/Year 03 Sem 01/BECS 31421 – Microcontrollers and Embedded Electronics Laboratory/Laboratory 08 Exercise/MyProject.c"
sbit sw1 at RA1_bit;
sbit sw2 at RA2_bit;

void main() {
 unsigned short duty_cycle = 0;
 unsigned short duty_value = 0;


 CMCON = 0x07;
 TRISB = 0x00;
 PORTB = 0x00;

 TRISA = 0x06;
 PORTA = 0x00;

 PWM1_Init(5000);
 PWM1_Start();

 while(1) {

 if (sw1 == 1) {
 if (duty_cycle < 100) {
 duty_cycle += 10;
 }
 }


 if (sw2 == 1) {
 if (duty_cycle >= 10) {
 duty_cycle -= 10;
 }
 }


 duty_value = (unsigned short)((duty_cycle * 255) / 100);
 PWM1_Set_Duty(duty_value);


 Delay_ms(50);
 }
}
