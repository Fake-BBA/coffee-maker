#include "LCD.h"

//数据转换 10进制为99内
void Hex_To_Bcd(unsigned short data,char list)
{
	unsigned char pos=0;
	signed char i=3;
	char BCD[4];
	BCD[0]=0;
	BCD[1]=0;
	BCD[2]=0;
	BCD[3]=0;
	while(data)
	{
		BCD[i--]=data%10;
		data /= 10;
		pos++;
	}
	
	i=0;
	if(list)
	{
		while(pos)
		{
			pos--;
			display[3-i]=LCDCode[BCD[3-i]];
			i++;
		}
	}
	else
	{
		while(pos)
		{
			pos--;
			display[i]=LCDCode[BCD[3-pos]];
			
			i++;
		}
	}
}

void Hex_To_Temp(signed char data)
{
	//unsigned char pos=0;
	signed char i;
	char BCD[3];
	BCD[0];
	BCD[1];
	BCD[2];
	if(data>=100) 
	{
		i=2;	
		display[3]=LCDCode[12];
	}
	else 
	{
		i=1;
		BCD[2]=12;
		display[3]=LCDCode[10];
	}
		
	while(data)
	{
		BCD[i--]=data%10;
		data /= 10;
		//pos++;
	}
	display[0]=LCDCode[BCD[0]];
	display[1]=LCDCode[BCD[1]];
	display[2]=LCDCode[BCD[2]];

	
		
}

