#include "pattern_function.h"

/***********************************************************
函数名称：CheckBuzzer
函数功能：蜂鸣器时间处理程序
入口参数：无
出口参数：无 
备    注：
***********************************************************/
void CheckBuzzer()
{
	if(Rbeep>0)//(Rbeep&0x1F)   0b00011111;
	{
		if(--BuzzerTime<1)
		{
			Buzzer_CFlag=!Buzzer_CFlag;
			if(Buzzer_CFlag)
			{		
				BEEP_ON();
				if(Rbeep&0x01)
				{
					BuzzerTime = BEEP_SHORT;
				}
				else
				{
					BuzzerTime = BEEP_LONG;
				}
			}
			else
			{
				BEEP_OFF();
				BuzzerTime = NO_BEEP;		
				Rbeep-=2;
			}
		}
	}
	else
	{
		BEEP_OFF();
	}
}


void Clean_Time()
{
	IntCk=0;		//125us
	ms=0;			//毫秒
	sec=0;			//秒
	min=0;			//分钟
	hours=0;		//小时
}

void LED_State(void)
{

	switch(BG_LED_State)
	{
		case LED_OFF:
			BG_LED_OFF();
			break;
		case LED_ON: 
			BG_LED_ON();
			break;
			
		case LED_Flash: 
			if(LED_Flash_HZ>=LED_FLASH_HZ)
			{
				if(BG_LED_Flash_Times<UINT8_MAX)
					BG_LED_Flash_Times++;
								
				if(LED_Flash_Bool)
				{
					BG_LED_OFF();
				}
				else
				{
					BG_LED_ON();
				}
			}					
			break;
					
		case LED_ON_TIME:
			BG_LED_ON();
			if(++BG_LED_ON_Times>=LED_ON_TIMES) 
			{
				BG_LED_ON_Times=0;
				if(BG_LED_ON_Time<UINT8_MAX)
				BG_LED_ON_Time++;
				if(BG_LED_ON_Time)
				{
					BG_LED_ON();	
				}
				else
				{
					BG_LED_OFF();
				}
			}
			break;		
	}
	switch(ANNULUS_LIGHT_State)
	{
		case LED_OFF: ANNULUS_LIGHT_OFF();
			break;
		case LED_ON: ANNULUS_LIGHT_ON();
			break;
		case LED_Flash: 
			if(LED_Flash_HZ>=LED_FLASH_HZ)
			{
				if(ANNULUS_LIGHT_Flash_Times<UINT8_MAX)
					ANNULUS_LIGHT_Flash_Times++;
								
				if(LED_Flash_Bool)
				{
					ANNULUS_LIGHT_OFF();
				}
				else
				{
					ANNULUS_LIGHT_ON();
				}
			}					
			break;
		
	}
	switch(SHOW_LIGHT_State)
	{
		case LED_OFF: SHOW_LIGHT_OFF();
			break;
		case LED_ON: SHOW_LIGHT_ON();
			break;
		case LED_Flash: 
			if(LED_Flash_HZ>=LED_FLASH_HZ)
			{
				if(SHOW_LIGHT_Flash_Times<UINT8_MAX)
					SHOW_LIGHT_Flash_Times++;
								
				if(LED_Flash_Bool)
				{
					SHOW_LIGHT_OFF();
				}
				else
				{
					SHOW_LIGHT_ON();
				}
			}					
			break;
		
	}
	switch(LED1_State)
	{
		case LED_OFF: LED1_OFF();
			break;
		case LED_ON: LED1_ON();
			break;
		case LED_Flash: 
			if(LED_Flash_HZ>=LED_FLASH_HZ)
			{
				if(LED1_Flash_Times<UINT8_MAX)
					LED1_Flash_Times++;
								
				if(LED_Flash_Bool)
				{
					LED1_OFF();
				}
				else
				{
					LED1_ON();
				}
			}					
			break;
		
	}
	switch(LED2_State)
	{
		case LED_OFF: LED2_OFF();
			break;
		case LED_ON: LED2_ON();
			break;
		case LED_Flash: if(LED_Flash_HZ>=LED_FLASH_HZ)
						{
							if(LED2_Flash_Times<UINT8_MAX)
								LED2_Flash_Times++;
								
							if(LED_Flash_Bool)
							{
								LED2_OFF();
							}
							else
							{
								LED2_ON();
							}
						}
			break;
	}
	switch(LED3_State)
	{
		case LED_OFF: LED3_OFF();
			break;
		case LED_ON: LED3_ON();
			break;
		case LED_Flash: if(LED_Flash_HZ>=LED_FLASH_HZ)
						{
							if(LED3_Flash_Times<UINT8_MAX)
								LED3_Flash_Times++;
								
							if(LED_Flash_Bool)
							{
								LED3_OFF();
							}
							else
							{
								LED3_ON();
							}
						}
			break;
	}
	switch(LED4_State)
	{
		case LED_OFF: LED4_OFF();
			break;
		case LED_ON: LED4_ON();
			break;
		case LED_Flash: if(LED_Flash_HZ>=LED_FLASH_HZ)
						{
							if(LED4_Flash_Times<UINT8_MAX)
								LED4_Flash_Times++;
								
							if(LED_Flash_Bool)
							{
								LED4_OFF();
							}
							else
							{
								LED4_ON();
							}
						}
			break;
	}
	switch(LED5_State)
	{
		case LED_OFF: LED5_OFF();
			break;
		case LED_ON: LED5_ON();
			break;
		case LED_Flash:if(LED_Flash_HZ>=LED_FLASH_HZ)
						{
							if(LED5_Flash_Times<UINT8_MAX)
								LED5_Flash_Times++;
								
							if(LED_Flash_Bool)
							{
								LED5_OFF();
							}
							else
							{
								LED5_ON();
							}
						}
			break;
		case LED_ON_TIME:
						LED5_ON();
						if(LED5_On_Times<UINT16_MAX) 
							LED5_On_Times++;
				
			break;
	}
	switch(LED6_State)
	{
		case LED_OFF: LED6_OFF();
			break;
		case LED_ON: LED6_ON();
			break;
		case LED_Flash: if(LED_Flash_HZ>=LED_FLASH_HZ)
						{
							if(LED6_Flash_Times<UINT8_MAX)
								LED6_Flash_Times++;
								
							if(LED_Flash_Bool)
							{
								LED6_OFF();
							}
							else
							{
								LED6_ON();
							}
						}
			break;
		case LED_ON_TIME:
						LED6_ON();
						if(LED6_On_Times<UINT16_MAX) 
						{
							LED6_On_Times++;
				
						}
			break;
	}
	switch(LED7_State)
	{
		case LED_OFF: LED7_OFF();
			break;
		case LED_ON: LED7_ON();
			break;
		case LED_Flash: if(LED_Flash_HZ>=LED_FLASH_HZ)
						{
							if(LED7_Flash_Times<UINT8_MAX)
								LED7_Flash_Times++;
								
							if(LED_Flash_Bool)
							{
								LED7_OFF();
							}
							else
							{
								LED7_ON();
							}
						}
			break;
	}
	switch(LED8_State)
	{
		case LED_OFF: LED8_OFF();
			break;
		case LED_ON: LED8_ON();
			break;
		case LED_Flash: if(LED_Flash_HZ>=LED_FLASH_HZ)
						{
							if(LED8_Flash_Times<UINT8_MAX)
								LED8_Flash_Times++;
								
							if(LED_Flash_Bool)
							{
								LED8_OFF();
							}
							else
							{
								LED8_ON();
							}
						}
			break;
	}
	switch(LED9_State)
	{
		case LED_OFF: LED9_OFF();
			break;
		case LED_ON: LED9_ON();
			break;
		case LED_Flash: if(LED_Flash_HZ>=LED_FLASH_HZ)
						{
							if(LED9_Flash_Times<UINT8_MAX)
								LED9_Flash_Times++;
								
							if(LED_Flash_Bool)
							{
								LED9_OFF();
							}
							else
							{
								LED9_ON();
							}
						}
			break;
	}
	switch(LED10_State)
	{
		case LED_OFF: LED10_OFF();
			break;
		case LED_ON: LED10_ON();
			break;
		case LED_Flash: if(LED_Flash_HZ>=LED_FLASH_HZ)
						{
							if(LED10_Flash_Times<UINT8_MAX)
								LED10_Flash_Times++;
								
							if(LED_Flash_Bool)
							{
								LED10_OFF();
							}
							else
							{
								LED10_ON();
							}
						}
			break;
	}
	switch(LED11_State)
	{
		case LED_OFF: LED11_OFF();
			break;
		case LED_ON: LED11_ON();
			break;
		case LED_Flash: if(LED_Flash_HZ>=LED_FLASH_HZ)
						{
							if(LED11_Flash_Times<UINT8_MAX)
								LED11_Flash_Times++;
								
							if(LED_Flash_Bool)
							{
								LED11_OFF();
							}
							else
							{
								LED11_ON();
							}
						}
			break;
	}
	switch(LED12_State)
	{
		case LED_OFF: LED12_OFF();
			break;
		case LED_ON: LED12_ON();
			break;
		case LED_Flash: if(LED_Flash_HZ>=LED_FLASH_HZ)
						{
							if(LED12_Flash_Times<UINT8_MAX)
								LED12_Flash_Times++;
								
							if(LED_Flash_Bool)
							{
								LED12_OFF();
							}
							else
							{
								LED12_ON();
							}
						}
			break;
	}
	if(LED_Flash_HZ++>=LED_FLASH_HZ)
	{
		LED_Flash_HZ=0;
		LED_Flash_Bool=!LED_Flash_Bool;
	}
	
}


