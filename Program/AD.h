#ifndef	_AD_H_
#define	_AD_H_

#include "my_configuration.h"
/*******************************************************
*******************************************************/
#define  C_NTC_ADCH			6				 //ADͨ��


#define  C_NtcAD_Open		0x01				//NTC��·
#define  C_NtcAD_Duan		1000			//NTC��·
#define  C_NtcAD_High		0x300	//100	//NTC����


//AD
volatile unsigned char  AdResult_8bit;   //8λAD���
volatile unsigned short   AdResult_12bit;  //10λAD���
volatile signed char    Temperature_Dat=50;	//�¶ȴ���

volatile  bit	Flag_RT_Open;
volatile  bit	Flag_RT_Short;
volatile  bit	Flag_RT_High;

volatile bit Flag_Ntc_OneAd;  //AD������1��

unsigned char BreakTimeOut;//��ʱ����

/*******************************************************
*******************************************************/
extern unsigned char AD_Sample(unsigned char adch);
void NtcAD_Testing(unsigned char i);

void DealTmpr();
#endif