void Cheak_LCD()
{
			TRISC &= 0B11000011;
			if(com_count)
			{
				P_COM1 = 0;
				P_COM2 = 0;
				P_COM3 = 0;
				P_COM4 = 0;
				SEG1_SET();
				SEG2_SET();
				SEG3_SET();
				SEG4_SET();
				SEG5_SET();
				SEG6_SET();
				SEG7_SET();
				SEG8_SET();
			}
			else
			{
				P_COM1 = 1;
				P_COM2 = 1;
				P_COM3 = 1;
				P_COM4 = 1;
				SEG1_CLR();
				SEG2_CLR();
				SEG3_CLR();
				SEG4_CLR();
				SEG5_CLR();
				SEG6_CLR();
				SEG7_CLR();
				SEG8_CLR();
			}
			com_count=~com_count;
	
}
void Set_Disp()
{
	

			TRISC = 0B10111100;
			
			
			if(com_count&0x01)
			{
				Temp_595[SEG0_8]=0XFF;
			}
			else
			{
				Temp_595[SEG0_8]=0X00;
			}
			
			switch(com_count)	
			{	
				case 0:	
											
				if(SMG1_DATA & B)  {SEG1_SET();}		//1B	 
				if(SMG1_DATA & A)  {SEG2_SET();}		//1A					 
				if(SMG4_DATA & B)  {SEG3_SET();}		//4B
				if(SMG4_DATA & A)  {SEG4_SET();}		//4A			
				if(SMG3_DATA & B)  {SEG5_SET();}		//3B
				if(SMG3_DATA & A)  {SEG6_SET();}		//3A
				if(SMG2_DATA & B)  {SEG7_SET();}		//2B
				if(SMG2_DATA & A)  {SEG8_SET();}		//2A
				
				_74HC595_SET();
				
				COMEN  =0B00111000;
				P_COM1 = 0;				
				TRISC = 0B10111000;  //	显示的COM口设为输出，其余3个设为输入 	
				P_COM1 = 0;	
																									 
				break;		
			case 1:
	
				if(SMG1_DATA & B)  {SEG1_CLR();}		//1B	 
				if(SMG1_DATA & A)  {SEG2_CLR();}		//1A					 
				if(SMG4_DATA & B)  {SEG3_CLR();}		//4B
				if(SMG4_DATA & A)  {SEG4_CLR();}		//4A			
				if(SMG3_DATA & B)  {SEG5_CLR();}		//3B
				if(SMG3_DATA & A)  {SEG6_CLR();}		//3A
				if(SMG2_DATA & B)  {SEG7_CLR();}		//2B
				if(SMG2_DATA & A)  {SEG8_CLR();}		//2A
				
				_74HC595_SET();
				
				COMEN  =0B00111000;
				P_COM1 = 1;	
				TRISC = 0B10111000;  //显示的COM口设为输出，其余3个设为输入	
				P_COM1 = 1;		
				break;
				
			case 2:
		
				if(SMG1_DATA & G)  {SEG1_SET();}		//1G	 
				if(SMG1_DATA & F)  {SEG2_SET();}		//1F					 
				if(SMG4_DATA & G)  {SEG3_SET();}		//4G
				if(SMG4_DATA & F)  {SEG4_SET();}		//4F			
				if(SMG3_DATA & G)  {SEG5_SET();}		//3G
				if(SMG3_DATA & F)  {SEG6_SET();}		//3F
				if(SMG2_DATA & G)  {SEG7_SET();}		//2G
				if(SMG2_DATA & F)  {SEG8_SET();}		//2F
				
				_74HC595_SET();
					
				COMEN  =0B00110100; 	
				P_COM2 = 0;
				TRISC = 0B10110100;  //显示的COM口设为输出，其余3个设为输入		
				P_COM2 = 0;	
				
				break;
			case 3:
				
				if(SMG1_DATA & G)  {SEG1_CLR();}		//1G	 
				if(SMG1_DATA & F)  {SEG2_CLR();}		//1F					 
				if(SMG4_DATA & G)  {SEG3_CLR();}		//4G
				if(SMG4_DATA & F)  {SEG4_CLR();}		//4F			
				if(SMG3_DATA & G)  {SEG5_CLR();}		//3G
				if(SMG3_DATA & F)  {SEG6_CLR();}		//3F
				if(SMG2_DATA & G)  {SEG7_CLR();}		//2G
				if(SMG2_DATA & F)  {SEG8_CLR();}		//2F
				
				_74HC595_SET();
					
				COMEN  =0B00110100; 		
				P_COM2 = 1;
				TRISC = 0B10110100;  //显示的COM口设为输出，其余3个设为输入	
				P_COM2 = 1;	
				break;
			
			case 4:	
					
				if(SMG1_DATA & C)  {SEG1_SET();}		//1C	 
				if(SMG1_DATA & E)  {SEG2_SET();}		//1E					 
				if(SMG4_DATA & C)  {SEG3_SET();}		//4C
				if(SMG4_DATA & E)  {SEG4_SET();}		//4E			
				if(SMG3_DATA & C)  {SEG5_SET();}		//3C
				if(SMG3_DATA & E)  {SEG6_SET();}		//3E
				if(SMG2_DATA & C)  {SEG7_SET();}		//2C
				if(SMG2_DATA & E)  {SEG8_SET();}		//2E
				
				_74HC595_SET();
				
				COMEN  =0B00101100;	
				P_COM3 = 0;	
				TRISC = 0B10101100;  //显示的COM口设为输出，其余3个设为输入	
				P_COM3 = 0;		
				break;
			case 5:
				
				if(SMG1_DATA & C)  {SEG1_CLR();}		//1C	 
				if(SMG1_DATA & E)  {SEG2_CLR();}		//1E					 
				if(SMG4_DATA & C)  {SEG3_CLR();}		//4C
				if(SMG4_DATA & E)  {SEG4_CLR();}		//4E			
				if(SMG3_DATA & C)  {SEG5_CLR();}		//3C
				if(SMG3_DATA & E)  {SEG6_CLR();}		//3E
				if(SMG2_DATA & C)  {SEG7_CLR();}		//2C
				if(SMG2_DATA & E)  {SEG8_CLR();}		//2E
				
				_74HC595_SET();
				 
				COMEN  =0B00101100;	
				P_COM3 = 1;		
				TRISC = 0B10101100;  //显示的COM口设为输出，其余3个设为输入	
				P_COM3 = 1;
				break;
				
			case 6:
	 
				if(SMG1_DATA & D)  {SEG2_SET();}		//1D					 
				if(SMG2_DATA & D)  {SEG8_SET();}		//2D
				if(SMG3_DATA & D)  {SEG6_SET();}		//3D
				if(SMG4_DATA & D)  {SEG4_SET();}		//4D
				
				if(ICO & ICO_TEMP)  {SEG1_SET();}	//
				if(ICO & ICO_TIMER)  {SEG3_SET();}	//
				if(ICO & ICO_AUTO)  {SEG5_SET();;}	//
				if(ICO & ICO_COL)  {SEG7_SET();}	//
				
				_74HC595_SET();
					
				COMEN  =0B00011100; 
				P_COM4 = 0;		
				TRISC = 0B10011100;  //显示的COM口设为输出，其余3个设为输入	
				P_COM4 = 0;	
				break;
			case 7:
	
				if(SMG1_DATA & D)  {SEG2_CLR();}		//1D					 
				if(SMG2_DATA & D)  {SEG8_CLR();}		//2D
				if(SMG3_DATA & D)  {SEG6_CLR();}		//3D
				if(SMG4_DATA & D)  {SEG4_CLR();}		//4D
				
				if(ICO & ICO_TEMP)  {SEG1_CLR();}	//
				if(ICO & ICO_TIMER)  {SEG3_CLR();}	//
				if(ICO & ICO_AUTO)  {SEG5_CLR();}	//
				if(ICO & ICO_COL)  {SEG7_CLR();}	//
				
				_74HC595_SET();
					
				COMEN  =0B00011100;
				P_COM4 = 1;		
				TRISC = 0B10011100; //显示的COM口设为输出，其余3个设为输入	
				P_COM4 = 1;
				break;			     					
			}
			
			com_count++; 	
			if( com_count>=8)  
			{
				com_count = 0;
			}	
}