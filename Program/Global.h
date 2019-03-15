#ifndef _GLOBAL_H_
#define _GLOBAL_H_

#include "LCD.h"
volatile unsigned char Temp_595[3]={0x00,0x00,0x00};

volatile unsigned char display[5];
volatile unsigned char Display_Temp[5];
volatile unsigned char com_count=0;

unsigned short	IntCk=0;		//2ms
unsigned short	ms=0;			//∫¡√Î
unsigned short	sec=0;			//√Î
unsigned short	min=0;			//∑÷÷”
unsigned short	hours=0;		//–° ±


#endif