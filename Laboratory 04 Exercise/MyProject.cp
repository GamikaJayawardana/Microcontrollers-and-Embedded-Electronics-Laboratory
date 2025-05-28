#line 1 "D:/(D) Documents/Lessons/Year 03 Sem 01/BECS 31421 – Microcontrollers and Embedded Electronics Laboratory/Laboratory 04 Exercise/MyProject.c"


int a = 50;
int b = 200;
int temp;

void main()
{

 TRISB = 0x01;
 TRISA = 0x00;
 CMCON = 0x07;
 OPTION_REG = 0x00;

 INTCON.GIE = 1;
 INTCON.PEIE = 1;
 INTCON.INTE = 1;




 while (1){

 PORTB.RB2 = 0;
 PORTA.RA0 = 1;
 PORTA.RA1 = 0;
 if (a == 50) delay_ms(50);
 else if (a == 200) delay_ms(200);


 PORTA.RA0 = 0;
 PORTA.RA1 = 1;
 if (a == 50) delay_ms(50);
 else if (a == 200) delay_ms(200);

 INTCON.INTF = 0;
 }
}

void interrupt() {
if (INTCON.INTF) {

 PORTB.RB1 = 1;
 PORTB.RB2 = 0;
 if (b == 50) delay_ms(50);
 else if (b == 200) delay_ms(200);


 PORTB.RB1 = 0;
 PORTB.RB2 = 1;
 if (b == 50) delay_ms(50);
 else if (b == 200) delay_ms(200);



 temp = a;
 a = b;
 b = temp;

 INTCON.INTF = 0;
 }

}
