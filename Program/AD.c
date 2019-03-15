#include "AD.h"

//下拉电阻39.000000 K
const unsigned short TempTab[][2]={427,447,  //0'C
447,471,  //1'C
471,496,  //2'C
496,522,  //3'C
522,548,  //4'C
549,572,  //5'C
573,593,  //6'C
594,614,  //7'C
615,636,  //8'C
637,659,  //9'C
659,684,  //10'C
684,711,  //11'C
712,739,  //12'C
740,768,  //13'C
768,797,  //14'C
798,828,  //15'C
828,859,  //16'C
860,891,  //17'C
891,923,  //18'C
923,956,  //19'C
957,990,  //20'C
990,1024,  //21'C
1025,1059,  //22'C
1059,1094,  //23'C
1095,1131,  //24'C
1131,1166,  //25'C
1167,1203,  //26'C
1204,1241,  //27'C
1241,1278,  //28'C
1278,1316,  //29'C
1316,1354,  //30'C
1355,1394,  //31'C
1394,1433,  //32'C
1434,1473,  //33'C
1473,1513,  //34'C
1513,1553,  //35'C
1553,1592,  //36'C
1593,1633,  //37'C
1633,1672,  //38'C
1673,1713,  //39'C
1713,1753,  //40'C
1754,1794,  //41'C
1794,1835,  //42'C
1835,1875,  //43'C
1876,1916,  //44'C
1916,1956,  //45'C
1957,1997,  //46'C
1997,2037,  //47'C
2038,2078,  //48'C
2078,2119,  //49'C
2117,2159,  //50'C
2156,2198,  //51'C
2195,2238,  //52'C
2233,2277,  //53'C
2271,2315,  //54'C
2309,2354,  //55'C
2346,2391,  //56'C
2383,2429,  //57'C
2419,2465,  //58'C
2455,2502,  //59'C
2491,2537,  //60'C
2525,2572,  //61'C
2559,2606,  //62'C
2593,2640,  //63'C
2626,2673,  //64'C
2658,2706,  //65'C
2691,2739,  //66'C
2723,2771,  //67'C
2754,2802,  //68'C
2785,2833,  //69'C
2815,2863,  //70'C
2844,2892,  //71'C
2873,2921,  //72'C
2901,2949,  //73'C
2929,2976,  //74'C
2956,3003,  //75'C
2984,3031,  //76'C
3011,3058,  //77'C
3038,3084,  //78'C
3064,3110,  //79'C
3089,3135,  //80'C
3114,3160,  //81'C
3138,3183,  //82'C
3161,3207,  //83'C
3184,3229,  //84'C
3207,3251,  //85'C
3229,3273,  //86'C
3250,3294,  //87'C
3271,3314,  //88'C
3292,3335,  //89'C
3312,3354,  //90'C
3331,3373,  //91'C
3350,3392,  //92'C
3369,3410,  //93'C
3387,3428,  //94'C
3405,3445,  //95'C
3422,3462,  //96'C
3439,3478,  //97'C
3455,3493,  //98'C
3471,3509,  //99'C
3486,3523,  //100'C
3501,3538,  //101'C
3516,3553,  //102'C
3531,3567,  //103'C
3545,3581,  //104'C
3559,3594,  //105'C
};

