//**********************************************************
//**********************************************************
//���ļ���CTouch V1.06����
//�� �� ��:Touch_Kscan_Library.h
//����ʱ��:2017��09��15�� 21:09:01
//**********************************************************
//**********************************************************

#ifndef	_TOUCH_KSCAN_LIBRARY_H_
#define	_TOUCH_KSCAN_LIBRARY_H_
#include	"TouchKeyConst.h"


//�ӿں�������
extern void CheckTouchKey(void);	//����ɨ�������̺���,������2.5ms~5ms�ڵ���
extern volatile bit b_kerr;			//��λ������־,������1��������ȫ������

//ÿ��������Ӧ�ڼĴ�����1��λ,�ɸ�����һһ��Ӧ
//KeyFlag[0]��Ӧ��Key7,...,Key1,Key0
//KeyFlag[1]��Ӧ��Key15,...,Key9,Key8
//������Чʱ��ӦλΪ1,��ЧʱΪ0
extern volatile unsigned char KeyFlag[2];

//��ˮģʽѡ��,��������Ϊ��ϼ�ģʽ
#define		WaterMode

//ͬʱ���������Ч������,������ֵ����Ϊ�Ǹ���
#define		C_VALID_KEY		1

//�������������Чʱ��(��λ��ms),��4ms���û�׼����,Ϊ0ʱ������
#define		C_VALID_TIME	60*(1000/4)

//������������
#define		C_KEY_SHAKE		2

//����ⰴ������
#define		C_KEY_TOTAL		12

//�ڲ��Ƚ����ο���ѹ�趨,������ֵ��ѡȡ
//C_KVREF_04	=>	0.4VDD
//C_KVREF_05	=>	0.5VDD
//C_KVREF_06	=>	0.6VDD
//C_KVREF_07	=>	0.7VDD
#define		C_KVREF			C_KVREF_05

//ת��ʱ���趨,������ֵ��ѡȡ,����ѡ��4��Ƶ
//C_KCLK_SYS	=>	ϵͳʱ��
//C_KCLK_SYS2	=>	ϵͳʱ�ӵ�2��Ƶ
//C_KCLK_SYS4	=>	ϵͳʱ�ӵ�4��Ƶ
//C_KCLK_SYS8	=>	ϵͳʱ�ӵ�8��Ƶ
#define		C_KCLK			C_KCLK_SYS2


//���ͨ���趨,ΪC_KCHS0��C_KCHS15����֮һ
//δ�趨��ͨ��Ĭ��ΪC_KCHS0
const unsigned char Table_KeyChannel[] = {
	C_KCHS10,		//����1��Ӧ����ͨ��
	C_KCHS11,		//����2��Ӧ����ͨ��
	C_KCHS12,		//����3��Ӧ����ͨ��
	C_KCHS14,		//����4��Ӧ����ͨ��
	C_KCHS13,		//����5��Ӧ����ͨ��
	C_KCHS15,		//����6��Ӧ����ͨ��
	C_KCHS1,		//����7��Ӧ����ͨ��
	C_KCHS4,		//����8��Ӧ����ͨ��
	C_KCHS3,		//����9��Ӧ����ͨ��
	C_KCHS5,		//����10��Ӧ����ͨ��
	C_KCHS2,		//����11��Ӧ����ͨ��
	C_KCHS0			//����12��Ӧ����ͨ��
};

//�ڲ���������ѡ��,��������������,�������Ϊ0,�ʵ�������ߵ�ֵ,��Χ:C_KCAP0��C_KCAP7
const unsigned char Table_KeyCap[] = {
	C_KCAP2,		//����1�ڲ���������
	C_KCAP2,		//����2�ڲ���������
	C_KCAP2,		//����3�ڲ���������
	C_KCAP2,		//����4�ڲ���������
	C_KCAP2,		//����5�ڲ���������
	C_KCAP2,		//����6�ڲ���������
	C_KCAP2,		//����7�ڲ���������
	C_KCAP2,		//����8�ڲ���������
	C_KCAP2,		//����9�ڲ���������
	C_KCAP2,		//����10�ڲ���������
	C_KCAP2,		//����11�ڲ���������
	C_KCAP2			//����12�ڲ���������
};

//������ѡ��,���������ߺ�����������������Ȳ���,�趨ֵ���ɵ���5
const unsigned char Table_KeyDown[] = {
	5,				//����1�������趨ֵ
	5,				//����2�������趨ֵ
	5,				//����3�������趨ֵ
	5,				//����4�������趨ֵ
	5,				//����5�������趨ֵ
	5,				//����6�������趨ֵ
	5,				//����7�������趨ֵ
	5,				//����8�������趨ֵ
	5,				//����9�������趨ֵ
	5,				//����10�������趨ֵ
	5,				//����11�������趨ֵ
	5				//����12�������趨ֵ
};






/***********************************************************
��������������޸�
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