void LCD_FState()
{
	switch(LCD_State)
	{
		/*case LCD_CLEAR:
			display[0]=0X00;
			display[1]=0X00;
			display[2]=0X00;
			display[3]=0X00;
			display[4]=0x00;
			break;	
		case LCD_FULL:
			display[0]=0XFF;
			display[1]=0XFF;
			display[2]=0XFF;
			display[3]=0XFF;
			display[4]=0xFF;
			break;
			*/
		case LCD_NORMAL:
			break;
		
		case LCD_FLASH:
			if(++LCD_Flash_HZ>=LCD_FLASH_HZ)
			{
					LCD_Flash_HZ=0;
					if(LCD_HOUR_Flash_Times<UINT8_MAX)
					{
						LCD_HOUR_Flash_Times++;
						
						if(LCD_Flash_Bool)
						{
							display[0]=0X00;
							display[1]=0X00;
						}
						else
						{
							display[0]=Display_Temp[0];
							display[1]=Display_Temp[1];
						}
					}
					
				if(LCD_MINUTE_Flash_Times<UINT8_MAX)
				{
					LCD_MINUTE_Flash_Times++;
					
					if(LCD_Flash_Bool)
					{
						display[2]=0X00;
						display[3]=0X00;
						
					}
					else
					{
						display[2]=Display_Temp[2];
						display[3]=Display_Temp[3];
					}	
				}
					
				if(LCD_COL_Flash_Times<UINT8_MAX)
				{	
					LCD_COL_Flash_Times++;
					if(LCD_Flash_Bool)
					{
						ICO_COL_OFF();
					}
					else
					{
						ICO_COL_ON();
					}
				}
					
				if(LCD_TEMP_Flash_Times<UINT8_MAX)
				{	
					LCD_TEMP_Flash_Times++;
					
					if(LCD_Flash_Bool)
					{
						ICO_TEMP_OFF();
						
					}
					else
					{
						ICO_TEMP_ON();					
					}
				}
					
				if(LCD_TIMER_Flash_Times<UINT8_MAX)
				{	
					LCD_TIMER_Flash_Times++;
					
					if(LCD_Flash_Bool)
					{
						ICO_TIMER_OFF();
						
					}
					else
					{
						ICO_TIMER_ON();
					}
				}
					
				if(LCD_AUTO_Flash_Times<UINT8_MAX)
				{	
					LCD_AUTO_Flash_Times++;
					
					if(LCD_Flash_Bool)
					{
						ICO_AUTO_OFF();
					}
					else
					{
						ICO_AUTO_ON();
					}
				}
				
				LCD_Flash_Bool=!LCD_Flash_Bool;
			}
			break;	
	}
}