/************************************************************
函数名称：AD_Sample
函数功能：AD采样函数
入口参数：ADCH,AD通道
出口参数：ADRESH,ADRESL
备    注：采样成功返回1,超时返回0   
************************************************************/
unsigned char AD_Sample(unsigned char adch)
{
	HOT_BOTTOM_ON();		//开启ADC检测电流开关
	//Bit7 ADFM：A/D转换结果格式选择位
	//1=右对齐
	//0=左对齐
	//Bit6-0 未用，读为0
	ADCON1 = 0;	//左对齐
	
	//Bit7-6 ADCS<1:0>：A/D转换时钟选择位00=FOSC/8,01=FOSC/16,10=FOSC/32	
	//Bit5-2 CHS<3:0>：模拟通道选择位
	//0000=AN0,0001=AN1,0010=AN2,0011=AN3,0100=AN4,0101=AN5,0110=AN6,0111=AN7,1000=AN8,1001=AN9,1010=AN10
	//1011=AN11,1100=AN12,1101=AN13,1110=CVREF,1111=固定参考电压（0.6V 固定参考电压）
	//Bit1 GO/DONE：A/D转换状态位,1=A/D转换正在进行。将该位置1启动A/D转换。当A/D转换完成以后，该位由硬件自动清零。
	//0=A/D 转换完成/或不在进行中,Bit0 ADON：ADC使能位
	//1=使能ADC
	//0=禁止ADC，不消耗工作电流				
	ADCON0 = 0X041 | (adch << 2);	//16分频
	
	//AD 数据寄存器高位 ADRESH(1EH)，ADFM=0
	//Bit7-0 ADRES<9:2>：ADC结果寄存器位12 位转换结果的高 8位
	
	//AD 数据寄存器低位 ADRESL(9EH)，ADFM=0
	//Bit7-6 ADRES<1:0>：ADC结果寄存器位
	//12 位转换结果的低 4位
	//Bit5-0 未用
	
	asm("nop");
	asm("nop");
	//GODONE = 0;
	GODONE = 1;						//开始转换
	BreakTimeOut = 0xff;
	while(GODONE)
	{
		if(0 == (--BreakTimeOut))
		{				//ad等待限时，防止拔插电后出现死循环
			//asm("clrwdt");
			return 0;
		}
	}
	return 1;
}	

/************************************************************
函数名称：NtcAD_Testing()
函数功能：温度传感器采样函数
入口参数：
出口参数：Flag_Ntc_OneAd、AdResult_8bit、AdResult_10bit
备    注：采样NTC的AD值,采样10次,去掉最大及最小求算术平均值 
************************************************************/
void NtcAD_Testing(unsigned char i)
{
	static volatile unsigned char  adtimes=0;	
	static volatile unsigned short   admin,admax=0,adsum=0;
	volatile unsigned short data;
    static volatile signed char range=0;//离之前温度距离的搜索范围
	static volatile signed char TAB_pos=0;//温度表索引
	
	//AD 数据寄存器高位 ADRESH(1EH)，ADFM=0
	//Bit7-0 ADRES<9:2>：ADC结果寄存器位12 位转换结果的高 8位
	
	//AD 数据寄存器低位 ADRESL(9EH)，ADFM=0
	//Bit7-6 ADRES<1:0>：ADC结果寄存器位
	//12 位转换结果的低 4位
	//Bit5-0 未用
    if(AD_Sample(i))
	{ 
		
		data = (ADRESH<<4);
		data |= (ADRESL>>4);         
 
		if(0 == admax)
		{
			admax = data;
			admin = data;	
		}
		else if(data > admax)
		{
			admax = data;  //AD采样最大值
		}
		else if(data < admin)
		{
			admin = data;  //AD采样最小值
		}
		adsum += data;
		if(++adtimes >= 8)
		{
			adsum -= admax;
			adsum -= admin;			
			
			AdResult_12bit=adsum/6;
			range=0;
			BreakTimeOut = 106;
			while(BreakTimeOut--)
			{
				//asm("clrwdt");
				TAB_pos=Temperature_Dat+range;
				if(TAB_pos<=105)
				{
					if((AdResult_12bit>=TempTab[TAB_pos][0])&&(AdResult_12bit<=TempTab[TAB_pos][1]))
					{	
							Temperature_Dat=TAB_pos;
							break;
					}
				}	
				TAB_pos=Temperature_Dat-range;
				if(TAB_pos>=0)
				{			
					if(AdResult_12bit<=TempTab[TAB_pos][1]&&AdResult_12bit>=TempTab[TAB_pos][0])
					{
						Temperature_Dat=TAB_pos;
						break;
					}
				}
				range++;
				if(AdResult_12bit>=TempTab[105][1])
				{
					Temperature_Dat=105;
					break;
				}
				
			}
			adsum = 0;
			admin = 0;
			admax = 0;
			adtimes = 0;		
			
		}
	}
	else
	{
		adsum = 0;
		admin = 0;
		admax = 0;
		//adtimes = 0;
	}	
}


/************************************************************
函数名称：DealTmpr
函数功能：水温检测及处理函数
入口参数：
出口参数：
备    注：检测并处理水温
************************************************************/
void DealTmpr()
{	
	NtcAD_Testing(C_NTC_ADCH);

}


