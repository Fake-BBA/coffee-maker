#include "74HC595.h"



void _74HC595_SET()
{
	signed char i,j;
	for(i=0;i<3;i++)
		for(j=0;j<8;j++)
		{
			if(Temp_595[i]&(1<<j))
			{
				_74HC595_DS=1;
			}
			else
			{
				_74HC595_DS=0;
			}
			_74HC595_SH_CP=1;
			_74HC595_SH_CP=0;
		}
		
	_74HC595_ST_CP=1;
	_74HC595_ST_CP=0;
}