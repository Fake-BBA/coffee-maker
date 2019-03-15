#ifndef	_AD_H_
#define	_AD_H_

#include "my_configuration.h"
/*******************************************************
*******************************************************/
#define  C_NTC_ADCH			6				 //AD通道


#define  C_NtcAD_Open		0x01				//NTC开路
#define  C_NtcAD_Duan		1000			//NTC短路
#define  C_NtcAD_High		0x300	//100	//NTC超温


//AD
volatile unsigned char  AdResult_8bit;   //8位AD结果
volatile unsigned short   AdResult_12bit;  //10位AD结果
volatile signed char    Temperature_Dat=50;	//温度储存

volatile  bit	Flag_RT_Open;
volatile  bit	Flag_RT_Short;
volatile  bit	Flag_RT_High;

volatile bit Flag_Ntc_OneAd;  //AD检测完成1次

unsigned char BreakTimeOut;//超时处理

/*******************************************************
*******************************************************/
extern unsigned char AD_Sample(unsigned char adch);
void NtcAD_Testing(unsigned char i);

void DealTmpr();
#endif