#line 1 "D:/(D) Documents/Lessons/Year 03 Sem 01/BECS 31421 – Microcontrollers and Embedded Electronics Laboratory/Laboratory 08/Lab_08.c"

void main() {


 CMCON = 0x07;
 TRISB = 0x00;
 PORTB = 0x00;


 PWM1_Init(5000);
 PWM1_Start();


 while(1) {


 unsigned short duty_cycle;


 for (duty_cycle = 0; duty_cycle <= 255; duty_cycle += 5) {
 PWM1_Set_Duty(duty_cycle);
 Delay_ms(50);
 }


 for (duty_cycle = 255; duty_cycle >= 5; duty_cycle -= 5) {
 PWM1_Set_Duty(duty_cycle);
 Delay_ms(50);
 }
 }
}