void HOT_BOTTOM_State_F()
{
	switch(HOT_BOTTOM_State)
	{
		case STATE_HOT_BOTTOM_OFF:
			HOT_BOTTOM_OFF();
			break;
		case STATE_HOT_BOTTOM_ON:
			HOT_BOTTOM_ON();
			break;
		case STATE_HOT_BOTTOM_ON_TIME:
			HOT_BOTTOM_ON();		
			if(++HOT_BOTTOM_ON_Times>=HOT_BOTTOM_ON_TIMES)
			{
				HOT_BOTTOM_ON_Times=0;
				if(HOT_BOTTOM_ON_Time<UINT8_MAX)
					HOT_BOTTOM_ON_Time++;
			}
			HOT_BOTTOM_OFF_Time=0;
			break;
		
		case STATE_HOT_BOTTOM_OFF_TIME:
			HOT_BOTTOM_OFF();		
			if(++HOT_BOTTOM_OFF_Times>=HOT_BOTTOM_OFF_TIMES)
			{
				HOT_BOTTOM_OFF_Times=0;
				if(HOT_BOTTOM_OFF_Time<UINT8_MAX)
					HOT_BOTTOM_OFF_Time++;
			}
			HOT_BOTTOM_ON_Time=0;
			break;
		
	}
	
}
void HOT_MAJOR_State_F()
{
	switch(HOT_MAJOR_State)
	{
		case STATE_HOT_MAJOR_OFF:
			HOT_MAJOR_OFF();
			break;
		case STATE_HOT_MAJOR_ON:
			HOT_MAJOR_ON();
			break;
		case STATE_HOT_MAJOR_ON_TIME:
			HOT_MAJOR_ON();		
			if(++HOT_MAJOR_ON_Times>=HOT_MAJOR_ON_TIMES)
			{
				HOT_MAJOR_ON_Times=0;
				if(HOT_MAJOR_ON_Time<UINT8_MAX)
					HOT_MAJOR_ON_Time++;
			}
			HOT_MAJOR_OFF_Time=0;
			break;
		
		case STATE_HOT_MAJOR_OFF_TIME:
			HOT_MAJOR_OFF();		
			if(++HOT_MAJOR_OFF_Times>=HOT_MAJOR_OFF_TIMES)
			{
				HOT_MAJOR_OFF_Times=0;
				if(HOT_MAJOR_OFF_Time<UINT8_MAX)
					HOT_MAJOR_OFF_Time++;
			}
			HOT_MAJOR_ON_Time=0;
			break;
		
	}
	
}

void Solenoid_State_F()
{
	switch(Solenoid_State)
	{
		case STATE_SOLENOID_OFF:
			SOLENOID_OFF();
			break;
		case STATE_SOLENOID_ON:
			SOLENOID_ON();
			break;
		case STATE_SOLENOID_ON_TIME:
			SOLENOID_ON();		
			if(Solenoid_ON_Times++>SOLENOID_ON_TIMES)
			{
				Solenoid_ON_Times=0;
				if(Solenoid_ON_Time<UINT16_MAX)
					Solenoid_ON_Time++;
			}	
			Solenoid_OFF_Time=0;
			break;
		case STATE_SOLENOID_OFF_TIME:
			SOLENOID_OFF();
			if(++Solenoid_OFF_Times>=SOLENOID_OFF_TIMES)
			{
				Solenoid_OFF_Times=0;
				if(Solenoid_OFF_Time<UINT16_MAX)
					Solenoid_OFF_Time++;
			}
			
			Solenoid_ON_Time=0;
			break;
	}
}
void Motor_State_F()
{
	switch(MOTOR_State)
	{
		case STATE_MOTOR_OFF:
			MOROT_OFF();
			break;
		case STATE_MOTOR_ON:
			MOROT_ON();
			break;
		case STATE_MOTOR_ON_TIME:
			MOROT_ON();		
			if(++MOTOR_ON_Times>=MOTOR_ON_TIMES)
			{
				MOTOR_ON_Times=0;
				if(MOTOR_ON_Time<UINT8_MAX)
					MOTOR_ON_Time++;
			}
			MOTOR_OFF_Time=0;
			break;
		case STATE_MOTOR_OFF_TIME:
			MOTOR_OFF();
			if(++MOTOR_OFF_Times>=MOTOR_OFF_TIMES)
			{
				MOTOR_OFF_Times=0;
				if(MOTOR_OFF_Time)
					MOTOR_OFF_Time++;
			}			
			MOTOR_ON_Time=0;
			break;
	}
}

