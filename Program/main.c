#include "my_configuration.h"

volatile unsigned char MainTime;
volatile bit	B_MainLoop;

unsigned short icount=0;

bit bool_col;

void DelayX(unsigned int i)
{
	//unsigned j=0;
	while(i--) {asm("nop");}
}
//ϵͳ��ʼ��
void Init_System()
{
	asm("nop");
	INTCON = 0;				//��ֹ�ж�
	OSCCON = 0X71;			//������Ϊ8M
	OPTION_REG = 0;
	//��ʱ�ȴ���Դ��ѹ�ȶ�
	
	//RB1������,RE3,RC6��HC595����,RC0-��PTC,RC1-HC595ʱ�ӣ�RE1-NTC,RE2-��ŷ�
	TRISE = 0B11110011;
	TRISB = 0B11111111;
	TRISC = 0B10111100;
	//RA0-RA5,RB2-RB7//���ݰ���,RA6-�ײ�NTC RA7-���
	TRISA = 0B00111111;		
	//PIE2 = 0;
	
	//Bit7 δ�ã���Ϊ0,Bit6 ADIE��A/Dת������ADC���ж�����λ,1=����ADC�ж�,0=��ֹADC�ж�
	//Bit5-4 δ�ã���Ϊ0,Bit3 SSPIE����ͬ�����ж˿ڣ�MSSP���ж�����λ
	//1=����MSSP�ж�,0=��ֹMSSP�ж�,Bit2 CCP1IE��CCP1�ж�����λ,1=����CCP1�ж�
	//0=��ֹCCP1�ж�,Bit1 TMR2IE��TIMER2��PR2ƥ���ж�����λ,1=����TMR2��PR2ƥ���ж�
	//0=��ֹTMR2��PR2ƥ���ж�,Bit0 TMR1IE��TIMER1����ж�����λ
	//1=����TIMER1����ж�,0=��ֹTIMER1����ж�
	PIE1 = 2;				//����TIME2ƥ���ж�
	PR2 = 250;				//8/16M�½�TMR2����Ϊ2ms�ж�
	T2CON = 6;				//ʹ�ܶ�ʱ��2, 16��Ƶ
	//INTCON = 0XC0;			//ʹ���ж�
	
	HOT_BOTTOM_OFF();
	HOT_MAJOR_OFF();
	BEEP_OFF();
	MOTOR_OFF();
	Temp_595[LED_1_6]=0XFF;
	Temp_595[LED_7_12]=0XFF;
	Temp_595[2]=0XFF;
	HOT_BOTTOM_ON();		//����ADC����������
	//Set_Disp();
	_74HC595_SET(); 	//ִ��595����������
	SOLENOID_OFF();	
	DelayX(1000);
	
	//˯���뻽�����
	IOCB=0x02;		//����PB1������ƽ�仯�ж�
	OPTION_REG&=~(1<<7);
	INTCON = 0B11001000;	//��ȫ���жϣ��������жϣ�����PB�ڵ�ƽ�仯�ж�
	
	WPUB=0B00000010;	//ʹ��PB1����
	
	WDTCON=0; 					//���ʹ�ܿ��Ź�
}


