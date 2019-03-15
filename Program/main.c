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
//系统初始化
void Init_System()
{
	asm("nop");
	INTCON = 0;				//禁止中断
	OSCCON = 0X71;			//配置振荡为8M
	OPTION_REG = 0;
	//延时等待电源电压稳定
	
	//RB1过零检测,RE3,RC6，HC595驱动,RC0-主PTC,RC1-HC595时钟，RE1-NTC,RE2-电磁阀
	TRISE = 0B11110011;
	TRISB = 0B11111111;
	TRISC = 0B10111100;
	//RA0-RA5,RB2-RB7//电容按键,RA6-底部NTC RA7-电机
	TRISA = 0B00111111;		
	//PIE2 = 0;
	
	//Bit7 未用，读为0,Bit6 ADIE：A/D转换器（ADC）中断允许位,1=允许ADC中断,0=禁止ADC中断
	//Bit5-4 未用，读为0,Bit3 SSPIE：主同步串行端口（MSSP）中断允许位
	//1=允许MSSP中断,0=禁止MSSP中断,Bit2 CCP1IE：CCP1中断允许位,1=允许CCP1中断
	//0=禁止CCP1中断,Bit1 TMR2IE：TIMER2与PR2匹配中断允许位,1=允许TMR2与PR2匹配中断
	//0=禁止TMR2与PR2匹配中断,Bit0 TMR1IE：TIMER1溢出中断允许位
	//1=允许TIMER1溢出中断,0=禁止TIMER1溢出中断
	PIE1 = 2;				//允许TIME2匹配中断
	PR2 = 250;				//8/16M下将TMR2设置为2ms中断
	T2CON = 6;				//使能定时器2, 16分频
	//INTCON = 0XC0;			//使能中断
	
	HOT_BOTTOM_OFF();
	HOT_MAJOR_OFF();
	BEEP_OFF();
	MOTOR_OFF();
	Temp_595[LED_1_6]=0XFF;
	Temp_595[LED_7_12]=0XFF;
	Temp_595[2]=0XFF;
	HOT_BOTTOM_ON();		//开启ADC检测电流开关
	//Set_Disp();
	_74HC595_SET(); 	//执行595缓冲器数据
	SOLENOID_OFF();	
	DelayX(1000);
	
	//睡眠与唤醒相关
	IOCB=0x02;		//允许PB1发生电平变化中断
	OPTION_REG&=~(1<<7);
	INTCON = 0B11001000;	//开全局中断，开外设中断，允许PB口电平变化中断
	
	WPUB=0B00000010;	//使能PB1上拉
	
	WDTCON=0; 					//软件使能看门狗
}


/***********************************************************
键处理函数
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
					
					Rbeep=1;	//蜂鸣器短叫一声
					break;
					
				case KEY_BOLD:			//KEY_BOLD
					if(Key_Bold_Lock) break;
					Regular=0;
					Bold=1;
					Iced=0;
					Tea=0;
					
					Rbeep=1;	//蜂鸣器短叫一声
					break;
					
				case KEY_ICED:
					if(Key_Iced_Lock) break;
					Regular=0;
					Bold=0;
					Iced=1;
					Tea=0;
					
					Rbeep=1;	//蜂鸣器短叫一声
					break;
					
				case KEY_TEA:
					if(Key_Tea_Lock) break;
					Regular=0;
					Bold=0;
					Iced=0;
					Tea=1;
					
					Rbeep=1;	//蜂鸣器短叫一声
					break;
					
				case KEY_ADD:
					if(Key_Add_Lock) break;
					Add=1;
					LED5_State=LED_ON_TIME;
					LED5_On_Times=0;
					LED6_State=LED_OFF;
					//LED5_Flash_Times=1;
					Rbeep=1;	//蜂鸣器短叫一声
					break;
					
				case KEY_REDUCE:
					if(Key_Reduce_Lock) break;
					Reduce=1;
					LED5_State=LED_OFF;
					LED6_State=LED_ON_TIME;
					LED6_On_Times=0;
					Rbeep=1;	//蜂鸣器短叫一声
					break;
					
				case KEY_80_Z:
					if(Key_80_Z_Lock) break;
					_80_z=1;
					_120_z=0;
					_210_z=0;
					_420_z=0;
					
					
					Rbeep=1;	//蜂鸣器短叫一声
					break;
					
				case KEY_120_Z:
					if(Key_120_Z_Lock) break;
					_80_z=0;
					_120_z=1;
					_210_z=0;
					_420_z=0;
					
					Rbeep=1;	//蜂鸣器短叫一声
					break;
					
				case KEY_210_Z:
					if(Key_210_Z_Lock) break;
					_80_z=0;
					_120_z=0;
					_210_z=1;
					_420_z=0;
					
					Rbeep=1;	//蜂鸣器短叫一声
					break;
					
				case KEY_420_Z:
					if(Key_420_Z_Lock) break;
					_80_z=0;
					_120_z=0;
					_210_z=0;
					_420_z=1;
					
					Rbeep=1;	//蜂鸣器短叫一声
					break;
					
				case KEY_OPTION:
					if(Key_Option_Lock) break;
					Option++;
					if(Option>=4)	Option=1;
					
					Rbeep=1;	//蜂鸣器短叫一声
					break;
					
				case KEY_START:
					if(Key_Start_Lock) break;
					
					Start=1;
					
					Rbeep=1;	//蜂鸣器短叫一声
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
中断服务函数
***********************************************************/
void interrupt Isr_Timer()
{
	if(TMR2IF)				//若只使能了一个中断源,可以略去判断
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
		//INTCON = 0B11000000;			//使能中断
		RBIF=0;
	}
}

/***********************************************************
主循环
***********************************************************/
void main()
{
	Init_System();
	//Cheak_LCD();
	_74HC595_SET(); 	//执行595缓冲器数据
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
			AcTestZero();		//过零检测
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
			CheckTouchKey();	//电容按键扫描
			KeyServer();		//按键处理
			Pattern();			//模式控制
			LCD_FState();		//LCD状态控制
			CheckBuzzer();		//蜂鸣器状态
			LED_State();		//
			Solenoid_State_F();
			HOT_MAJOR_State_F();
			
			NtcAD_Testing(C_NTC_ADCH);//AD
		}
	}
}