void Pattern(void)
{
	LED_Crt();
	switch(Pattern_State)
	{
		case POWER_ON_INIT: 				
				Rbeep=1;	//蜂鸣器短叫一声
				LCD_State=LCD_FLASH; //LCD为闪烁状态			
				LCD_COL_Flash_Times=0;
				LCD_AUTO_Flash_Times=0;
				LCD_TIMER_Flash_Times=0;
				LCD_TEMP_Flash_Times=0;
				LCD_HOUR_Flash_Times=0;
				LCD_MINUTE_Flash_Times=0;
			    //LCD显示内容为00:00
				Display_Temp[0]=LCDCode[0];
				Display_Temp[1]=LCDCode[0];
				Display_Temp[2]=LCDCode[0];
				Display_Temp[3]=LCDCode[0];
			
				//默认温度
				Water_Temp=95;
				bool_WaterTempChange=0;
				bool_TimeChange=0;
				
				WorkSecond=0;
				WorkMinute=0;
				//LED状态设置
				//
				Pattern_LED_Crt=LED_CRT_POWER_ON_INIT;
				BG_LED_ON_Time=0;
				
				Pattern_Work_Time=0;
				Solenoid_ON_Time=0;
				Solenoid_OFF_Time=0;
				Pattern_Work_State=0;
				//按键值初始化
				Regular=0;
				Bold=0;
				Iced=0;
				Tea=0;
				Add=0;
				Reduce=0;
				_80_z=0;
				_120_z=0;
				_210_z=0;
				_420_z=0;
				Option=0;
				Start=0;
				//按键锁定
				Key_Regular_Lock=0;
				Key_Bold_Lock=0;
				Key_Iced_Lock=0;
				Key_Tea_Lock=0;
				Key_Add_Lock=1;
				Key_Reduce_Lock=1;
				Key_80_Z_Lock=0;
				Key_120_Z_Lock=0;
				Key_210_Z_Lock=0;
				Key_420_Z_Lock=0;
				Key_Option_Lock=0;
				Key_Start_Lock=1;	
				//
				
				HOT_MAJOR_OFF();
				HOT_MAJOR_State=STATE_HOT_MAJOR_OFF;
				HOT_BOTTOM_OFF();
				MOTOR_OFF();
				Solenoid_State=STATE_SOLENOID_OFF;
	
				Pattern_State=POWER_ON;	
		case POWER_ON:	
				LCD_HOUR_Flash_Times=0;	//LCD前两位持续闪烁
				LCD_MINUTE_Flash_Times=0;//LCD后两位持续闪烁
				if(BG_LED_ON_Time>=30)  //LCD背光灯灭了(即30秒已到)
				{
					ICO_TEMP_ON();
					ICO_TIMER_ON();
					ICO_AUTO_ON();
					ICO_COL_ON();
					BG_LED_State=LED_OFF;
					LCD_TEMP_Flash_Times=UINT8_MAX;	//LCD此图标不闪烁
					LCD_TIMER_Flash_Times=UINT8_MAX;//LCD此图标不闪烁
					LCD_AUTO_Flash_Times=UINT8_MAX;	//LCD此图标不闪烁
					LCD_COL_Flash_Times=UINT8_MAX;//LCD此图标不闪烁
				}
			if(Option) 
			{	
				Pattern_State=OPTION_INIT;	
			}
			
			if(Regular|Bold|Iced|Tea|_80_z|_120_z|_210_z|_420_z)
			{
				Pattern_State=WAITING_WORK_ORDER_INIT;	
			}
			break;
		case WAITING_WORK_ORDER_INIT:
			
			Pattern_LED_Crt=LED_CRT_OPTION_INIT;
			Pattern_State=WAITING_WORK_ORDER;
			Key_Option_Lock=1;	
			break;
			
		case WAITING_WORK_ORDER:
			
			//如果模式与流量已选择，允许START与OPTION按键操作
			if((Regular|Bold|Iced|Tea)&&(_80_z|_120_z|_210_z|_420_z))
			{
				Key_Start_Lock=0;
				Key_Option_Lock=1;
			}
			
			if(Option) Pattern_State=OPTION_INIT;
			if(Start)  
			{
				Pattern_State=WORKING_INIT;
				
			}
			break;
		case OPTION_INIT:
			Pattern_LED_Crt=LED_CRT_OPTION_INIT;
			//按键锁定
			Key_Regular_Lock=1;
			Key_Bold_Lock=1;
			Key_Iced_Lock=1;
			Key_Tea_Lock=1;
			Key_Add_Lock=0;
			Key_Reduce_Lock=0;
			Key_80_Z_Lock=1;
			Key_120_Z_Lock=1;
			Key_210_Z_Lock=1;
			Key_420_Z_Lock=1;
			Key_Option_Lock=0;
			Key_Start_Lock=0;
			Start=0;
			Pattern_State=OPTION;	
			break;
		case OPTION:
			
			if(Start) Option=0;
			if(Option==0) Pattern_State=TEMP_TIMER_SUCCESS_INIT;
				
			LCD_COL_Flash_Times=UINT8_MAX;
			LCD_AUTO_Flash_Times=UINT8_MAX;
			ICO_AUTO_OFF();
			switch(Option)
			{
				case HOUR:
					LCD_MINUTE_Flash_Times=UINT8_MAX;
					LCD_TEMP_Flash_Times=UINT8_MAX;
					ICO_COL_ON();
									
					ICO_TEMP_OFF();
					
					LCD_HOUR_Flash_Times=0;
					Display_Temp[0]=LCDCode[Hour/10];
					Display_Temp[1]=LCDCode[Hour%10];
						
					if(Key_Add_3S_ON|Key_Reduce_3S_ON)
					{
						LCD_HOUR_Flash_Times=UINT8_MAX;
						
						if(Timer_3S_Times++>=TIMER_3S_TIMES)
						{
							if(Key_Add_3S_ON)
							{
								Hour+=TIMER_3S;
							}
							else
							Hour-=TIMER_3S;
							
							if(Hour>23) Hour=0;
							if(Hour<0) Hour=23;
					
							Timer_3S_Times=0;
							Key_Add_3S_ON=0;
							Key_Reduce_3S_ON=0;
							display[0]=LCDCode[Hour/10];
							display[1]=LCDCode[Hour%10];						
						}
					}
					else
					if(Add|Reduce)
					{ 
						if(Add) 
						{
							Hour++;
						}
						else if(Reduce) 
						{
							Hour--;
						}
						if(Hour>23) Hour=0;
						if(Hour<0) Hour=23;	
						bool_TimeChange=1;					
					}
		
					display[2]=LCDCode[Minute/10];
					display[3]=LCDCode[Minute%10];
					
					LCD_TIMER_Flash_Times=0;
					break;
				case MINUTE:
					LCD_HOUR_Flash_Times=UINT8_MAX;

					Display_Temp[2]=LCDCode[Minute/10];
					Display_Temp[3]=LCDCode[Minute%10];
					LCD_MINUTE_Flash_Times=0;
					
					
					if(Key_Add_3S_ON|Key_Reduce_3S_ON)
					{
						LCD_MINUTE_Flash_Times=UINT8_MAX;
						if(Timer_3S_Times++>=TIMER_3S_TIMES)
						{
							if(Key_Add_3S_ON)
							{
								Minute+=TIMER_3S;
							}
							else
							Minute-=TIMER_3S;
							
							if(Minute>59) Minute=0;
							if(Minute<0) Minute=59;
					
							Timer_3S_Times=0;
							Key_Add_3S_ON=0;
							Key_Reduce_3S_ON=0;
							display[2]=LCDCode[Minute/10];
							display[3]=LCDCode[Minute%10];
						}
					}
					else 
					if(Add|Reduce)
					{
						if(Add) Minute++;
						else 
						if(Reduce) Minute--;
						bool_TimeChange=1;
					}
								
					if(Minute>59) Minute=0;
					if(Minute<0) Minute=59;
					
					display[0]=LCDCode[Hour/10];
					display[1]=LCDCode[Hour%10];

					break;
				case TEMP:
					LCD_MINUTE_Flash_Times=UINT8_MAX;
					LCD_TIMER_Flash_Times=UINT8_MAX;
					display[2]=LCDCode[12];//显示C
					display[3]=LCDCode[10];//显示空白
					
					ICO_COL_OFF();
					ICO_TIMER_OFF();
					
					Display_Temp[0]=LCDCode[Water_Temp/10];
					Display_Temp[1]=LCDCode[Water_Temp%10];
					LCD_HOUR_Flash_Times=0;
					if(Key_Add_3S_ON|Key_Reduce_3S_ON)
					{
						LCD_HOUR_Flash_Times=UINT8_MAX;
						if(Timer_3S_Times++>=TIMER_3S_TIMES)
						{
							if(Key_Add_3S_ON)
							{
								Water_Temp+=TIMER_3S;
							}
							else
							Water_Temp-=TIMER_3S;
							
							if(Water_Temp>95) Water_Temp=40;
							if(Water_Temp<40) Water_Temp=95; 
							Timer_3S_Times=0;
							Key_Add_3S_ON=0;
							Key_Reduce_3S_ON=0;
							display[0]=LCDCode[Water_Temp/10];
							display[1]=LCDCode[Water_Temp%10];
						}
					}
					else 
					if(Add|Reduce)
					{
						if(Add) Water_Temp++;
						else 
						if(Reduce) Water_Temp--;

						if(Water_Temp>95) Water_Temp=40;
						if(Water_Temp<40) Water_Temp=95; 
						bool_WaterTempChange=1;
					}
					
					LCD_TEMP_Flash_Times=0;
					
					break;					
			}
			
			break;
		case TEMP_TIMER_SUCCESS_INIT:
			
			//如果在Option中既不设置时间，也不设置温度，则两者的默认值都显示
			if((bool_TimeChange==0)&&(bool_WaterTempChange==0))
			{
				bool_TimeChange=1;
				bool_WaterTempChange=1;
				
			}
			//ICO_TIMER_OFF();
			//LCD_HOUR_Flash_Times=UINT8_MAX;
			//LCD_MINUTE_Flash_Times=UINT8_MAX;
			//按键锁定
			Key_Regular_Lock=0;
			Key_Bold_Lock=0;
			Key_Iced_Lock=0;
			Key_Tea_Lock=0;
			Key_Add_Lock=1;
			Key_Reduce_Lock=1;
			Key_80_Z_Lock=0;
			Key_120_Z_Lock=0;
			Key_210_Z_Lock=0;
			Key_420_Z_Lock=0;
			Key_Option_Lock=1;
			Key_Start_Lock=1;
			Start=0;
			Pattern_State=TEMP_TIMER_SUCCESS;
			break;
		case TEMP_TIMER_SUCCESS:
			LCD_AUTO_Flash_Times=0;
			
			if(Time_Temp_Counter++>=TIME_TEMP_DIS_HZ) 
			{
				Time_Temp_Dis=~Time_Temp_Dis;
				Time_Temp_Counter=0;
			}
			
			if(Time_Temp_Dis)
			{
				if(bool_TimeChange)
				{
					LCD_TIMER_Flash_Times=0;
					LCD_TEMP_Flash_Times=UINT8_MAX;
					LCD_HOUR_Flash_Times=UINT8_MAX;//
					LCD_MINUTE_Flash_Times=UINT8_MAX;//
					LCD_COL_Flash_Times=UINT8_MAX;	
					ICO_TEMP_OFF();
					ICO_COL_ON();
					
					display[0]=LCDCode[Hour/10];
					display[1]=LCDCode[Hour%10];
					display[2]=LCDCode[Minute/10];
					display[3]=LCDCode[Minute%10];
					
				}
				else
				{
					Time_Temp_Dis=0;
				}
			}
			else
			{
				if(bool_WaterTempChange)
				{
					LCD_TIMER_Flash_Times=UINT8_MAX;
					LCD_TEMP_Flash_Times=0;
					LCD_HOUR_Flash_Times=UINT8_MAX;//
					LCD_MINUTE_Flash_Times=UINT8_MAX;//
					LCD_COL_Flash_Times=UINT8_MAX;
					ICO_TIMER_OFF();
					ICO_COL_OFF();
					
					display[0]=LCDCode[Water_Temp/10];
					display[1]=LCDCode[Water_Temp%10];
					display[2]=LCDCode[12];
					display[3]=LCDCode[10];
					
				}
				else
				{
					Time_Temp_Dis=1;
				}
			}
		
		
		
			if((Regular|Bold|Iced|Tea)&&(_80_z|_120_z|_210_z|_420_z))
			{
				Key_Start_Lock=0;	
				if(Start)
					Pattern_State=WAITING_TIME_OUT_INIT;	
				
			}
			
			break;
		case WAITING_TIME_OUT_INIT:
		
		
		
			Pattern_State=WAITING_TIME_OUT;
			break;
		case WAITING_TIME_OUT:	
			//LCD_TEMP_Flash_Times=0;
			//LCD_AUTO_Flash_Times=0;
			//LCD_COL_Flash_Times=0;
			
			if(Time_Temp_Counter++>=TIME_TEMP_DIS_HZ) 
			{
				Time_Temp_Dis=~Time_Temp_Dis;
				Time_Temp_Counter=0;
			}
			
			if(Time_Temp_Dis)
			{
				if(bool_TimeChange)
				{
					LCD_TIMER_Flash_Times=0;
					LCD_TEMP_Flash_Times=UINT8_MAX;
					LCD_HOUR_Flash_Times=UINT8_MAX;
					LCD_MINUTE_Flash_Times=UINT8_MAX;
					LCD_COL_Flash_Times=0;	
					ICO_TEMP_OFF();
					//ICO_COL_ON();
					
					display[0]=LCDCode[Hour/10];
					display[1]=LCDCode[Hour%10];
					display[2]=LCDCode[Minute/10];
					display[3]=LCDCode[Minute%10];
					
				}
				else
				{
					Time_Temp_Dis=0;
				}
			}
			else
			{
				if(bool_WaterTempChange)
				{
					LCD_TIMER_Flash_Times=UINT8_MAX;
					LCD_TEMP_Flash_Times=0;
					LCD_HOUR_Flash_Times=UINT8_MAX;
					LCD_MINUTE_Flash_Times=UINT8_MAX;
					LCD_COL_Flash_Times=UINT8_MAX;
					ICO_TIMER_OFF();
					ICO_COL_OFF();
					
					display[0]=LCDCode[Water_Temp/10];
					display[1]=LCDCode[Water_Temp%10];
					display[2]=LCDCode[12];
					display[3]=LCDCode[10];
					
				}
				else
				{
					Time_Temp_Dis=1;
				}
			}
			
			if(++TimeCounter>_1_SECOND_HZ)
			{
				TimeCounter=0;
				Second++;
				if(Second>=60)
				{
					Second=0;
					Minute--;
					if(Minute<0)
					{
						Hour--;							
					}
						
				}
					
			}
			
			if((Hour==0)&&(Minute==0))
			{
				Pattern_State=WORKING_INIT;	
			}
			
			break;
		
		case WORKING_INIT:
			
			ANNULUS_LIGHT_State=LED_ON;//
			SHOW_LIGHT_State=LED_ON;//
			
			LCD_TEMP_Flash_Times=UINT8_MAX;
			LCD_AUTO_Flash_Times=UINT8_MAX;
			//LCD_COL_Flash_Times=UINT8_MAX;
			
			LCD_HOUR_Flash_Times=UINT8_MAX;
			LCD_MINUTE_Flash_Times=UINT8_MAX;
			
			ANNULUS_LIGHT_ON();
			SHOW_LIGHT_ON();
			
			//ICO_COL_OFF();	
			ICO_TIMER_OFF();
			ICO_TEMP_ON();
			ICO_AUTO_OFF();
			LCD_State=LCD_FLASH; 
			
			LED12_State=LED_ON;
			
			//按键锁定
			Key_Regular_Lock=1;
			Key_Bold_Lock=1;
			Key_Iced_Lock=1;
			Key_Tea_Lock=1;
			Key_Add_Lock=1;
			Key_Reduce_Lock=1;
			Key_80_Z_Lock=1;
			Key_120_Z_Lock=1;
			Key_210_Z_Lock=1;
			Key_420_Z_Lock=1;
			Key_Option_Lock=1;
			Key_Start_Lock=0;
			Start=0;
			//LCD设置
			LCD_TIMER_Flash_Times=UINT8_MAX;
			LCD_TEMP_Flash_Times=UINT8_MAX;
			LCD_HOUR_Flash_Times=UINT8_MAX;
			LCD_MINUTE_Flash_Times=UINT8_MAX;
					
			Pattern_State=WORKING;
			break;
		case WORKING:
			
			if(Start) Pattern_State=POWER_ON_INIT;
			if(WortTimeCount++>=WORK_TIME_HZ) 
			{
				WortTimeCount=0;
				
				if(++Time_Temp_Counter>=WORK_TIME_TEMP_DIS_HZ)
				{
					Time_Temp_Counter=0;
					Time_Temp_Dis=~Time_Temp_Dis;
				}
					
				WorkSecond+=1;
				if(WorkSecond>59) 
				{
					WorkSecond=0;
					WorkMinute++;
					if(WorkMinute>99) WorkMinute=0;
				}
			}
			
			if(Time_Temp_Dis)
			{
				//if(bool_TimeChange)
				{
					//LCD_TIMER_Flash_Times=0;
					//LCD_TEMP_Flash_Times=UINT8_MAX;
					//LCD_HOUR_Flash_Times=0;
					//LCD_MINUTE_Flash_Times=0;
					LCD_COL_Flash_Times=0;
					ICO_TEMP_OFF();
					ICO_TIMER_ON();
					//ICO_COL_ON();
					
					display[0]=LCDCode[WorkMinute/10];
					display[1]=LCDCode[WorkMinute%10];
					display[2]=LCDCode[WorkSecond/10];
					display[3]=LCDCode[WorkSecond%10];
					
				}
				//else
				{
					//Time_Temp_Dis=0;
				}
			}
			else
			{
				//if(bool_WaterTempChange)
				{
					
					LCD_COL_Flash_Times=UINT8_MAX;
					ICO_TEMP_ON();
					ICO_TIMER_OFF();
					ICO_COL_OFF();
					Hex_To_Temp(Temperature_Dat);
					
				}
				//else
				{
					//Time_Temp_Dis=1;
				}
			}
			switch(Pattern_Work_State)
			{
				case PATTERN_WORK_ONCE:
					
					if(_80_z)
					{
						Solenoid_Work_Time=SOLENOID_WORK_TIME_8OZ;
						Solenoid_Stop_Time=SOLENOID_STOP_TIME_8OZ;
						if(Regular)
						{
							PATTERN_WORK_TIME=REGULAR_8OZ_WORK_TIME;
						}
						else
						if(Bold)
						{
							PATTERN_WORK_TIME=BOLD_8OZ_WORK_TIME;
						}
						else
						if(Iced)
						{
							PATTERN_WORK_TIME=ICED_8OZ_WORK_TIME;
						}
						else
						if(Tea)
						{
							PATTERN_WORK_TIME=TEA_8OZ_WORK_TIME;
						}
						
					}
					else
					if(_120_z)
					{
						Solenoid_Work_Time=SOLENOID_WORK_TIME_12OZ;
						Solenoid_Stop_Time=SOLENOID_STOP_TIME_12OZ;
						if(Regular)
						{
							PATTERN_WORK_TIME=REGULAR_12OZ_WORK_TIME;
						}
						else
						if(Bold)
						{
							PATTERN_WORK_TIME=BOLD_12OZ_WORK_TIME;
						}
						else
						if(Iced)
						{
							PATTERN_WORK_TIME=ICED_12OZ_WORK_TIME;
						}
						else
						if(Tea)
						{
							PATTERN_WORK_TIME=TEA_12OZ_WORK_TIME;
						}
					}
					else
					if(_210_z)
					{
						Solenoid_Work_Time=SOLENOID_WORK_TIME_21OZ;
						Solenoid_Stop_Time=SOLENOID_STOP_TIME_21OZ;
						if(Regular)
						{
							PATTERN_WORK_TIME=REGULAR_21OZ_WORK_TIME;
						}
						else
						if(Bold)
						{
							PATTERN_WORK_TIME=BOLD_21OZ_WORK_TIME;
						}
						else
						if(Iced)
						{
							PATTERN_WORK_TIME=ICED_21OZ_WORK_TIME;
						}
						else
						if(Tea)
						{
							PATTERN_WORK_TIME=TEA_21OZ_WORK_TIME;
						}
					}
					else
					if(_420_z)
					{
						Solenoid_Work_Time=SOLENOID_WORK_TIME_42OZ;
						Solenoid_Stop_Time=SOLENOID_STOP_TIME_42OZ;
						if(Regular)
						{
							PATTERN_WORK_TIME=REGULAR_42OZ_WORK_TIME;
						}
						else
						if(Bold)
						{
							PATTERN_WORK_TIME=BOLD_42OZ_WORK_TIME;
						}
						else
						if(Iced)
						{
							PATTERN_WORK_TIME=ICED_42OZ_WORK_TIME;
						}
						else
						if(Tea)
						{
							PATTERN_WORK_TIME=TEA_42OZ_WORK_TIME;
						}
					}

					//LCD_HOUR_Flash_Times=UINT8_MAX;	//LCD前两位不闪烁
					//LCD_MINUTE_Flash_Times=UINT8_MAX;//LCD后两位不闪烁
					Pattern_Work_State=PATTERN_WORK__HOTING;
				break;
				
				case PATTERN_WORK__HOTING:
					HOT_MAJOR_State=STATE_HOT_MAJOR_ON;
					HOT_BOTTOM_ON();
					Solenoid_State=STATE_SOLENOID_OFF;	
									
					if(Temperature_Dat>=Water_Temp)
					{
						Pattern_Work_State=PATTERN_WORK__HOT_FINSHE;
						Solenoid_State=STATE_SOLENOID_ON_TIME;
					}
					break;
				case PATTERN_WORK__HOT_FINSHE:

					if(Temperature_Dat>=Water_Temp)
					{
						HOT_MAJOR_State=STATE_HOT_MAJOR_OFF;
					}
					else
					{
						HOT_MAJOR_State=STATE_HOT_MAJOR_ON;
					}
					
					//电磁阀状态控制
					if(!Tea)
					{
						if(Solenoid_ON_Time>=Solenoid_Work_Time)
							Solenoid_State=STATE_SOLENOID_OFF_TIME;
						
						if(Solenoid_OFF_Time>=Solenoid_Stop_Time)
							if(++Pattern_Work_Times>=PATTERN_WORK__TIMES)
							{
								Solenoid_State=STATE_SOLENOID_ON;
								Pattern_Work_Times=0;
								Pattern_Work_Time++;
								if(Pattern_Work_Time>=PATTERN_WORK_TIME)
								Pattern_Work_State=PATTERN_WORK__TIME_OUT;
							}
						//电机状态控制
					}
					else
					{
						if(Solenoid_ON_Time>=PATTERN_WORK_TIME)
							Pattern_Work_State=PATTERN_WORK__TIME_OUT;
					}
					MOTOR_ON();
					break;
				case PATTERN_WORK__TIME_OUT:
					HOT_MAJOR_State=STATE_HOT_MAJOR_OFF;
					
					ANNULUS_LIGHT_State=LED_OFF;//
					SHOW_LIGHT_State=LED_OFF;//
					
					Solenoid_State=STATE_SOLENOID_OFF;
					MOTOR_OFF();
					
					//Pattern_LED_Crt=LED_CRT_FINISH_INIT;
					//Pattern_LED_Crt=LED_CRT_FINISH;
					
					//Rbeep=6;	//蜂鸣器叫三声
					if(WorkMinute>=35)
						Pattern_Work_State=PATTERN_WORK_WATAING_35MIN_INIT;
					
					//Start=0;
					break;
				case PATTERN_WORK_WATAING_35MIN_INIT:
					Rbeep=6;	//蜂鸣器叫三声
					Pattern_LED_Crt=LED_CRT_FINISH;
					Pattern_Work_State=PATTERN_WORK_WATAING_35MIN;
					break;
				case PATTERN_WORK_WATAING_35MIN:
					HOT_BOTTOM_OFF();
					
					//Pattern_LED_Crt=LED_CRT_FINISH;
					if(Start) Pattern_State=POWER_ON_INIT;
					break;
			}
			
			break;
			
				
	}
}
void LED_Crt()
{
	switch(Pattern_LED_Crt)
	{
		case LED_CRT_POWER_ON_INIT:
			BG_LED_State=LED_Flash;//背光灯打开，并计时
			BG_LED_ON_Time=0;
			
			ANNULUS_LIGHT_State=LED_Flash;
			SHOW_LIGHT_State=LED_Flash;
			ANNULUS_LIGHT_Flash_Times=0;
			SHOW_LIGHT_Flash_Times=0;
			
			LED_Flash_HZ=0;
			LED_Flash_Bool=1;
			LED1_Flash_Times=0;
			LED1_State=LED_Flash;
			LED2_State=LED_Flash;
			LED3_State=LED_Flash;
			LED4_State=LED_Flash;
			LED5_State=LED_Flash;	
			LED6_State=LED_Flash;				
			LED7_State=LED_Flash;				
			LED8_State=LED_Flash;				
			LED9_State=LED_Flash;				
			LED10_State=LED_Flash;				
			LED11_State=LED_Flash;				
			LED12_State=LED_Flash;
			Pattern_LED_Crt=LED_CRT_POWER_ON;
			break;
			
		case LED_CRT_POWER_ON:
			if(LED1_Flash_Times>3)
				{
					BG_LED_State=LED_ON_TIME;
					if(!LED_Flash_Bool) //平滑过渡
					{	
						LED1_State=LED_OFF;
						LED2_State=LED_OFF;
						LED3_State=LED_OFF;
						LED4_State=LED_OFF;
						LED5_State=LED_OFF;	
						LED6_State=LED_OFF;				
						LED7_State=LED_OFF;				
						LED8_State=LED_OFF;				
						LED9_State=LED_OFF;				
						LED10_State=LED_OFF;				
						LED11_State=LED_OFF;				
						LED12_State=LED_OFF;				
					}
				}
			if(ANNULUS_LIGHT_Flash_Times>3)
			{
				if(!LED_Flash_Bool) //平滑过渡
				{
					ANNULUS_LIGHT_State=LED_OFF;
					SHOW_LIGHT_State=LED_OFF;
				}
			}
			break;
			
		case LED_CRT_OPTION_INIT:
			BG_LED_State=LED_ON;//背光灯打开
			ANNULUS_LIGHT_State=LED_OFF;//
			SHOW_LIGHT_State=LED_OFF;//
			LED1_State=LED_OFF;
			LED2_State=LED_OFF;
			LED3_State=LED_OFF;
			LED4_State=LED_OFF;
			LED5_State=LED_OFF;	
			LED6_State=LED_OFF;				
			LED7_State=LED_OFF;				
			LED8_State=LED_OFF;				
			LED9_State=LED_OFF;				
			LED10_State=LED_OFF;				
			LED11_State=LED_OFF;				
			LED12_State=LED_OFF;
			Pattern_LED_Crt=LED_CRT_OPTION;
			break;
		
		case LED_CRT_OPTION:
			
			if(Option)
			{
				LED11_State=LED_ON;
			}
			else
			{
				LED11_State=LED_OFF;
			}
			if(Start)
			{
				LED12_State=LED_ON;			
			}
			else
			{
				//LED12_State=LED_OFF;			
			}
			if(Regular)
			{
				LED1_State=LED_ON;
				LED2_State=LED_OFF;
				LED3_State=LED_OFF;
				LED4_State=LED_OFF;
			}
			else if(Bold)
			{
				LED1_State=LED_OFF;
				LED2_State=LED_ON;
				LED3_State=LED_OFF;
				LED4_State=LED_OFF;
			}
			else if(Iced)
			{
				LED1_State=LED_OFF;
				LED2_State=LED_OFF;
				LED3_State=LED_ON;
				LED4_State=LED_OFF;
			}
			else if(Tea)
			{
				LED1_State=LED_OFF;
				LED2_State=LED_OFF;
				LED3_State=LED_OFF;
				LED4_State=LED_ON;
			}
			
			if(_80_z)
			{
				LED7_State=LED_ON;
				LED8_State=LED_OFF;
				LED9_State=LED_OFF;
				LED10_State=LED_OFF;
			}
			else if(_120_z)
			{
				LED7_State=LED_OFF;
				LED8_State=LED_ON;
				LED9_State=LED_OFF;
				LED10_State=LED_OFF;
			}
			else if(_210_z)
			{
				LED7_State=LED_OFF;
				LED8_State=LED_OFF;
				LED9_State=LED_ON;
				LED10_State=LED_OFF;
			}
			else if(_420_z)
			{
				LED7_State=LED_OFF;
				LED8_State=LED_OFF;
				LED9_State=LED_OFF;
				LED10_State=LED_ON;
			}
			break;
		case LED_CRT_FINISH_INIT:
			Pattern_LED_Crt=LED_CRT_FINISH;
			break;
		
		case LED_CRT_FINISH:
			BG_LED_State=LED_ON;//背光灯打开
			LED12_State=LED_Flash;
			LED12_Flash_Times=0;
			if(Regular)
			{
				LED1_State=LED_Flash;
				LED1_Flash_Times=0;
			}
			else
			if(Bold)
			{
				LED2_State=LED_Flash;
				LED2_Flash_Times=0;
			}
			else
			if(Iced)
			{
				LED3_State=LED_Flash;
				LED3_Flash_Times=0;
			}
			else
			if(Tea)
			{
				LED4_State=LED_Flash;
				LED4_Flash_Times=0;
			}
			if(_80_z)
			{
				LED7_State=LED_Flash;
				LED7_Flash_Times=0;
			}
			else
			if(_120_z)
			{
				LED8_State=LED_Flash;
				LED8_Flash_Times=0;
			}
			else
			if(_210_z)
			{
				LED9_State=LED_Flash;
				LED9_Flash_Times=0;
			}
			else
			if(_420_z)
			{
				LED10_State=LED_Flash;
				LED10_Flash_Times=0;
			}
		
			break;
		
	}	
}