/***********************************************************
��������
***********************************************************/
void KeyServer()
{
	static unsigned int KeyOldFlag = 0;
	unsigned int i = (KeyFlag[1]<<8) | KeyFlag[0];
	Add=0;
	Reduce=0;
	if(LED6_On_Times>=ADD_REDUCE_LED_TIME) LED6_State=LED_OFF;
	
	if(LED5_On_Times>=ADD_REDUCE_LED_TIME) LED5_State=LED_OFF;

	
	if(i)
	{
		if(i==KEY_ADD)
		{
			if(Key_ON_Times++>KEY_ON_TIMES)
			{
				Key_Add_3S_ON=1;
				//Rbeep=1;
				Key_ON_Times=KEY_ON_TIMES;
			}
		}
		else
		if(i==KEY_REDUCE)
		{
			if(Key_ON_Times++>KEY_ON_TIMES)
			{
				Key_Reduce_3S_ON=1;
				Key_ON_Times=KEY_ON_TIMES;
				//Rbeep=1;
			}
		}
		else
		Key_ON_Times=0;
		//else Key_Add_3S_ON=0;
		if(i != KeyOldFlag)
		{
			KeyOldFlag = i;

			switch(i)
			{
				case KEY_REGULAR: 		//KEY_REGULAR
					if(Key_Regular_Lock) break;
					Regular=1;
					Bold=0;
					Iced=0;
					Tea=0;
					
					Rbeep=1;	//�������̽�һ��
					break;
					
				case KEY_BOLD:			//KEY_BOLD
					if(Key_Bold_Lock) break;
					Regular=0;
					Bold=1;
					Iced=0;
					Tea=0;
					
					Rbeep=1;	//�������̽�һ��
					break;
					
				case KEY_ICED:
					if(Key_Iced_Lock) break;
					Regular=0;
					Bold=0;
					Iced=1;
					Tea=0;
					
					Rbeep=1;	//�������̽�һ��
					break;
					
				case KEY_TEA:
					if(Key_Tea_Lock) break;
					Regular=0;
					Bold=0;
					Iced=0;
					Tea=1;
					
					Rbeep=1;	//�������̽�һ��
					break;
					
				case KEY_ADD:
					if(Key_Add_Lock) break;
					Add=1;
					LED5_State=LED_ON_TIME;
					LED5_On_Times=0;
					LED6_State=LED_OFF;
					//LED5_Flash_Times=1;
					Rbeep=1;	//�������̽�һ��
					break;
					
				case KEY_REDUCE:
					if(Key_Reduce_Lock) break;
					Reduce=1;
					LED5_State=LED_OFF;
					LED6_State=LED_ON_TIME;
					LED6_On_Times=0;
					Rbeep=1;	//�������̽�һ��
					break;
					
				case KEY_80_Z:
					if(Key_80_Z_Lock) break;
					_80_z=1;
					_120_z=0;
					_210_z=0;
					_420_z=0;
					
					
					Rbeep=1;	//�������̽�һ��
					break;
					
				case KEY_120_Z:
					if(Key_120_Z_Lock) break;
					_80_z=0;
					_120_z=1;
					_210_z=0;
					_420_z=0;
					
					Rbeep=1;	//�������̽�һ��
					break;
					
				case KEY_210_Z:
					if(Key_210_Z_Lock) break;
					_80_z=0;
					_120_z=0;
					_210_z=1;
					_420_z=0;
					
					Rbeep=1;	//�������̽�һ��
					break;
					
				case KEY_420_Z:
					if(Key_420_Z_Lock) break;
					_80_z=0;
					_120_z=0;
					_210_z=0;
					_420_z=1;
					
					Rbeep=1;	//�������̽�һ��
					break;
					
				case KEY_OPTION:
					if(Key_Option_Lock) break;
					Option++;
					if(Option>=4)	Option=1;
					
					Rbeep=1;	//�������̽�һ��
					break;
					
				case KEY_START:
					if(Key_Start_Lock) break;
					
					Start=1;
					
					Rbeep=1;	//�������̽�һ��
					break;
					
			}
		}
	}
	else
	{
		KeyOldFlag = 0;
		Key_ON_Times=0;
	}
}

/***********************************************************
�жϷ�����
***********************************************************/
void interrupt Isr_Timer()
{
	if(TMR2IF)				//��ֻʹ����һ���ж�Դ,������ȥ�ж�
	{
		TMR2IF = 0;	
		//if(!No_AC)
		{
			Set_Disp();	
		}
			
		if(++MainTime>=2)
		{
			MainTime=0;
			B_MainLoop = 1;			
		}
		
	}
	else
	{
		PIR1 = 0;
	//	PIR2 = 0;
	}
	if(RBIF)
	{
		//INTCON = 0B11000000;			//ʹ���ж�
		RBIF=0;
	}
}

/***********************************************************
��ѭ��
***********************************************************/
void main()
{
	Init_System();
	//Cheak_LCD();
	_74HC595_SET(); 	//ִ��595����������
	No_AC=0;
	//TRISC &= ~(0x3C);
	//TRISC = 0B00111000;
	//RC2=0;
	//RC3=0;
	//RC4=0;
	//RC5=0;
	
	//COMSEL=
	LCDCON0=0B10110000;
	LCDADD =0B01100000;
	//COMEN  =0B00111000;
	//TRISC |=0B00111100;
	//LCDCON1=0;
	//while(1);
	while(1)
	{	
		if(B_MainLoop)
		{
			B_MainLoop = 0;					
			CLRWDT();						
			AcTestZero();		//������
			/*if(++icount>=1000)
			{
				No_AC=!No_AC;
				icount=0;
			}*/
			if(No_AC)
			{
				ShutDowm_Device();
				continue;			
			}
			CheckTouchKey();	//���ݰ���ɨ��
			KeyServer();		//��������
			Pattern();			//ģʽ����
			LCD_FState();		//LCD״̬����
			CheckBuzzer();		//������״̬
			LED_State();		//
			Solenoid_State_F();
			HOT_MAJOR_State_F();
			
			NtcAD_Testing(C_NTC_ADCH);//AD
		}
	}
}