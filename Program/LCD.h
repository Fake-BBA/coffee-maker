#ifndef _LCD_H_
#define _LCD_H_

#include "my_configuration.h"


#define P_COM1	RC2
#define P_COM2	RC3
#define P_COM3	RC4
#define P_COM4	RC5

#define	SEG1_SET()	Temp_595[SEG0_8]|=1<<7
#define	SEG2_SET()	Temp_595[SEG0_8]|=1<<6
#define	SEG3_SET()	Temp_595[SEG0_8]|=1<<0
#define	SEG4_SET()	Temp_595[SEG0_8]|=1<<1
#define	SEG5_SET()	Temp_595[SEG0_8]|=1<<2
#define	SEG6_SET()	Temp_595[SEG0_8]|=1<<5
#define	SEG7_SET()	Temp_595[SEG0_8]|=1<<4
#define	SEG8_SET()	Temp_595[SEG0_8]|=1<<3

#define SEG1_CLR()	Temp_595[SEG0_8] &=~(1<<7)
#define SEG2_CLR()	Temp_595[SEG0_8] &=~(1<<6)
#define SEG3_CLR()	Temp_595[SEG0_8] &=~(1<<0)
#define SEG4_CLR()	Temp_595[SEG0_8] &=~(1<<1)
#define SEG5_CLR()	Temp_595[SEG0_8] &=~(1<<2)
#define SEG6_CLR()	Temp_595[SEG0_8] &=~(1<<5)
#define SEG7_CLR()	Temp_595[SEG0_8] &=~(1<<4)
#define SEG8_CLR()	Temp_595[SEG0_8] &=~(1<<3)



//数码管显示
#define	SMG1_DATA	display[0]
#define	SMG2_DATA	display[1]  
#define	SMG3_DATA	display[2]
#define	SMG4_DATA	display[3]
#define	ICO			display[4]

//LCD数码管显示表格：abcdefg
#define A 0B00000001
#define B 0B00000010
#define C 0B00000100
#define D 0B00001000
#define E 0B00010000
#define F 0B00100000
#define G 0B01000000
//#define N 0B10000000

const unsigned char LCDCode[]=
{
	A|B|C|D|E|F,		// 0
	B|C,				// 1
	A|B|G|E|D,			// 2
	A|B|G|C|D,			// 3
	F|G|B|C,			// 4
	A|F|G|C|D,			// 5
	A|F|E|D|C|G,		// 6
	A|B|C,				// 7
	A|B|C|D|E|F|G,		// 8
	A|B|C|D|F|G,		// 9
	0x00,				//清空
	A|F|E|D|G,			//E
	A|D|E|F				//C
	//A|B|G|F|E|N			//R
};

#define ICO_TEMP 	0X01
#define ICO_TIMER	0X02
#define ICO_AUTO	0X04
#define ICO_COL		0X08

/*#define ICO_TEMP_SET()		SEG1_SET()
#define ICO_TIMER_SET()		SEG3_SET()
#define ICO_AUTO_SET()		SEG5_SET()
#define	ICO_COL_SET()		SEG7_SET()

#define ICO_TEMP_CLR()		SEG1_CLR()
#define ICO_TIMER_CLR()		SEG3_CLR()
#define ICO_AUTO_CLR()		SEG5_CLR()

#define	ICO_COL_CLR()		SEG7_CLR()
*/

#define ICO_TEMP_ON()		display[4]|=1<<0
#define ICO_TIMER_ON()		display[4]|=1<<1
#define ICO_AUTO_ON()		display[4]|=1<<2
#define	ICO_COL_ON()		display[4]|=1<<3

#define ICO_TEMP_OFF()		display[4]&=~(1<<0)
#define ICO_TIMER_OFF()		display[4]&=~(1<<1)
#define ICO_AUTO_OFF()		display[4]&=~(1<<2)
#define	ICO_COL_OFF()		display[4]&=~(1<<3)

void Cheak_LCD();
void Set_Disp();
void Hex_To_Bcd(unsigned short data,char list);
void Hex_To_Temp(signed char data);	
#endif