void AcTestZero()
{
	if(AC_PIN!=old_LHResult)
	{
		old_LHResult=AC_PIN;
		
		No_AC=0;
		LH_Count=0;			
	}
	else 
	{
		LH_Count++;	
	}
	
	if(LH_Count>=4)
	    No_AC=1;
		
	
}
void ShutDowm_Device()
{
	//INTCON=0B11001000;		//关总中断，允许外设中断，允许PB口电平变化中断
	//INTCON=0B11001000;		//关总中断，允许外设中断，允许PB口电平变化中断
	/*T2CON = 0;				//禁止TIME2
	TMR2IF = 0;				//清除TIME2中断标志位
	PIE1 = 0;				//禁止TIME2匹配中断
	ADCON0 = 0;				//关ADC
	*/
	//WDTCON=0;		//关闭看门狗
	
	//关所有外设
	
	ADCON0 = 0;				//关ADC
	
	
	Temp_595[LED_1_6]=0xFF;
	Temp_595[LED_7_12]=0xFF;
	Temp_595[SEG0_8]=0x00;
	
	BEEP_OFF();
	BG_LED_OFF();
	MOTOR_OFF();
	HOT_BOTTOM_OFF();
	HOT_MAJOR_OFF();
	SHOW_LIGHT_OFF();
	ANNULUS_LIGHT_OFF();
	
	_74HC595_SET(); 	//执行595缓冲器数据
	
	//4个COM口输出低电平
	TRISC &= ~(0x3C);
	RC2=0;
	RC3=0;
	RC4=0;
	RC5=0;
	
	WDTCON=0;		//关闭看门狗
	
	TRISE = 0B00000000;
	TRISB = 0B00000010;
	//TRISC = 0B11111111;
	//RA0-RA5,RB2-RB7//电容按键,RA6-底部NTC RA7-电机
	TRISA = 0B00000000;	
	TRISC = 0B00000000;
	
	RE1=0;		//NTC输出高电平，阻止耗电
	RB1=0;		//过零检测端口值为0,当上电即唤醒
	//LCD COM口上下拉关闭
	LCDCON0=0;
	LCDADD=0;
	COMEN  =0;
	TRISC  =0;
	

	KEYCON0&=0x80;		//关触摸使能
	RB1=RB1;
	CLRWDT();
	INTCON=0B00001000;		//关总中断，允许外设中断，允许PB口电平变化中断
	asm("nop");
	asm("nop");
	asm("nop");
	asm("nop");
	asm("SLEEP");
	asm("nop");
	asm("nop");
	//while(1);
	INTCON = 0B11000000;			//使能中断
	//T2CON = 6;				//使能定时器2, 16分频
	//PIE1 = 2;				//使能TIME2匹配中断
	asm("nop");
	asm("nop");
	CLRWDT();
	asm("nop");
	asm("nop");
	
	//RB1过零检测,RE3,RC6，HC595驱动,RC0-主PTC,RC1-HC595时钟，RE1-NTC,RE2-电磁阀
	TRISE = 0B11110011;
	TRISB = 0B11111111;
	TRISC = 0B10111100;
	//RA0-RA5,RB2-RB7//电容按键,RA6-底部NTC RA7-电机
	TRISA = 0B00111111;	
	No_AC=0;
	LH_Count=0;
	//恢复COM口上下拉
	LCDCON0=0B10110000;
	LCDADD =0B01100000;
	//COMEN  =0B00111100;
	//TRISC |=0B00111100;
}