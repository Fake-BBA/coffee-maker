#ifndef _LED_H_
#define _LED_H_

#include "my_configuration.h"

#define	LED_1_6	0
#define LED_7_12	1
#define SEG0_8	2

#define BEEP	0
#define	BG_LED	0
#define SHOW_LIGHT 1
#define ANNULUS_LIGHT 1

#define BEEP_ON()	Temp_595[BEEP]|=1<<7
#define BEEP_OFF()	Temp_595[BEEP]&=~(1<<7)

#define BG_LED_ON() Temp_595[BG_LED] |=1<<6
#define BG_LED_OFF() Temp_595[BG_LED]&=~(1<<6)

#define LED1_ON() Temp_595[LED_1_6]&=~(1<<1)
#define LED2_ON() Temp_595[LED_1_6]&=~(1<<0)
#define LED3_ON() Temp_595[LED_1_6]&=~(1<<5)
#define LED4_ON() Temp_595[LED_1_6]&=~(1<<4)
#define LED5_ON() Temp_595[LED_1_6]&=~(1<<3)
#define LED6_ON() Temp_595[LED_1_6]&=~(1<<2)

#define LED1_OFF() Temp_595[LED_1_6]|=1<<1
#define LED2_OFF() Temp_595[LED_1_6]|=1<<0
#define LED3_OFF() Temp_595[LED_1_6]|=1<<5
#define LED4_OFF() Temp_595[LED_1_6]|=1<<4
#define LED5_OFF() Temp_595[LED_1_6]|=1<<3
#define LED6_OFF() Temp_595[LED_1_6]|=1<<2

#define	SHOW_LIGHT_OFF()	Temp_595[SHOW_LIGHT]&=~(1<<7)
#define	SHOW_LIGHT_ON()	Temp_595[SHOW_LIGHT]|=1<<7

#define ANNULUS_LIGHT_OFF()	Temp_595[ANNULUS_LIGHT]&=~(1<<6)
#define ANNULUS_LIGHT_ON()	Temp_595[ANNULUS_LIGHT]|=1<<6

#define LED7_ON() Temp_595[LED_7_12]&=~(1<<5)
#define LED8_ON() Temp_595[LED_7_12]&=~(1<<4)
#define LED9_ON() Temp_595[LED_7_12]&=~(1<<3)
#define LED10_ON() Temp_595[LED_7_12]&=~(1<<2)
#define LED11_ON() Temp_595[LED_7_12]&=~(1<<1)
#define LED12_ON() Temp_595[LED_7_12]&=~(1<<0)



#define LED7_OFF() Temp_595[LED_7_12]|=1<<5
#define LED8_OFF() Temp_595[LED_7_12]|=1<<4
#define LED9_OFF() Temp_595[LED_7_12]|=1<<3
#define LED10_OFF() Temp_595[LED_7_12]|=1<<2
#define LED11_OFF() Temp_595[LED_7_12]|=1<<1
#define LED12_OFF() Temp_595[LED_7_12]|=1<<0

#define _74HC595_DS RE3
#define _74HC595_SH_CP RC1 	 //输入数据时钟
#define _74HC595_ST_CP RC6	//锁存数据时钟

void _74HC595_SET();

#endif