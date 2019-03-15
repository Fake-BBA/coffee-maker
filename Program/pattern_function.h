#ifndef _PATTERN_FUNCTION_H_
#define _PATTERN_FUNCTION_H_
#include "my_configuration.h"

#define WD_EN	1
#define WD_DIS  0
//NTC 9-RE1

#define UINT8_MAX	255
#define UINT16_MAX	65535
//电磁阀 10-RE2
#define SOLENOID_ON()	RE2=1
#define SOLENOID_OFF()	RE2=0

#define STATE_SOLENOID_OFF	0
#define STATE_SOLENOID_ON		1
#define STATE_SOLENOID_ON_TIME	2
#define STATE_SOLENOID_OFF_TIME	3

#define SOLENOID_ON_TIMES	250 //4ms
#define SOLENOID_OFF_TIMES	250 //4ms

#define SOLENOID_WORK_TIME_8OZ	15
#define SOLENOID_STOP_TIME_8OZ	5

#define SOLENOID_WORK_TIME_12OZ	20
#define SOLENOID_STOP_TIME_12OZ	5

#define SOLENOID_WORK_TIME_21OZ	25
#define SOLENOID_STOP_TIME_21OZ	5

#define SOLENOID_WORK_TIME_42OZ	45
#define SOLENOID_STOP_TIME_42OZ	10

unsigned short Solenoid_Work_Time;//电磁阀工作时间
unsigned short Solenoid_Stop_Time;//电磁阀停止时间

unsigned short Solenoid_ON_Time;//1s
unsigned short Solenoid_ON_Times;//时间计数器，单位为4ms
unsigned short Solenoid_OFF_Time;//1s
unsigned short Solenoid_OFF_Times;//时间计数器，单位为4ms
unsigned char Solenoid_State;//电磁阀状态

void Solenoid_State_F();

//电机 11-RA7
#define	MOTOR_ON()	RA7=1
#define MOTOR_OFF()	RA7=0

#define STATE_MOTOR_OFF	0
#define STATE_MOTOR_ON	1
#define STATE_MOTOR_ON_TIME	2
#define STATE_MOTOR_OFF_TIME	3

#define MOTOR_ON_TIMES	250 //4ms
#define MOTOR_OFF_TIMES	250 //4ms
unsigned short MOTOR_ON_Time;	//1s
unsigned short MOTOR_ON_Times;	//时间计数器，单位为4ms
unsigned short MOTOR_OFF_Time;	//1s
unsigned short MOTOR_OFF_Times;	//时间计数器，单位为4ms
unsigned char  MOTOR_State;

void Motor_State_F();
//底部PTC 12-RA6
#define HOT_BOTTOM_ON()		RC0=1
#define HOT_BOTTOM_OFF()	RC0=0

#define STATE_HOT_BOTTOM_OFF	0
#define STATE_HOT_BOTTOM_ON	1
#define STATE_HOT_BOTTOM_ON_TIME	2
#define STATE_HOT_BOTTOM_OFF_TIME	3

#define HOT_BOTTOM_ON_TIMES	250 //4ms
#define HOT_BOTTOM_OFF_TIMES	250 //4ms
unsigned short HOT_BOTTOM_ON_Time;	//1s
unsigned short HOT_BOTTOM_ON_Times;	//时间计数器，单位为4ms
unsigned short HOT_BOTTOM_OFF_Time;	//1s
unsigned short HOT_BOTTOM_OFF_Times;	//时间计数器，单位为4ms
unsigned char  HOT_BOTTOM_State;

void HOT_BOTTOM_State_F();
//主PTC 13-RC0
#define HOT_MAJOR_ON()	RA6=1
#define HOT_MAJOR_OFF()	RA6=0

#define STATE_HOT_MAJOR_OFF	0
#define STATE_HOT_MAJOR_ON	1
#define STATE_HOT_MAJOR_ON_TIME	2
#define STATE_HOT_MAJOR_OFF_TIME	3

#define HOT_MAJOR_ON_TIMES	250 //4ms
#define HOT_MAJOR_OFF_TIMES	250 //4ms
unsigned short HOT_MAJOR_ON_Time;	//1s
unsigned short HOT_MAJOR_ON_Times;	//时间计数器，单位为4ms
unsigned short HOT_MAJOR_OFF_Time;	//1s
unsigned short HOT_MAJOR_OFF_Times;	//时间计数器，单位为4ms
unsigned char  HOT_MAJOR_State;
//unsigned short HOT_MAJOR_Work_Time;//加热时间
//unsigned short HOT_MAJOR_Stop_Time;//停止加热时间

void HOT_MAJOR_State_F();
//过零检测 14-RB1
bit No_AC;
bit old_LHResult;
#define AC_PIN	RB1
//bit AC_PIN;
unsigned LH_Count;

