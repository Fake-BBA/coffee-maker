//**********************************************************
//**********************************************************
//此文件由CTouch V1.06创建
//文 件 名:Touch_Kscan_Library.h
//创建时间:2017年09月15日 21:09:01
//**********************************************************
//**********************************************************

#ifndef	_TOUCH_KSCAN_LIBRARY_H_
#define	_TOUCH_KSCAN_LIBRARY_H_
#include	"TouchKeyConst.h"


//接口函数声明
extern void CheckTouchKey(void);	//按键扫描主过程函数,建议在2.5ms~5ms内调用
extern volatile bit b_kerr;			//复位按键标志,将其置1可以重置全部按键

//每个按键对应于寄存器的1个位,由高至低一一对应
//KeyFlag[0]对应于Key7,...,Key1,Key0
//KeyFlag[1]对应于Key15,...,Key9,Key8
//按键有效时相应位为1,无效时为0
extern volatile unsigned char KeyFlag[2];

//防水模式选择,不定义则为组合键模式
#define		WaterMode

//同时最大允许有效按键数,超过该值将认为是干扰
#define		C_VALID_KEY		1

//按键最大允许生效时间(单位：ms),以4ms调用基准换算,为0时将忽略
#define		C_VALID_TIME	60*(1000/4)

//按键消抖次数
#define		C_KEY_SHAKE		2

//待检测按键总数
#define		C_KEY_TOTAL		12

//内部比较器参考电压设定,在下列值中选取
//C_KVREF_04	=>	0.4VDD
//C_KVREF_05	=>	0.5VDD
//C_KVREF_06	=>	0.6VDD
//C_KVREF_07	=>	0.7VDD
#define		C_KVREF			C_KVREF_05

//转换时钟设定,在下列值中选取,建议选择4分频
//C_KCLK_SYS	=>	系统时钟
//C_KCLK_SYS2	=>	系统时钟的2分频
//C_KCLK_SYS4	=>	系统时钟的4分频
//C_KCLK_SYS8	=>	系统时钟的8分频
#define		C_KCLK			C_KCLK_SYS2


//检测通道设定,为C_KCHS0至C_KCHS15其中之一
//未设定的通道默认为C_KCHS0
const unsigned char Table_KeyChannel[] = {
	C_KCHS10,		//按键1对应触摸通道
	C_KCHS11,		//按键2对应触摸通道
	C_KCHS12,		//按键3对应触摸通道
	C_KCHS14,		//按键4对应触摸通道
	C_KCHS13,		//按键5对应触摸通道
	C_KCHS15,		//按键6对应触摸通道
	C_KCHS1,		//按键7对应触摸通道
	C_KCHS4,		//按键8对应触摸通道
	C_KCHS3,		//按键9对应触摸通道
	C_KCHS5,		//按键10对应触摸通道
	C_KCHS2,		//按键11对应触摸通道
	C_KCHS0			//按键12对应触摸通道
};

//内部并联电容选择,用来调整长短线,以最长的线为0,适当调大短线的值,范围:C_KCAP0至C_KCAP7
const unsigned char Table_KeyCap[] = {
	C_KCAP2,		//按键1内部并联电容
	C_KCAP2,		//按键2内部并联电容
	C_KCAP2,		//按键3内部并联电容
	C_KCAP2,		//按键4内部并联电容
	C_KCAP2,		//按键5内部并联电容
	C_KCAP2,		//按键6内部并联电容
	C_KCAP2,		//按键7内部并联电容
	C_KCAP2,		//按键8内部并联电容
	C_KCAP2,		//按键9内部并联电容
	C_KCAP2,		//按键10内部并联电容
	C_KCAP2,		//按键11内部并联电容
	C_KCAP2			//按键12内部并联电容
};

//灵敏度选择,调整长短线后再用这个修正灵敏度差异,设定值不可低于5
const unsigned char Table_KeyDown[] = {
	5,				//按键1灵敏度设定值
	5,				//按键2灵敏度设定值
	5,				//按键3灵敏度设定值
	5,				//按键4灵敏度设定值
	5,				//按键5灵敏度设定值
	5,				//按键6灵敏度设定值
	5,				//按键7灵敏度设定值
	5,				//按键8灵敏度设定值
	5,				//按键9灵敏度设定值
	5,				//按键10灵敏度设定值
	5,				//按键11灵敏度设定值
	5				//按键12灵敏度设定值
};






/***********************************************************
下面的内容请勿修改
***********************************************************/
unsigned int KeyResSum[C_KEY_TOTAL];
unsigned int KeyOldValue0[C_KEY_TOTAL];
unsigned int KeyOldValue1[C_KEY_TOTAL];
unsigned int KeyOldValue2[C_KEY_TOTAL];
unsigned int KeyReference[C_KEY_TOTAL];
unsigned char KeyUpShake[C_KEY_TOTAL];

const unsigned int KeyValidTime = C_VALID_TIME;
const unsigned char KeyTotalNumber = C_KEY_TOTAL;
const unsigned char KeyShakeCounter = C_KEY_SHAKE;
const unsigned char KeyValidNumber = C_VALID_KEY;

#ifdef WaterMode
const unsigned char WaterModeSel = 1;
#else
const unsigned char WaterModeSel = 0;
#endif

#endif