void AcTestZero();
void ShutDowm_Device();
//蜂鸣器相关
#define NO_BEEP 25	//持续不响时间/2ms
#define BEEP_SHORT	40	//持续响时间(短鸣)/2ms
#define BEEP_LONG	100	//持续响时间(长鸣)2ms
signed char Rbeep; //1,短鸣一声，2,长鸣一声，以此类推
unsigned char BuzzerTime=BEEP_SHORT;	//计数器
bit			  Buzzer_CFlag;
void CheckBuzzer();

//LED相关
//LED显示模式
#define LED_OFF 0
#define LED_ON	1
#define LED_Flash	2
#define LED_ON_TIME	3

#define LED_FLASH_HZ 125 // /4ms
#define LED_ON_TIMES	250	// /4ms

#define LED5_ON_TIMES	125	// /4ms
#define LED6_ON_TIMES	125	// /4ms

unsigned short LED5_On_Times;// /4ms
unsigned char  LED5_On_Time;// /1s
unsigned short LED6_On_Times;// /4ms
unsigned char  LED6_On_Time;// /1s
unsigned short BG_LED_ON_Times;// /4ms
unsigned char BG_LED_ON_Time;// /1s

unsigned char BG_LED_State;
unsigned char ANNULUS_LIGHT_State;
unsigned char SHOW_LIGHT_State;
unsigned char LED1_State;
unsigned char LED2_State;
unsigned char LED3_State;
unsigned char LED4_State;
unsigned char LED5_State;
unsigned char LED6_State;
unsigned char LED7_State;
unsigned char LED8_State;
unsigned char LED9_State;
unsigned char LED10_State;
unsigned char LED11_State;
unsigned char LED12_State;

unsigned char BG_LED_Flash_Times;
unsigned char ANNULUS_LIGHT_Flash_Times;
unsigned char SHOW_LIGHT_Flash_Times;
unsigned char LED1_Flash_Times;
unsigned char LED2_Flash_Times;
unsigned char LED3_Flash_Times;
unsigned char LED4_Flash_Times;
unsigned char LED5_Flash_Times;
unsigned char LED6_Flash_Times;
unsigned char LED7_Flash_Times;
unsigned char LED8_Flash_Times;
unsigned char LED9_Flash_Times;
unsigned char LED10_Flash_Times;
unsigned char LED11_Flash_Times;
unsigned char LED12_Flash_Times;

unsigned char LED_Flash_HZ;
/*unsigned char BG_LED_Flash_HZ;
unsigned char LED1_Flash_HZ;
unsigned char LED2_Flash_HZ;
unsigned char LED3_Flash_HZ;
unsigned char LED4_Flash_HZ;
unsigned char LED5_Flash_HZ;
unsigned char LED6_Flash_HZ;
unsigned char LED7_Flash_HZ;
unsigned char LED8_Flash_HZ;
unsigned char LED9_Flash_HZ;
unsigned char LED10_Flash_HZ;
unsigned char LED11_Flash_HZ;
unsigned char LED12_Flash_HZ;
*/
bit LED_Flash_Bool;
/*
bit BG_LED_Flash_Bool;
bit LED1_Flash_Bool;
bit LED2_Flash_Bool;
bit LED3_Flash_Bool;
bit LED4_Flash_Bool;
bit LED5_Flash_Bool;
bit LED6_Flash_Bool;
bit LED7_Flash_Bool;
bit LED8_Flash_Bool;
bit LED9_Flash_Bool;
bit LED10_Flash_Bool;
bit LED11_Flash_Bool;
bit LED12_Flash_Bool;
*/
//LCD相关
#define LCD_FLASH_HZ 125 // /4ms
#define LCD_CLEAR	0
#define LCD_FULL	1
#define LCD_NORMAL	2
#define LCD_POWER_ON	3
#define LCD_SHOW_TEMP	4
#define LCD_FLASH		5

unsigned char LCD_State;

unsigned char LCD_Flash_HZ;
unsigned char LCD_HOUR_Flash_Times;
unsigned char LCD_MINUTE_Flash_Times;
unsigned char LCD_COL_Flash_Times;
unsigned char LCD_TEMP_Flash_Times;
unsigned char LCD_TIMER_Flash_Times;
unsigned char LCD_AUTO_Flash_Times;
bit LCD_Flash_Bool;
void LCD_FState();

//模式相关
#define POWER_ON_INIT 0
#define POWER_ON 1
#define WAITING_WORK_ORDER_INIT	2
#define WAITING_WORK_ORDER	3
#define OPTION_INIT	4
#define OPTION	5	
#define TEMP_TIMER_SUCCESS_INIT	6
#define TEMP_TIMER_SUCCESS	7
#define WAITING_TIME_OUT_INIT 8
#define WAITING_TIME_OUT	9
#define WORKING_INIT	10
#define WORKING	11

#define REGULAR_ING	4
#define BOLD_ING	5
#define ICED_ING	6
#define TEA_INT		7

#define HOUR	1
#define MINUTE	2
#define TEMP	3

#define KEY_REGULAR	1
#define KEY_BOLD	2
#define KEY_ICED	4
#define KEY_TEA		8
#define KEY_ADD		16
#define KEY_REDUCE	32
#define KEY_80_Z	64
#define KEY_120_Z 	128
#define KEY_210_Z	256
#define KEY_420_Z	512
#define KEY_OPTION	1024
#define KEY_START	2048

#define ADD_REDUCE_LED_TIME	80 //加减按键灯亮时间/4ms
#define KEY_ON_TIMES	750//4ms 3s
unsigned short Key_ON_Times;
unsigned short Key_Add_ON_Times;
//unsigned short Key_Add_ON_Times;
bit Key_Add_3S_ON;
bit Key_Reduce_3S_ON;
#define TIMER_3S	1;
#define TIMER_3S_TIMES	50//4ms 1s//步进速度
unsigned short Timer_3S_Times;


unsigned short Key_Reduce_ON_Times;

#define REGULAR_8OZ_WORK_TIME 30
#define REGULAR_12OZ_WORK_TIME 53
#define REGULAR_21OZ_WORK_TIME 60
#define REGULAR_42OZ_WORK_TIME 305

#define BOLD_8OZ_WORK_TIME 75
#define BOLD_12OZ_WORK_TIME 120
#define BOLD_21OZ_WORK_TIME 165
#define BOLD_42OZ_WORK_TIME 365

#define ICED_8OZ_WORK_TIME 75
#define ICED_12OZ_WORK_TIME 120
#define ICED_21OZ_WORK_TIME 125
#define ICED_42OZ_WORK_TIME 195

#define TEA_8OZ_WORK_TIME 20
#define TEA_12OZ_WORK_TIME 110
#define TEA_21OZ_WORK_TIME 170
#define TEA_42OZ_WORK_TIME 330


unsigned char Pattern_Work_Times;//4ms
unsigned short Pattern_Work_Time;//1s
unsigned short PATTERN_WORK_TIME; //

unsigned char Pattern_State;
unsigned char Pattern_Work_State;
//unsigned char Bold_State;
//unsigned char Iced_State;
//unsigned char Tea_State;

//bit Power_On_once;
#define PATTERN_WORKING	4
#define	PATTERN_WORK_ONCE 0
#define PATTERN_WORK__HOTING	1
#define	PATTERN_WORK__HOT_FINSHE	2
#define PATTERN_WORK__TIME_OUT	3
#define PATTERN_WORK_WATAING_35MIN_INIT 4
#define PATTERN_WORK_WATAING_35MIN	5

#define PATTERN_WORK__TIMES	250 //4ms

#define LED_CRT_POWER_ON_INIT 0
#define LED_CRT_POWER_ON 1
#define LED_CRT_OPTION_INIT 2
#define LED_CRT_OPTION 3
#define LED_CRT_FINISH_INIT 4
#define LED_CRT_FINISH 5
unsigned Pattern_LED_Crt;
void LED_Crt();

unsigned char Regular;
unsigned char Bold;
unsigned char Iced;
unsigned char Tea;
unsigned char Add;
unsigned char Reduce;
unsigned char _80_z;
unsigned char _120_z;
unsigned char _210_z;
unsigned char _420_z;
unsigned char Option;
unsigned char Start;

bit Key_Regular_Lock;
bit Key_Bold_Lock;
bit Key_Iced_Lock;
bit Key_Tea_Lock;
bit Key_Add_Lock;
bit Key_Reduce_Lock;
bit Key_80_Z_Lock;
bit Key_120_Z_Lock;
bit Key_210_Z_Lock;
bit Key_420_Z_Lock;
bit Key_Option_Lock;
bit Key_Start_Lock;

signed char Hour=0;
signed char Minute=0;
bit bool_TimeChange;

unsigned char WorkSecond;
unsigned char WorkMinute;
#define WORK_TIME_HZ	250//
#define WORK_TIME_TEMP_DIS_HZ	6//1s
unsigned WortTimeCount;
#define _1_SECOND_HZ	250
unsigned char TimeCounter=0;
unsigned char Second=0;
signed char Water_Temp=95;
bit bool_WaterTempChange;


#define TIME_TEMP_DIS_HZ	1250//
unsigned short Time_Temp_Counter;//4ms
bit Time_Temp_Dis;

void LED_State(void);
void Pattern(void);

#endif