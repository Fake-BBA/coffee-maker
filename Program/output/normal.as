opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	89F6385
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_Init_System
	FNCALL	_main,__74HC595_SET
	FNCALL	_main,_AcTestZero
	FNCALL	_main,_ShutDowm_Device
	FNCALL	_main,_CheckTouchKey
	FNCALL	_main,_KeyServer
	FNCALL	_main,_Pattern
	FNCALL	_main,_LCD_FState
	FNCALL	_main,_CheckBuzzer
	FNCALL	_main,_LED_State
	FNCALL	_main,_Solenoid_State_F
	FNCALL	_main,_HOT_MAJOR_State_F
	FNCALL	_main,_NtcAD_Testing
	FNCALL	_CheckTouchKey,_GetTouchKeyValue
	FNCALL	_CheckTouchKey,_CheckOnceResult
	FNCALL	_CheckTouchKey,_TurnKeyFlags
	FNCALL	_CheckTouchKey,_KeyStopClear
	FNCALL	_CheckTouchKey,_CheckKeyOldValue
	FNCALL	_CheckTouchKey,_ClearResSum
	FNCALL	_CheckTouchKey,_CheckValidTime
	FNCALL	_TurnKeyFlags,_KeyClearIn
	FNCALL	_Pattern,_LED_Crt
	FNCALL	_Pattern,___awdiv
	FNCALL	_Pattern,___awmod
	FNCALL	_Pattern,___lbdiv
	FNCALL	_Pattern,___lbmod
	FNCALL	_Pattern,_Hex_To_Temp
	FNCALL	_CheckKeyOldValue,_KeyIsIn
	FNCALL	_CheckOnceResult,_KeyIsIn
	FNCALL	_CheckOnceResult,_KeyHave
	FNCALL	_CheckOnceResult,_KeyClearOne
	FNCALL	_GetTouchKeyValue,_ClearResSum
	FNCALL	_KeyStopClear,_KeyClearOne
	FNCALL	_KeyClearIn,_KeyIsIn
	FNCALL	_KeyClearIn,_KeyClearOne
	FNCALL	_Hex_To_Temp,___awmod
	FNCALL	_Hex_To_Temp,___lbdiv
	FNCALL	_NtcAD_Testing,_AD_Sample
	FNCALL	_NtcAD_Testing,___lwdiv
	FNCALL	_ShutDowm_Device,__74HC595_SET
	FNCALL	_Init_System,__74HC595_SET
	FNCALL	_Init_System,_DelayX
	FNROOT	_main
	FNCALL	_Isr_Timer,_Set_Disp
	FNCALL	_Set_Disp,i1__74HC595_SET
	FNCALL	intlevel1,_Isr_Timer
	global	intlevel1
	FNROOT	intlevel1
	global	_BuzzerTime
	global	_Temperature_Dat
	global	_Water_Temp
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_function.h"
	line	116

;initializer for _BuzzerTime
	retlw	028h
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\AD.h"
	line	18

;initializer for _Temperature_Dat
	retlw	032h
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_function.h"
	line	363

;initializer for _Water_Temp
	retlw	05Fh
	global	_TempTab
psect	stringtext,class=STRCODE,delta=2,reloc=256
global __pstringtext
__pstringtext:
;	global	stringtab,__stringbase
stringtab:
;	String table - string pointers are 2 bytes each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:
	movf btemp+1,w
andlw 7Fh
movwf	pclath
	movf	fsr,w
incf fsr
skipnz
incf btemp+1
	movwf pc
__stringbase:
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\AD.c"
	line	4
_TempTab:
	retlw	0ABh
	retlw	01h

	retlw	0BFh
	retlw	01h

	retlw	0BFh
	retlw	01h

	retlw	0D7h
	retlw	01h

	retlw	0D7h
	retlw	01h

	retlw	0F0h
	retlw	01h

	retlw	0F0h
	retlw	01h

	retlw	0Ah
	retlw	02h

	retlw	0Ah
	retlw	02h

	retlw	024h
	retlw	02h

	retlw	025h
	retlw	02h

	retlw	03Ch
	retlw	02h

	retlw	03Dh
	retlw	02h

	retlw	051h
	retlw	02h

	retlw	052h
	retlw	02h

	retlw	066h
	retlw	02h

	retlw	067h
	retlw	02h

	retlw	07Ch
	retlw	02h

	retlw	07Dh
	retlw	02h

	retlw	093h
	retlw	02h

	retlw	093h
	retlw	02h

	retlw	0ACh
	retlw	02h

	retlw	0ACh
	retlw	02h

	retlw	0C7h
	retlw	02h

	retlw	0C8h
	retlw	02h

	retlw	0E3h
	retlw	02h

	retlw	0E4h
	retlw	02h

	retlw	0
	retlw	03h

	retlw	0
	retlw	03h

	retlw	01Dh
	retlw	03h

	retlw	01Eh
	retlw	03h

	retlw	03Ch
	retlw	03h

	retlw	03Ch
	retlw	03h

	retlw	05Bh
	retlw	03h

	retlw	05Ch
	retlw	03h

	retlw	07Bh
	retlw	03h

	retlw	07Bh
	retlw	03h

	retlw	09Bh
	retlw	03h

	retlw	09Bh
	retlw	03h

	retlw	0BCh
	retlw	03h

	retlw	0BDh
	retlw	03h

	retlw	0DEh
	retlw	03h

	retlw	0DEh
	retlw	03h

	retlw	0
	retlw	04h

	retlw	01h
	retlw	04h

	retlw	023h
	retlw	04h

	retlw	023h
	retlw	04h

	retlw	046h
	retlw	04h

	retlw	047h
	retlw	04h

	retlw	06Bh
	retlw	04h

	retlw	06Bh
	retlw	04h

	retlw	08Eh
	retlw	04h

	retlw	08Fh
	retlw	04h

	retlw	0B3h
	retlw	04h

	retlw	0B4h
	retlw	04h

	retlw	0D9h
	retlw	04h

	retlw	0D9h
	retlw	04h

	retlw	0FEh
	retlw	04h

	retlw	0FEh
	retlw	04h

	retlw	024h
	retlw	05h

	retlw	024h
	retlw	05h

	retlw	04Ah
	retlw	05h

	retlw	04Bh
	retlw	05h

	retlw	072h
	retlw	05h

	retlw	072h
	retlw	05h

	retlw	099h
	retlw	05h

	retlw	09Ah
	retlw	05h

	retlw	0C1h
	retlw	05h

	retlw	0C1h
	retlw	05h

	retlw	0E9h
	retlw	05h

	retlw	0E9h
	retlw	05h

	retlw	011h
	retlw	06h

	retlw	011h
	retlw	06h

	retlw	038h
	retlw	06h

	retlw	039h
	retlw	06h

	retlw	061h
	retlw	06h

	retlw	061h
	retlw	06h

	retlw	088h
	retlw	06h

	retlw	089h
	retlw	06h

	retlw	0B1h
	retlw	06h

	retlw	0B1h
	retlw	06h

	retlw	0D9h
	retlw	06h

	retlw	0DAh
	retlw	06h

	retlw	02h
	retlw	07h

	retlw	02h
	retlw	07h

	retlw	02Bh
	retlw	07h

	retlw	02Bh
	retlw	07h

	retlw	053h
	retlw	07h

	retlw	054h
	retlw	07h

	retlw	07Ch
	retlw	07h

	retlw	07Ch
	retlw	07h

	retlw	0A4h
	retlw	07h

	retlw	0A5h
	retlw	07h

	retlw	0CDh
	retlw	07h

	retlw	0CDh
	retlw	07h

	retlw	0F5h
	retlw	07h

	retlw	0F6h
	retlw	07h

	retlw	01Eh
	retlw	08h

	retlw	01Eh
	retlw	08h

	retlw	047h
	retlw	08h

	retlw	045h
	retlw	08h

	retlw	06Fh
	retlw	08h

	retlw	06Ch
	retlw	08h

	retlw	096h
	retlw	08h

	retlw	093h
	retlw	08h

	retlw	0BEh
	retlw	08h

	retlw	0B9h
	retlw	08h

	retlw	0E5h
	retlw	08h

	retlw	0DFh
	retlw	08h

	retlw	0Bh
	retlw	09h

	retlw	05h
	retlw	09h

	retlw	032h
	retlw	09h

	retlw	02Ah
	retlw	09h

	retlw	057h
	retlw	09h

	retlw	04Fh
	retlw	09h

	retlw	07Dh
	retlw	09h

	retlw	073h
	retlw	09h

	retlw	0A1h
	retlw	09h

	retlw	097h
	retlw	09h

	retlw	0C6h
	retlw	09h

	retlw	0BBh
	retlw	09h

	retlw	0E9h
	retlw	09h

	retlw	0DDh
	retlw	09h

	retlw	0Ch
	retlw	0Ah

	retlw	0FFh
	retlw	09h

	retlw	02Eh
	retlw	0Ah

	retlw	021h
	retlw	0Ah

	retlw	050h
	retlw	0Ah

	retlw	042h
	retlw	0Ah

	retlw	071h
	retlw	0Ah

	retlw	062h
	retlw	0Ah

	retlw	092h
	retlw	0Ah

	retlw	083h
	retlw	0Ah

	retlw	0B3h
	retlw	0Ah

	retlw	0A3h
	retlw	0Ah

	retlw	0D3h
	retlw	0Ah

	retlw	0C2h
	retlw	0Ah

	retlw	0F2h
	retlw	0Ah

	retlw	0E1h
	retlw	0Ah

	retlw	011h
	retlw	0Bh

	retlw	0FFh
	retlw	0Ah

	retlw	02Fh
	retlw	0Bh

	retlw	01Ch
	retlw	0Bh

	retlw	04Ch
	retlw	0Bh

	retlw	039h
	retlw	0Bh

	retlw	069h
	retlw	0Bh

	retlw	055h
	retlw	0Bh

	retlw	085h
	retlw	0Bh

	retlw	071h
	retlw	0Bh

	retlw	0A0h
	retlw	0Bh

	retlw	08Ch
	retlw	0Bh

	retlw	0BBh
	retlw	0Bh

	retlw	0A8h
	retlw	0Bh

	retlw	0D7h
	retlw	0Bh

	retlw	0C3h
	retlw	0Bh

	retlw	0F2h
	retlw	0Bh

	retlw	0DEh
	retlw	0Bh

	retlw	0Ch
	retlw	0Ch

	retlw	0F8h
	retlw	0Bh

	retlw	026h
	retlw	0Ch

	retlw	011h
	retlw	0Ch

	retlw	03Fh
	retlw	0Ch

	retlw	02Ah
	retlw	0Ch

	retlw	058h
	retlw	0Ch

	retlw	042h
	retlw	0Ch

	retlw	06Fh
	retlw	0Ch

	retlw	059h
	retlw	0Ch

	retlw	087h
	retlw	0Ch

	retlw	070h
	retlw	0Ch

	retlw	09Dh
	retlw	0Ch

	retlw	087h
	retlw	0Ch

	retlw	0B3h
	retlw	0Ch

	retlw	09Dh
	retlw	0Ch

	retlw	0C9h
	retlw	0Ch

	retlw	0B2h
	retlw	0Ch

	retlw	0DEh
	retlw	0Ch

	retlw	0C7h
	retlw	0Ch

	retlw	0F2h
	retlw	0Ch

	retlw	0DCh
	retlw	0Ch

	retlw	07h
	retlw	0Dh

	retlw	0F0h
	retlw	0Ch

	retlw	01Ah
	retlw	0Dh

	retlw	03h
	retlw	0Dh

	retlw	02Dh
	retlw	0Dh

	retlw	016h
	retlw	0Dh

	retlw	040h
	retlw	0Dh

	retlw	029h
	retlw	0Dh

	retlw	052h
	retlw	0Dh

	retlw	03Bh
	retlw	0Dh

	retlw	064h
	retlw	0Dh

	retlw	04Dh
	retlw	0Dh

	retlw	075h
	retlw	0Dh

	retlw	05Eh
	retlw	0Dh

	retlw	086h
	retlw	0Dh

	retlw	06Fh
	retlw	0Dh

	retlw	096h
	retlw	0Dh

	retlw	07Fh
	retlw	0Dh

	retlw	0A5h
	retlw	0Dh

	retlw	08Fh
	retlw	0Dh

	retlw	0B5h
	retlw	0Dh

	retlw	09Eh
	retlw	0Dh

	retlw	0C3h
	retlw	0Dh

	retlw	0ADh
	retlw	0Dh

	retlw	0D2h
	retlw	0Dh

	retlw	0BCh
	retlw	0Dh

	retlw	0E1h
	retlw	0Dh

	retlw	0CBh
	retlw	0Dh

	retlw	0EFh
	retlw	0Dh

	retlw	0D9h
	retlw	0Dh

	retlw	0FDh
	retlw	0Dh

	retlw	0E7h
	retlw	0Dh

	retlw	0Ah
	retlw	0Eh

	global	_LCDCode
psect	stringtext
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\LCD.h"
	line	49
_LCDCode:
	retlw	03Fh
	retlw	06h
	retlw	05Bh
	retlw	04Fh
	retlw	066h
	retlw	06Dh
	retlw	07Dh
	retlw	07h
	retlw	07Fh
	retlw	06Fh
	retlw	0
	retlw	079h
	retlw	039h
	global	_Table_KeyCap
psect	stringtext
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\Touch_Kscan_Library.h"
	line	72
_Table_KeyCap:
	retlw	012h
	retlw	012h
	retlw	012h
	retlw	012h
	retlw	012h
	retlw	012h
	retlw	012h
	retlw	012h
	retlw	012h
	retlw	012h
	retlw	012h
	retlw	012h
	global	_Table_KeyChannel
psect	stringtext
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\Touch_Kscan_Library.h"
	line	56
_Table_KeyChannel:
	retlw	05Ah
	retlw	05Bh
	retlw	05Ch
	retlw	05Eh
	retlw	05Dh
	retlw	05Fh
	retlw	051h
	retlw	054h
	retlw	053h
	retlw	055h
	retlw	052h
	retlw	050h
	global	_Table_KeyDown
psect	stringtext
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\Touch_Kscan_Library.h"
	line	88
_Table_KeyDown:
	retlw	05h
	retlw	05h
	retlw	05h
	retlw	05h
	retlw	05h
	retlw	05h
	retlw	05h
	retlw	05h
	retlw	05h
	retlw	05h
	retlw	05h
	retlw	05h
	global	_Table_KeyFalg
psect	stringtext
	file	"F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
	line	48
_Table_KeyFalg:
	retlw	01h
	retlw	02h
	retlw	04h
	retlw	08h
	retlw	010h
	retlw	020h
	retlw	040h
	retlw	080h
	global	_TempTab
	global	_LCDCode
	global	_Table_KeyCap
	global	_Table_KeyChannel
	global	_Table_KeyDown
	global	_Table_KeyFalg
	global	_display
	global	_Temp_595
	global	NtcAD_Testing@admax
	global	NtcAD_Testing@admin
	global	_AdResult_12bit
	global	_KeyData
	global	_KeyFlag
	global	_KeyOldData
	global	NtcAD_Testing@TAB_pos
	global	NtcAD_Testing@adtimes
	global	NtcAD_Testing@range
	global	_ANNULUS_LIGHT_State
	global	_Add
	global	_BG_LED_ON_Time
	global	_BG_LED_State
	global	_Bold
	global	_BreakTimeOut
	global	_HOT_MAJOR_State
	global	_Hour
	global	_Iced
	global	_KeyCounter
	global	_LED10_State
	global	_LED11_State
	global	_LED1_Flash_Times
	global	_LED1_State
	global	_LED2_State
	global	_LED3_State
	global	_LED4_State
	global	_LED5_State
	global	_LED6_State
	global	_LED7_State
	global	_LED8_State
	global	_LED9_State
	global	_MainTime
	global	_Minute
	global	_Option
	global	_Rbeep
	global	_Reduce
	global	_Regular
	global	_SHOW_LIGHT_State
	global	_Solenoid_State
	global	_Start
	global	_Tea
	global	_WorkMinute
	global	_WorkSecond
	global	__120_z
	global	__210_z
	global	__420_z
	global	__80_z
	global	_KeyOldValue0
	global	_KeyOldValue2
	global	_KeyUpShake
	global	_KeyOldValue1
	global	_KeyReference
	global	_KeyResSum
	global	CheckValidTime@validtime
	global	KeyServer@KeyOldFlag
	global	_WortTimeCount
	global	_ANNULUS_LIGHT_Flash_Times
	global	_LED_Flash_HZ
	global	_com_count
	global	_B_MainLoop
	global	_Buzzer_CFlag
	global	_Flag_Ntc_OneAd
	global	_Flag_RT_High
	global	_Flag_RT_Open
	global	_Flag_RT_Short
	global	_Key_120_Z_Lock
	global	_Key_210_Z_Lock
	global	_Key_420_Z_Lock
	global	_Key_80_Z_Lock
	global	_Key_Add_3S_ON
	global	_Key_Add_Lock
	global	_Key_Bold_Lock
	global	_Key_Iced_Lock
	global	_Key_Option_Lock
	global	_Key_Reduce_3S_ON
	global	_Key_Reduce_Lock
	global	_Key_Regular_Lock
	global	_Key_Start_Lock
	global	_Key_Tea_Lock
	global	_LCD_Flash_Bool
	global	_LED_Flash_Bool
	global	_No_AC
	global	_Time_Temp_Dis
	global	_b_kclr
	global	_b_kerr
	global	_b_kover
	global	_b_kover1
	global	_bool_TimeChange
	global	_bool_WaterTempChange
	global	_old_LHResult
	global	_Display_Temp
	global	NtcAD_Testing@adsum
	global	_BG_LED_ON_Times
	global	_HOT_MAJOR_OFF_Time
	global	_HOT_MAJOR_OFF_Times
	global	_HOT_MAJOR_ON_Time
	global	_HOT_MAJOR_ON_Times
	global	_Key_ON_Times
	global	_LED5_On_Times
	global	_LED6_On_Times
	global	_LH_Count
	global	_PATTERN_WORK_TIME
	global	_Pattern_LED_Crt
	global	_Pattern_Work_Time
	global	_Solenoid_OFF_Time
	global	_Solenoid_OFF_Times
	global	_Solenoid_ON_Time
	global	_Solenoid_ON_Times
	global	_Solenoid_Stop_Time
	global	_Solenoid_Work_Time
	global	_Time_Temp_Counter
	global	_Timer_3S_Times
	global	CheckKeyOldValue@counter
	global	TurnKeyFlags@KeyHaveTimes
	global	TurnKeyFlags@KeyNoTimes
	global	_AdResult_8bit
	global	_BG_LED_Flash_Times
	global	_KeyMaxSub
	global	_LCD_AUTO_Flash_Times
	global	_LCD_COL_Flash_Times
	global	_LCD_Flash_HZ
	global	_LCD_HOUR_Flash_Times
	global	_LCD_MINUTE_Flash_Times
	global	_LCD_State
	global	_LCD_TEMP_Flash_Times
	global	_LCD_TIMER_Flash_Times
	global	_LED10_Flash_Times
	global	_LED11_Flash_Times
	global	_LED12_Flash_Times
	global	_LED12_State
	global	_LED2_Flash_Times
	global	_LED3_Flash_Times
	global	_LED4_Flash_Times
	global	_LED5_Flash_Times
	global	_LED6_Flash_Times
	global	_LED7_Flash_Times
	global	_LED8_Flash_Times
	global	_LED9_Flash_Times
	global	_Pattern_State
	global	_Pattern_Work_State
	global	_Pattern_Work_Times
	global	_SHOW_LIGHT_Flash_Times
	global	_Second
	global	_TimeCounter
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_INTCON
_INTCON	set	11
	global	_PIR1
_PIR1	set	12
	global	_T2CON
_T2CON	set	18
	global	_GODONE
_GODONE	set	249
	global	_RA6
_RA6	set	46
	global	_RA7
_RA7	set	47
	global	_RB1
_RB1	set	49
	global	_RBIF
_RBIF	set	88
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RC6
_RC6	set	62
	global	_RE1
_RE1	set	73
	global	_RE2
_RE2	set	74
	global	_RE3
_RE3	set	75
	global	_TMR2IF
_TMR2IF	set	97
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_IOCB
_IOCB	set	150
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_PIE1
_PIE1	set	140
	global	_PR2
_PR2	set	146
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TRISE
_TRISE	set	137
	global	_WPUB
_WPUB	set	149
	global	_KEYCON0
_KEYCON0	set	275
	global	_KEYCON1
_KEYCON1	set	276
	global	_KEYDATAH
_KEYDATAH	set	278
	global	_KEYDATAL
_KEYDATAL	set	277
	global	_WDTCON
_WDTCON	set	261
	global	_COMEN
_COMEN	set	407
	global	_LCDADD
_LCDADD	set	402
	global	_LCDCON0
_LCDCON0	set	400
	file	"normal.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_B_MainLoop:
       ds      1

_Buzzer_CFlag:
       ds      1

_Flag_Ntc_OneAd:
       ds      1

_Flag_RT_High:
       ds      1

_Flag_RT_Open:
       ds      1

_Flag_RT_Short:
       ds      1

_Key_120_Z_Lock:
       ds      1

_Key_210_Z_Lock:
       ds      1

_Key_420_Z_Lock:
       ds      1

_Key_80_Z_Lock:
       ds      1

_Key_Add_3S_ON:
       ds      1

_Key_Add_Lock:
       ds      1

_Key_Bold_Lock:
       ds      1

_Key_Iced_Lock:
       ds      1

_Key_Option_Lock:
       ds      1

_Key_Reduce_3S_ON:
       ds      1

_Key_Reduce_Lock:
       ds      1

_Key_Regular_Lock:
       ds      1

_Key_Start_Lock:
       ds      1

_Key_Tea_Lock:
       ds      1

_LCD_Flash_Bool:
       ds      1

_LED_Flash_Bool:
       ds      1

_No_AC:
       ds      1

_Time_Temp_Dis:
       ds      1

_b_kclr:
       ds      1

_b_kerr:
       ds      1

_b_kover:
       ds      1

_b_kover1:
       ds      1

_bool_TimeChange:
       ds      1

_bool_WaterTempChange:
       ds      1

_old_LHResult:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_ANNULUS_LIGHT_Flash_Times:
       ds      1

_LED_Flash_HZ:
       ds      1

_com_count:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_display:
       ds      5

_Temp_595:
       ds      3

NtcAD_Testing@admax:
       ds      2

NtcAD_Testing@admin:
       ds      2

_AdResult_12bit:
       ds      2

_KeyData:
       ds      2

_KeyFlag:
       ds      2

_KeyOldData:
       ds      2

NtcAD_Testing@TAB_pos:
       ds      1

NtcAD_Testing@adtimes:
       ds      1

NtcAD_Testing@range:
       ds      1

_ANNULUS_LIGHT_State:
       ds      1

_Add:
       ds      1

_BG_LED_ON_Time:
       ds      1

_BG_LED_State:
       ds      1

_Bold:
       ds      1

_BreakTimeOut:
       ds      1

_HOT_MAJOR_State:
       ds      1

_Hour:
       ds      1

_Iced:
       ds      1

_KeyCounter:
       ds      1

_LED10_State:
       ds      1

_LED11_State:
       ds      1

_LED1_Flash_Times:
       ds      1

_LED1_State:
       ds      1

_LED2_State:
       ds      1

_LED3_State:
       ds      1

_LED4_State:
       ds      1

_LED5_State:
       ds      1

_LED6_State:
       ds      1

_LED7_State:
       ds      1

_LED8_State:
       ds      1

_LED9_State:
       ds      1

_MainTime:
       ds      1

_Minute:
       ds      1

_Option:
       ds      1

_Rbeep:
       ds      1

_Reduce:
       ds      1

_Regular:
       ds      1

_SHOW_LIGHT_State:
       ds      1

_Solenoid_State:
       ds      1

_Start:
       ds      1

_Tea:
       ds      1

_WorkMinute:
       ds      1

_WorkSecond:
       ds      1

__120_z:
       ds      1

__210_z:
       ds      1

__420_z:
       ds      1

__80_z:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_function.h"
	line	116
_BuzzerTime:
       ds      1

psect	dataBANK0
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\AD.h"
	line	18
_Temperature_Dat:
       ds      1

psect	dataBANK0
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_function.h"
	line	363
_Water_Temp:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_Display_Temp:
       ds      5

NtcAD_Testing@adsum:
       ds      2

_BG_LED_ON_Times:
       ds      2

_HOT_MAJOR_OFF_Time:
       ds      2

_HOT_MAJOR_OFF_Times:
       ds      2

_HOT_MAJOR_ON_Time:
       ds      2

_HOT_MAJOR_ON_Times:
       ds      2

_Key_ON_Times:
       ds      2

_LED5_On_Times:
       ds      2

_LED6_On_Times:
       ds      2

_LH_Count:
       ds      2

_PATTERN_WORK_TIME:
       ds      2

_Pattern_LED_Crt:
       ds      2

_Pattern_Work_Time:
       ds      2

_Solenoid_OFF_Time:
       ds      2

_Solenoid_OFF_Times:
       ds      2

_Solenoid_ON_Time:
       ds      2

_Solenoid_ON_Times:
       ds      2

_Solenoid_Stop_Time:
       ds      2

_Solenoid_Work_Time:
       ds      2

_Time_Temp_Counter:
       ds      2

_Timer_3S_Times:
       ds      2

CheckKeyOldValue@counter:
       ds      1

TurnKeyFlags@KeyHaveTimes:
       ds      1

TurnKeyFlags@KeyNoTimes:
       ds      1

_AdResult_8bit:
       ds      1

_BG_LED_Flash_Times:
       ds      1

_KeyMaxSub:
       ds      1

_LCD_AUTO_Flash_Times:
       ds      1

_LCD_COL_Flash_Times:
       ds      1

_LCD_Flash_HZ:
       ds      1

_LCD_HOUR_Flash_Times:
       ds      1

_LCD_MINUTE_Flash_Times:
       ds      1

_LCD_State:
       ds      1

_LCD_TEMP_Flash_Times:
       ds      1

_LCD_TIMER_Flash_Times:
       ds      1

_LED10_Flash_Times:
       ds      1

_LED11_Flash_Times:
       ds      1

_LED12_Flash_Times:
       ds      1

_LED12_State:
       ds      1

_LED2_Flash_Times:
       ds      1

_LED3_Flash_Times:
       ds      1

_LED4_Flash_Times:
       ds      1

_LED5_Flash_Times:
       ds      1

_LED6_Flash_Times:
       ds      1

_LED7_Flash_Times:
       ds      1

_LED8_Flash_Times:
       ds      1

_LED9_Flash_Times:
       ds      1

_Pattern_State:
       ds      1

_Pattern_Work_State:
       ds      1

_Pattern_Work_Times:
       ds      1

_SHOW_LIGHT_Flash_Times:
       ds      1

_Second:
       ds      1

_TimeCounter:
       ds      1

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
_KeyOldValue1:
       ds      24

_KeyReference:
       ds      24

_KeyResSum:
       ds      24

CheckValidTime@validtime:
       ds      2

KeyServer@KeyOldFlag:
       ds      2

_WortTimeCount:
       ds      2

psect	bssBANK2,class=BANK2,space=1
global __pbssBANK2
__pbssBANK2:
_KeyOldValue0:
       ds      24

_KeyOldValue2:
       ds      24

_KeyUpShake:
       ds      12

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
	clrf	((__pbitbssCOMMON/8)+1)&07Fh
	clrf	((__pbitbssCOMMON/8)+2)&07Fh
	clrf	((__pbitbssCOMMON/8)+3)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+03Dh)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+04Fh)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+04Eh)
	fcall	clear_ram
; Clear objects allocated to BANK2
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK2)
	movwf	fsr
	movlw	low((__pbssBANK2)+03Ch)
	fcall	clear_ram
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?__74HC595_SET
?__74HC595_SET:	; 0 bytes @ 0x0
	global	?_Set_Disp
?_Set_Disp:	; 0 bytes @ 0x0
	global	?_AcTestZero
?_AcTestZero:	; 0 bytes @ 0x0
	global	?_ShutDowm_Device
?_ShutDowm_Device:	; 0 bytes @ 0x0
	global	?_CheckTouchKey
?_CheckTouchKey:	; 0 bytes @ 0x0
	global	?_Pattern
?_Pattern:	; 0 bytes @ 0x0
	global	?_LCD_FState
?_LCD_FState:	; 0 bytes @ 0x0
	global	?_CheckBuzzer
?_CheckBuzzer:	; 0 bytes @ 0x0
	global	?_LED_State
?_LED_State:	; 0 bytes @ 0x0
	global	?_Solenoid_State_F
?_Solenoid_State_F:	; 0 bytes @ 0x0
	global	?_HOT_MAJOR_State_F
?_HOT_MAJOR_State_F:	; 0 bytes @ 0x0
	global	?_NtcAD_Testing
?_NtcAD_Testing:	; 0 bytes @ 0x0
	global	?_LED_Crt
?_LED_Crt:	; 0 bytes @ 0x0
	global	?_Init_System
?_Init_System:	; 0 bytes @ 0x0
	global	?_KeyServer
?_KeyServer:	; 0 bytes @ 0x0
	global	?_Isr_Timer
?_Isr_Timer:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_Hex_To_Temp
?_Hex_To_Temp:	; 0 bytes @ 0x0
	global	?_KeyClearOne
?_KeyClearOne:	; 0 bytes @ 0x0
	global	?_KeyClearIn
?_KeyClearIn:	; 0 bytes @ 0x0
	global	?_KeyStopClear
?_KeyStopClear:	; 0 bytes @ 0x0
	global	?_ClearResSum
?_ClearResSum:	; 0 bytes @ 0x0
	global	?_GetTouchKeyValue
?_GetTouchKeyValue:	; 0 bytes @ 0x0
	global	?_CheckOnceResult
?_CheckOnceResult:	; 0 bytes @ 0x0
	global	?_CheckKeyOldValue
?_CheckKeyOldValue:	; 0 bytes @ 0x0
	global	?_TurnKeyFlags
?_TurnKeyFlags:	; 0 bytes @ 0x0
	global	?_CheckValidTime
?_CheckValidTime:	; 0 bytes @ 0x0
	global	?i1__74HC595_SET
?i1__74HC595_SET:	; 0 bytes @ 0x0
	global	??i1__74HC595_SET
??i1__74HC595_SET:	; 0 bytes @ 0x0
	global	?_AD_Sample
?_AD_Sample:	; 1 bytes @ 0x0
	global	?_KeyIsIn
?_KeyIsIn:	; 1 bytes @ 0x0
	ds	1
	global	i1__74HC595_SET@i
i1__74HC595_SET@i:	; 1 bytes @ 0x1
	ds	1
	global	i1__74HC595_SET@j
i1__74HC595_SET@j:	; 1 bytes @ 0x2
	ds	1
	global	??_Set_Disp
??_Set_Disp:	; 0 bytes @ 0x3
	global	??_Isr_Timer
??_Isr_Timer:	; 0 bytes @ 0x3
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??__74HC595_SET
??__74HC595_SET:	; 0 bytes @ 0x0
	global	??_AcTestZero
??_AcTestZero:	; 0 bytes @ 0x0
	global	??_LCD_FState
??_LCD_FState:	; 0 bytes @ 0x0
	global	??_CheckBuzzer
??_CheckBuzzer:	; 0 bytes @ 0x0
	global	??_LED_State
??_LED_State:	; 0 bytes @ 0x0
	global	??_Solenoid_State_F
??_Solenoid_State_F:	; 0 bytes @ 0x0
	global	??_HOT_MAJOR_State_F
??_HOT_MAJOR_State_F:	; 0 bytes @ 0x0
	global	??_LED_Crt
??_LED_Crt:	; 0 bytes @ 0x0
	global	?_DelayX
?_DelayX:	; 0 bytes @ 0x0
	global	??_KeyServer
??_KeyServer:	; 0 bytes @ 0x0
	global	??_AD_Sample
??_AD_Sample:	; 0 bytes @ 0x0
	global	??_KeyIsIn
??_KeyIsIn:	; 0 bytes @ 0x0
	global	??_KeyClearOne
??_KeyClearOne:	; 0 bytes @ 0x0
	global	??_ClearResSum
??_ClearResSum:	; 0 bytes @ 0x0
	global	?_KeyHave
?_KeyHave:	; 0 bytes @ 0x0
	global	??_CheckValidTime
??_CheckValidTime:	; 0 bytes @ 0x0
	global	?___lbdiv
?___lbdiv:	; 1 bytes @ 0x0
	global	?___lbmod
?___lbmod:	; 1 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	KeyIsIn@i
KeyIsIn@i:	; 1 bytes @ 0x0
	global	KeyClearOne@cnt
KeyClearOne@cnt:	; 1 bytes @ 0x0
	global	ClearResSum@cnt
ClearResSum@cnt:	; 1 bytes @ 0x0
	global	___lbdiv@divisor
___lbdiv@divisor:	; 1 bytes @ 0x0
	global	___lbmod@divisor
___lbmod@divisor:	; 1 bytes @ 0x0
	global	DelayX@i
DelayX@i:	; 2 bytes @ 0x0
	global	KeyServer@i
KeyServer@i:	; 2 bytes @ 0x0
	global	KeyHave@flag
KeyHave@flag:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_KeyStopClear
??_KeyStopClear:	; 0 bytes @ 0x1
	global	??_GetTouchKeyValue
??_GetTouchKeyValue:	; 0 bytes @ 0x1
	global	??___lbdiv
??___lbdiv:	; 0 bytes @ 0x1
	global	??___lbmod
??___lbmod:	; 0 bytes @ 0x1
	global	__74HC595_SET@i
__74HC595_SET@i:	; 1 bytes @ 0x1
	global	AD_Sample@adch
AD_Sample@adch:	; 1 bytes @ 0x1
	global	KeyIsIn@cnt
KeyIsIn@cnt:	; 1 bytes @ 0x1
	global	KeyStopClear@i
KeyStopClear@i:	; 1 bytes @ 0x1
	global	GetTouchKeyValue@temp
GetTouchKeyValue@temp:	; 1 bytes @ 0x1
	global	___lbdiv@dividend
___lbdiv@dividend:	; 1 bytes @ 0x1
	ds	1
	global	??_DelayX
??_DelayX:	; 0 bytes @ 0x2
	global	??_KeyClearIn
??_KeyClearIn:	; 0 bytes @ 0x2
	global	??_KeyHave
??_KeyHave:	; 0 bytes @ 0x2
	global	??_CheckKeyOldValue
??_CheckKeyOldValue:	; 0 bytes @ 0x2
	global	__74HC595_SET@j
__74HC595_SET@j:	; 1 bytes @ 0x2
	global	KeyClearIn@cnt
KeyClearIn@cnt:	; 1 bytes @ 0x2
	global	KeyHave@cnt
KeyHave@cnt:	; 1 bytes @ 0x2
	global	GetTouchKeyValue@cnt
GetTouchKeyValue@cnt:	; 1 bytes @ 0x2
	global	___lbdiv@counter
___lbdiv@counter:	; 1 bytes @ 0x2
	global	___lbmod@dividend
___lbmod@dividend:	; 1 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_ShutDowm_Device
??_ShutDowm_Device:	; 0 bytes @ 0x3
	global	??_Init_System
??_Init_System:	; 0 bytes @ 0x3
	global	??_CheckOnceResult
??_CheckOnceResult:	; 0 bytes @ 0x3
	global	??_TurnKeyFlags
??_TurnKeyFlags:	; 0 bytes @ 0x3
	global	___lbdiv@quotient
___lbdiv@quotient:	; 1 bytes @ 0x3
	global	___lbmod@counter
___lbmod@counter:	; 1 bytes @ 0x3
	ds	1
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x4
	global	___lbmod@rem
___lbmod@rem:	; 1 bytes @ 0x4
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x4
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x4
	global	CheckKeyOldValue@KeyResTemp
CheckKeyOldValue@KeyResTemp:	; 2 bytes @ 0x4
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x5
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
	global	??_Hex_To_Temp
??_Hex_To_Temp:	; 0 bytes @ 0x6
	global	Hex_To_Temp@i
Hex_To_Temp@i:	; 1 bytes @ 0x6
	global	CheckKeyOldValue@KeyOldTemp
CheckKeyOldValue@KeyOldTemp:	; 2 bytes @ 0x6
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x6
	ds	1
	global	??_NtcAD_Testing
??_NtcAD_Testing:	; 0 bytes @ 0x7
	global	CheckOnceResult@OldValue
CheckOnceResult@OldValue:	; 2 bytes @ 0x7
	global	Hex_To_Temp@BCD
Hex_To_Temp@BCD:	; 3 bytes @ 0x7
	ds	1
	global	CheckKeyOldValue@cnt
CheckKeyOldValue@cnt:	; 1 bytes @ 0x8
	ds	1
	global	CheckOnceResult@flag
CheckOnceResult@flag:	; 1 bytes @ 0x9
	ds	1
	global	Hex_To_Temp@data
Hex_To_Temp@data:	; 1 bytes @ 0xA
	global	CheckOnceResult@KeyValue
CheckOnceResult@KeyValue:	; 2 bytes @ 0xA
	ds	1
	global	??_Pattern
??_Pattern:	; 0 bytes @ 0xB
	global	NtcAD_Testing@i
NtcAD_Testing@i:	; 1 bytes @ 0xB
	ds	1
	global	CheckOnceResult@KeyDown
CheckOnceResult@KeyDown:	; 1 bytes @ 0xC
	global	NtcAD_Testing@data
NtcAD_Testing@data:	; 2 bytes @ 0xC
	ds	1
	global	CheckOnceResult@KeyResTemp
CheckOnceResult@KeyResTemp:	; 2 bytes @ 0xD
	ds	2
	global	CheckOnceResult@cnt
CheckOnceResult@cnt:	; 1 bytes @ 0xF
	ds	1
	global	??_CheckTouchKey
??_CheckTouchKey:	; 0 bytes @ 0x10
	global	??_main
??_main:	; 0 bytes @ 0x10
;;Data sizes: Strings 0, constant 481, data 3, bss 281, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      13
;; BANK0           80     16      80
;; BANK1           80      0      79
;; BANK3           88      0      78
;; BANK2           80      0      60

;;
;; Pointer list with targets:

;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _Isr_Timer in COMMON
;;
;;   _Set_Disp->i1__74HC595_SET
;;
;; Critical Paths under _main in BANK0
;;
;;   _CheckTouchKey->_CheckOnceResult
;;   _TurnKeyFlags->_KeyClearIn
;;   _Pattern->_Hex_To_Temp
;;   _CheckKeyOldValue->_KeyIsIn
;;   _CheckOnceResult->_KeyHave
;;   _GetTouchKeyValue->_ClearResSum
;;   _KeyStopClear->_KeyClearOne
;;   _KeyClearIn->_KeyIsIn
;;   _Hex_To_Temp->___awmod
;;   _NtcAD_Testing->___lwdiv
;;   _ShutDowm_Device->__74HC595_SET
;;   _Init_System->__74HC595_SET
;;
;; Critical Paths under _Isr_Timer in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _Isr_Timer in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _Isr_Timer in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _Isr_Timer in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0    7020
;;                        _Init_System
;;                       __74HC595_SET
;;                         _AcTestZero
;;                    _ShutDowm_Device
;;                      _CheckTouchKey
;;                          _KeyServer
;;                            _Pattern
;;                         _LCD_FState
;;                        _CheckBuzzer
;;                          _LED_State
;;                   _Solenoid_State_F
;;                  _HOT_MAJOR_State_F
;;                      _NtcAD_Testing
;; ---------------------------------------------------------------------------------
;; (1) _CheckTouchKey                                        0     0      0    3580
;;                   _GetTouchKeyValue
;;                    _CheckOnceResult
;;                       _TurnKeyFlags
;;                       _KeyStopClear
;;                   _CheckKeyOldValue
;;                        _ClearResSum
;;                     _CheckValidTime
;; ---------------------------------------------------------------------------------
;; (2) _TurnKeyFlags                                         0     0      0     356
;;                         _KeyClearIn
;; ---------------------------------------------------------------------------------
;; (1) _Pattern                                              1     1      0    2292
;;                                             11 BANK0      1     1      0
;;                            _LED_Crt
;;                            ___awdiv
;;                            ___awmod
;;                            ___lbdiv
;;                            ___lbmod
;;                        _Hex_To_Temp
;; ---------------------------------------------------------------------------------
;; (2) _CheckKeyOldValue                                     7     7      0     839
;;                                              2 BANK0      7     7      0
;;                            _KeyIsIn
;; ---------------------------------------------------------------------------------
;; (2) _CheckOnceResult                                     13    13      0    1840
;;                                              3 BANK0     13    13      0
;;                            _KeyIsIn
;;                            _KeyHave
;;                        _KeyClearOne
;; ---------------------------------------------------------------------------------
;; (2) _GetTouchKeyValue                                     2     2      0     226
;;                                              1 BANK0      2     2      0
;;                        _ClearResSum
;; ---------------------------------------------------------------------------------
;; (2) _KeyStopClear                                         1     1      0     254
;;                                              1 BANK0      1     1      0
;;                        _KeyClearOne
;; ---------------------------------------------------------------------------------
;; (3) _KeyClearIn                                           1     1      0     356
;;                                              2 BANK0      1     1      0
;;                            _KeyIsIn
;;                        _KeyClearOne
;; ---------------------------------------------------------------------------------
;; (2) _Hex_To_Temp                                          5     5      0    1014
;;                                              6 BANK0      5     5      0
;;                            ___awmod
;;                            ___lbdiv
;; ---------------------------------------------------------------------------------
;; (1) _NtcAD_Testing                                        7     7      0     520
;;                                              7 BANK0      7     7      0
;;                          _AD_Sample
;;                            ___lwdiv
;; ---------------------------------------------------------------------------------
;; (1) _ShutDowm_Device                                      0     0      0     136
;;                       __74HC595_SET
;; ---------------------------------------------------------------------------------
;; (1) _Init_System                                          0     0      0     167
;;                       __74HC595_SET
;;                             _DelayX
;; ---------------------------------------------------------------------------------
;; (3) ___awmod                                              6     2      4     433
;;                                              0 BANK0      6     2      4
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              8     4      4     445
;;                                              0 BANK0      8     4      4
;; ---------------------------------------------------------------------------------
;; (2) ___lbmod                                              5     4      1     159
;;                                              0 BANK0      5     4      1
;; ---------------------------------------------------------------------------------
;; (3) ___lbdiv                                              4     3      1     241
;;                                              0 BANK0      4     3      1
;; ---------------------------------------------------------------------------------
;; (2) ___lwdiv                                              7     3      4     241
;;                                              0 BANK0      7     3      4
;; ---------------------------------------------------------------------------------
;; (2) _CheckValidTime                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _KeyHave                                              3     1      2     186
;;                                              0 BANK0      3     1      2
;; ---------------------------------------------------------------------------------
;; (2) _ClearResSum                                          1     1      0      65
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (3) _KeyClearOne                                          1     1      0     124
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (3) _KeyIsIn                                              2     2      0     102
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _AD_Sample                                            2     2      0      22
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _LED_Crt                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _HOT_MAJOR_State_F                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Solenoid_State_F                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _LED_State                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _CheckBuzzer                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _LCD_FState                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _AcTestZero                                           1     1      0       0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _KeyServer                                            2     2      0     189
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (2) __74HC595_SET                                         3     3      0     136
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (2) _DelayX                                               2     0      2      31
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _Isr_Timer                                            3     3      0     446
;;                                              3 COMMON     3     3      0
;;                           _Set_Disp
;; ---------------------------------------------------------------------------------
;; (6) _Set_Disp                                             0     0      0     446
;;                     i1__74HC595_SET
;; ---------------------------------------------------------------------------------
;; (7) i1__74HC595_SET                                       3     3      0     446
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 7
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _Init_System
;;     __74HC595_SET
;;     _DelayX
;;   __74HC595_SET
;;   _AcTestZero
;;   _ShutDowm_Device
;;     __74HC595_SET
;;   _CheckTouchKey
;;     _GetTouchKeyValue
;;       _ClearResSum
;;     _CheckOnceResult
;;       _KeyIsIn
;;       _KeyHave
;;       _KeyClearOne
;;     _TurnKeyFlags
;;       _KeyClearIn
;;         _KeyIsIn
;;         _KeyClearOne
;;     _KeyStopClear
;;       _KeyClearOne
;;     _CheckKeyOldValue
;;       _KeyIsIn
;;     _ClearResSum
;;     _CheckValidTime
;;   _KeyServer
;;   _Pattern
;;     _LED_Crt
;;     ___awdiv
;;     ___awmod
;;     ___lbdiv
;;     ___lbmod
;;     _Hex_To_Temp
;;       ___awmod
;;       ___lbdiv
;;   _LCD_FState
;;   _CheckBuzzer
;;   _LED_State
;;   _Solenoid_State_F
;;   _HOT_MAJOR_State_F
;;   _NtcAD_Testing
;;     _AD_Sample
;;     ___lwdiv
;;
;; _Isr_Timer (ROOT)
;;   _Set_Disp
;;     i1__74HC595_SET
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               58      0      4E       9       88.6%
;;BITBANK3            58      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               50      0      3C      11       75.0%
;;BITBANK2            50      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0      4F       7       98.8%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0     140      12        0.0%
;;ABS                  0      0     136       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       A       2        0.0%
;;BANK0               50     10      50       5      100.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      6       D       1       92.9%
;;BITCOMMON            E      0       4       0       28.6%
;;EEDATA              40      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 273 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_Init_System
;;		__74HC595_SET
;;		_AcTestZero
;;		_ShutDowm_Device
;;		_CheckTouchKey
;;		_KeyServer
;;		_Pattern
;;		_LCD_FState
;;		_CheckBuzzer
;;		_LED_State
;;		_Solenoid_State_F
;;		_HOT_MAJOR_State_F
;;		_NtcAD_Testing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\main.c"
	line	273
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 1
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	274
	
l16267:	
;main.c: 274: Init_System();
	fcall	_Init_System
	line	276
;main.c: 276: _74HC595_SET();
	fcall	__74HC595_SET
	line	277
	
l16269:	
;main.c: 277: No_AC=0;
	bcf	(_No_AC/8),(_No_AC)&7
	line	286
	
l16271:	
;main.c: 286: LCDCON0=0B10110000;
	movlw	(0B0h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(400)^0180h	;volatile
	line	287
	
l16273:	
;main.c: 287: LCDADD =0B01100000;
	movlw	(060h)
	movwf	(402)^0180h	;volatile
	line	294
	
l16275:	
;main.c: 293: {
;main.c: 294: if(B_MainLoop)
	btfss	(_B_MainLoop/8),(_B_MainLoop)&7
	goto	u10801
	goto	u10800
u10801:
	goto	l16275
u10800:
	line	296
	
l16277:	
;main.c: 295: {
;main.c: 296: B_MainLoop = 0;
	bcf	(_B_MainLoop/8),(_B_MainLoop)&7
	line	297
# 297 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\main.c"
clrwdt ;#
psect	maintext
	line	298
	
l16279:	
;main.c: 298: AcTestZero();
	fcall	_AcTestZero
	line	304
	
l16281:	
;main.c: 304: if(No_AC)
	btfss	(_No_AC/8),(_No_AC)&7
	goto	u10811
	goto	u10810
u10811:
	goto	l16285
u10810:
	line	306
	
l16283:	
;main.c: 305: {
;main.c: 306: ShutDowm_Device();
	fcall	_ShutDowm_Device
	line	307
;main.c: 307: continue;
	goto	l16275
	line	309
	
l16285:	
;main.c: 308: }
;main.c: 309: CheckTouchKey();
	fcall	_CheckTouchKey
	line	310
	
l16287:	
;main.c: 310: KeyServer();
	fcall	_KeyServer
	line	311
	
l16289:	
;main.c: 311: Pattern();
	fcall	_Pattern
	line	312
;main.c: 312: LCD_FState();
	fcall	_LCD_FState
	line	313
	
l16291:	
;main.c: 313: CheckBuzzer();
	fcall	_CheckBuzzer
	line	314
	
l16293:	
;main.c: 314: LED_State();
	fcall	_LED_State
	line	315
	
l16295:	
;main.c: 315: Solenoid_State_F();
	fcall	_Solenoid_State_F
	line	316
	
l16297:	
;main.c: 316: HOT_MAJOR_State_F();
	fcall	_HOT_MAJOR_State_F
	line	318
	
l16299:	
;main.c: 318: NtcAD_Testing(6);
	movlw	(06h)
	fcall	_NtcAD_Testing
	goto	l16275
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	321
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_CheckTouchKey
psect	text1269,local,class=CODE,delta=2
global __ptext1269
__ptext1269:

;; *************** function _CheckTouchKey *****************
;; Defined at:
;;		line 496 in file "F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/60
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_GetTouchKeyValue
;;		_CheckOnceResult
;;		_TurnKeyFlags
;;		_KeyStopClear
;;		_CheckKeyOldValue
;;		_ClearResSum
;;		_CheckValidTime
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1269
	file	"F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
	line	496
	global	__size_of_CheckTouchKey
	__size_of_CheckTouchKey	equ	__end_of_CheckTouchKey-_CheckTouchKey
	
_CheckTouchKey:	
	opt	stack 1
; Regs used in _CheckTouchKey: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	497
	
l16229:	
;CheckTouchKey.c: 497: if(!b_kover)
	btfsc	(_b_kover/8),(_b_kover)&7
	goto	u10751
	goto	u10750
u10751:
	goto	l7006
u10750:
	line	500
	
l16231:	
;CheckTouchKey.c: 498: {
;CheckTouchKey.c: 500: GetTouchKeyValue();
	fcall	_GetTouchKeyValue
	line	501
	
l16233:	
;CheckTouchKey.c: 501: if(++KeyCounter >= 8)
	movlw	(08h)
	incf	(_KeyCounter),f
	subwf	((_KeyCounter)),w
	skipc
	goto	u10761
	goto	u10760
u10761:
	goto	l16265
u10760:
	line	503
	
l16235:	
;CheckTouchKey.c: 502: {
;CheckTouchKey.c: 503: KeyCounter = 0;
	clrf	(_KeyCounter)
	line	504
	
l16237:	
;CheckTouchKey.c: 504: b_kover = 1;
	bsf	(_b_kover/8),(_b_kover)&7
	goto	l16265
	line	507
	
l7006:	
;CheckTouchKey.c: 507: else if(!b_kover1)
	btfsc	(_b_kover1/8),(_b_kover1)&7
	goto	u10771
	goto	u10770
u10771:
	goto	l16257
u10770:
	line	510
	
l16239:	
;CheckTouchKey.c: 508: {
;CheckTouchKey.c: 510: CheckOnceResult();
	fcall	_CheckOnceResult
	line	513
;CheckTouchKey.c: 513: TurnKeyFlags();
	fcall	_TurnKeyFlags
	line	514
	
l16241:	
;CheckTouchKey.c: 514: b_kover1 = 1;
	bsf	(_b_kover1/8),(_b_kover1)&7
	line	520
	
l16243:	
;CheckTouchKey.c: 520: if(b_kerr || KeyCounter > KeyValidNumber)
	btfsc	(_b_kerr/8),(_b_kerr)&7
	goto	u10781
	goto	u10780
u10781:
	goto	l16247
u10780:
	
l16245:	
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_KeyCounter),w
	skipc
	goto	u10791
	goto	u10790
u10791:
	goto	l16255
u10790:
	line	522
	
l16247:	
;CheckTouchKey.c: 521: {
;CheckTouchKey.c: 522: KeyStopClear();
	fcall	_KeyStopClear
	line	523
	
l16249:	
;CheckTouchKey.c: 523: b_kerr = 0;
	bcf	(_b_kerr/8),(_b_kerr)&7
	line	524
	
l16251:	
;CheckTouchKey.c: 524: b_kover = 0;
	bcf	(_b_kover/8),(_b_kover)&7
	line	525
	
l16253:	
;CheckTouchKey.c: 525: b_kover1 = 0;
	bcf	(_b_kover1/8),(_b_kover1)&7
	line	527
	
l16255:	
;CheckTouchKey.c: 526: }
;CheckTouchKey.c: 527: KeyCounter = 0;
	clrf	(_KeyCounter)
	line	528
;CheckTouchKey.c: 528: }
	goto	l16265
	line	532
	
l16257:	
;CheckTouchKey.c: 529: else
;CheckTouchKey.c: 530: {
;CheckTouchKey.c: 532: CheckKeyOldValue();
	fcall	_CheckKeyOldValue
	line	534
	
l16259:	
;CheckTouchKey.c: 534: ClearResSum();
	fcall	_ClearResSum
	line	536
	
l16261:	
;CheckTouchKey.c: 536: b_kover = 0;
	bcf	(_b_kover/8),(_b_kover)&7
	line	537
	
l16263:	
;CheckTouchKey.c: 537: b_kover1 = 0;
	bcf	(_b_kover1/8),(_b_kover1)&7
	line	540
	
l16265:	
;CheckTouchKey.c: 538: }
;CheckTouchKey.c: 540: CheckValidTime();
	fcall	_CheckValidTime
	line	541
	
l7014:	
	return
	opt stack 0
GLOBAL	__end_of_CheckTouchKey
	__end_of_CheckTouchKey:
;; =============== function _CheckTouchKey ends ============

	signat	_CheckTouchKey,88
	global	_TurnKeyFlags
psect	text1270,local,class=CODE,delta=2
global __ptext1270
__ptext1270:

;; *************** function _TurnKeyFlags *****************
;; Defined at:
;;		line 383 in file "F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 160/100
;;		On exit  : 40/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_KeyClearIn
;; This function is called by:
;;		_CheckTouchKey
;; This function uses a non-reentrant model
;;
psect	text1270
	file	"F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
	line	383
	global	__size_of_TurnKeyFlags
	__size_of_TurnKeyFlags	equ	__end_of_TurnKeyFlags-_TurnKeyFlags
	
_TurnKeyFlags:	
	opt	stack 1
; Regs used in _TurnKeyFlags: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	387
	
l16195:	
;CheckTouchKey.c: 384: static unsigned char KeyHaveTimes = 0;
;CheckTouchKey.c: 385: static unsigned char KeyNoTimes = 0;
;CheckTouchKey.c: 387: if(KeyData[0] | KeyData[1])
	movf	0+(_KeyData)+01h,w	;volatile
	iorwf	(_KeyData),w	;volatile
	btfsc	status,2
	goto	u10691
	goto	u10690
u10691:
	goto	l16221
u10690:
	line	389
	
l16197:	
;CheckTouchKey.c: 388: {
;CheckTouchKey.c: 389: KeyNoTimes = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(TurnKeyFlags@KeyNoTimes)^080h
	line	391
	
l16199:	
;CheckTouchKey.c: 391: if(KeyData[0] == KeyOldData[0] && KeyData[1] == KeyOldData[1])
	bcf	status, 5	;RP0=0, select bank0
	movf	(_KeyData),w	;volatile
	xorwf	(_KeyOldData),w	;volatile
	skipz
	goto	u10701
	goto	u10700
u10701:
	goto	l6987
u10700:
	
l16201:	
	movf	0+(_KeyData)+01h,w	;volatile
	xorwf	0+(_KeyOldData)+01h,w	;volatile
	skipz
	goto	u10711
	goto	u10710
u10711:
	goto	l6987
u10710:
	line	393
	
l16203:	
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	incf	(TurnKeyFlags@KeyHaveTimes)^080h,f
	subwf	((TurnKeyFlags@KeyHaveTimes)^080h),w
	skipc
	goto	u10721
	goto	u10720
u10721:
	goto	l6994
u10720:
	line	395
	
l16205:	
;CheckTouchKey.c: 394: {
;CheckTouchKey.c: 395: KeyHaveTimes = 0;
	clrf	(TurnKeyFlags@KeyHaveTimes)^080h
	line	396
	
l16207:	
;CheckTouchKey.c: 396: KeyFlag[0] = KeyData[0];
	bcf	status, 5	;RP0=0, select bank0
	movf	(_KeyData),w	;volatile
	movwf	(_KeyFlag)	;volatile
	line	397
	
l16209:	
;CheckTouchKey.c: 397: KeyFlag[1] = KeyData[1];
	movf	0+(_KeyData)+01h,w	;volatile
	movwf	0+(_KeyFlag)+01h	;volatile
	line	401
	
l16211:	
;CheckTouchKey.c: 400: {
;CheckTouchKey.c: 401: if(!b_kclr)
	btfsc	(_b_kclr/8),(_b_kclr)&7
	goto	u10731
	goto	u10730
u10731:
	goto	l6991
u10730:
	line	403
	
l16213:	
;CheckTouchKey.c: 402: {
;CheckTouchKey.c: 403: b_kclr = 1;
	bsf	(_b_kclr/8),(_b_kclr)&7
	line	404
	
l16215:	
;CheckTouchKey.c: 404: KeyClearIn();
	fcall	_KeyClearIn
	goto	l6994
	line	409
	
l6987:	
	line	411
;CheckTouchKey.c: 409: else
;CheckTouchKey.c: 410: {
;CheckTouchKey.c: 411: b_kclr = 0;
	bcf	(_b_kclr/8),(_b_kclr)&7
	line	412
	
l16217:	
;CheckTouchKey.c: 412: KeyOldData[0] = KeyData[0];
	movf	(_KeyData),w	;volatile
	movwf	(_KeyOldData)	;volatile
	line	413
;CheckTouchKey.c: 413: KeyOldData[1] = KeyData[1];
	movf	0+(_KeyData)+01h,w	;volatile
	movwf	0+(_KeyOldData)+01h	;volatile
	line	414
	
l16219:	
;CheckTouchKey.c: 414: KeyHaveTimes = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(TurnKeyFlags@KeyHaveTimes)^080h
	goto	l6994
	line	415
	
l6991:	
	line	416
;CheckTouchKey.c: 415: }
;CheckTouchKey.c: 416: }
	goto	l6994
	line	419
	
l16221:	
;CheckTouchKey.c: 417: else
;CheckTouchKey.c: 418: {
;CheckTouchKey.c: 419: KeyHaveTimes = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(TurnKeyFlags@KeyHaveTimes)^080h
	line	420
;CheckTouchKey.c: 420: KeyOldData[0] = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_KeyOldData)	;volatile
	line	421
;CheckTouchKey.c: 421: KeyOldData[1] = 0;
	clrf	0+(_KeyOldData)+01h	;volatile
	line	423
	
l16223:	
;CheckTouchKey.c: 423: if(++KeyNoTimes >=2)
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	incf	(TurnKeyFlags@KeyNoTimes)^080h,f
	subwf	((TurnKeyFlags@KeyNoTimes)^080h),w
	skipc
	goto	u10741
	goto	u10740
u10741:
	goto	l6994
u10740:
	line	425
	
l16225:	
;CheckTouchKey.c: 424: {
;CheckTouchKey.c: 425: KeyNoTimes = 0;
	clrf	(TurnKeyFlags@KeyNoTimes)^080h
	line	426
;CheckTouchKey.c: 426: KeyFlag[0] = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_KeyFlag)	;volatile
	line	427
;CheckTouchKey.c: 427: KeyFlag[1] = 0;
	clrf	0+(_KeyFlag)+01h	;volatile
	line	429
	
l16227:	
;CheckTouchKey.c: 429: b_kclr = 0;
	bcf	(_b_kclr/8),(_b_kclr)&7
	line	432
	
l6994:	
	return
	opt stack 0
GLOBAL	__end_of_TurnKeyFlags
	__end_of_TurnKeyFlags:
;; =============== function _TurnKeyFlags ends ============

	signat	_TurnKeyFlags,88
	global	_Pattern
psect	text1271,local,class=CODE,delta=2
global __ptext1271
__ptext1271:

;; *************** function _Pattern *****************
;; Defined at:
;;		line 697 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 40/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_LED_Crt
;;		___awdiv
;;		___awmod
;;		___lbdiv
;;		___lbmod
;;		_Hex_To_Temp
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1271
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
	line	697
	global	__size_of_Pattern
	__size_of_Pattern	equ	__end_of_Pattern-_Pattern
	
_Pattern:	
	opt	stack 2
; Regs used in _Pattern: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	698
	
l15427:	
;pattern_fuction.c: 698: LED_Crt();
	fcall	_LED_Crt
	line	699
;pattern_fuction.c: 699: switch(Pattern_State)
	goto	l16193
	line	701
;pattern_fuction.c: 700: {
;pattern_fuction.c: 701: case 0:
	
l5360:	
	line	702
;pattern_fuction.c: 702: Rbeep=1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_Rbeep)
	incf	(_Rbeep),f
	line	703
	
l15429:	
;pattern_fuction.c: 703: LCD_State=5;
	movlw	(05h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_LCD_State)^080h
	line	704
	
l15431:	
;pattern_fuction.c: 704: LCD_COL_Flash_Times=0;
	clrf	(_LCD_COL_Flash_Times)^080h
	line	705
	
l15433:	
;pattern_fuction.c: 705: LCD_AUTO_Flash_Times=0;
	clrf	(_LCD_AUTO_Flash_Times)^080h
	line	706
	
l15435:	
;pattern_fuction.c: 706: LCD_TIMER_Flash_Times=0;
	clrf	(_LCD_TIMER_Flash_Times)^080h
	line	707
	
l15437:	
;pattern_fuction.c: 707: LCD_TEMP_Flash_Times=0;
	clrf	(_LCD_TEMP_Flash_Times)^080h
	line	708
	
l15439:	
;pattern_fuction.c: 708: LCD_HOUR_Flash_Times=0;
	clrf	(_LCD_HOUR_Flash_Times)^080h
	line	709
	
l15441:	
;pattern_fuction.c: 709: LCD_MINUTE_Flash_Times=0;
	clrf	(_LCD_MINUTE_Flash_Times)^080h
	line	711
	
l15443:	
;pattern_fuction.c: 711: Display_Temp[0]=LCDCode[0];
	movlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	btemp+1
	fcall	stringtab
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Display_Temp)^080h	;volatile
	line	712
	
l15445:	
;pattern_fuction.c: 712: Display_Temp[1]=LCDCode[0];
	movlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	btemp+1
	fcall	stringtab
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_Display_Temp)^080h+01h	;volatile
	line	713
	
l15447:	
;pattern_fuction.c: 713: Display_Temp[2]=LCDCode[0];
	movlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	btemp+1
	fcall	stringtab
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_Display_Temp)^080h+02h	;volatile
	line	714
	
l15449:	
;pattern_fuction.c: 714: Display_Temp[3]=LCDCode[0];
	movlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	btemp+1
	fcall	stringtab
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_Display_Temp)^080h+03h	;volatile
	line	717
;pattern_fuction.c: 717: Water_Temp=95;
	movlw	(05Fh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_Water_Temp)
	line	718
	
l15451:	
;pattern_fuction.c: 718: bool_WaterTempChange=0;
	bcf	(_bool_WaterTempChange/8),(_bool_WaterTempChange)&7
	line	719
	
l15453:	
;pattern_fuction.c: 719: bool_TimeChange=0;
	bcf	(_bool_TimeChange/8),(_bool_TimeChange)&7
	line	721
	
l15455:	
;pattern_fuction.c: 721: WorkSecond=0;
	clrf	(_WorkSecond)
	line	722
	
l15457:	
;pattern_fuction.c: 722: WorkMinute=0;
	clrf	(_WorkMinute)
	line	725
	
l15459:	
;pattern_fuction.c: 725: Pattern_LED_Crt=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_Pattern_LED_Crt)^080h
	clrf	(_Pattern_LED_Crt+1)^080h
	line	726
	
l15461:	
;pattern_fuction.c: 726: BG_LED_ON_Time=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_BG_LED_ON_Time)
	line	728
	
l15463:	
;pattern_fuction.c: 728: Pattern_Work_Time=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_Pattern_Work_Time)^080h
	clrf	(_Pattern_Work_Time+1)^080h
	line	729
	
l15465:	
;pattern_fuction.c: 729: Solenoid_ON_Time=0;
	clrf	(_Solenoid_ON_Time)^080h
	clrf	(_Solenoid_ON_Time+1)^080h
	line	730
	
l15467:	
;pattern_fuction.c: 730: Solenoid_OFF_Time=0;
	clrf	(_Solenoid_OFF_Time)^080h
	clrf	(_Solenoid_OFF_Time+1)^080h
	line	731
	
l15469:	
;pattern_fuction.c: 731: Pattern_Work_State=0;
	clrf	(_Pattern_Work_State)^080h
	line	733
	
l15471:	
;pattern_fuction.c: 733: Regular=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_Regular)
	line	734
	
l15473:	
;pattern_fuction.c: 734: Bold=0;
	clrf	(_Bold)
	line	735
	
l15475:	
;pattern_fuction.c: 735: Iced=0;
	clrf	(_Iced)
	line	736
	
l15477:	
;pattern_fuction.c: 736: Tea=0;
	clrf	(_Tea)
	line	737
	
l15479:	
;pattern_fuction.c: 737: Add=0;
	clrf	(_Add)
	line	738
	
l15481:	
;pattern_fuction.c: 738: Reduce=0;
	clrf	(_Reduce)
	line	739
	
l15483:	
;pattern_fuction.c: 739: _80_z=0;
	clrf	(__80_z)
	line	740
	
l15485:	
;pattern_fuction.c: 740: _120_z=0;
	clrf	(__120_z)
	line	741
	
l15487:	
;pattern_fuction.c: 741: _210_z=0;
	clrf	(__210_z)
	line	742
	
l15489:	
;pattern_fuction.c: 742: _420_z=0;
	clrf	(__420_z)
	line	743
	
l15491:	
;pattern_fuction.c: 743: Option=0;
	clrf	(_Option)
	line	744
	
l15493:	
;pattern_fuction.c: 744: Start=0;
	clrf	(_Start)
	line	746
	
l15495:	
;pattern_fuction.c: 746: Key_Regular_Lock=0;
	bcf	(_Key_Regular_Lock/8),(_Key_Regular_Lock)&7
	line	747
	
l15497:	
;pattern_fuction.c: 747: Key_Bold_Lock=0;
	bcf	(_Key_Bold_Lock/8),(_Key_Bold_Lock)&7
	line	748
	
l15499:	
;pattern_fuction.c: 748: Key_Iced_Lock=0;
	bcf	(_Key_Iced_Lock/8),(_Key_Iced_Lock)&7
	line	749
	
l15501:	
;pattern_fuction.c: 749: Key_Tea_Lock=0;
	bcf	(_Key_Tea_Lock/8),(_Key_Tea_Lock)&7
	line	750
	
l15503:	
;pattern_fuction.c: 750: Key_Add_Lock=1;
	bsf	(_Key_Add_Lock/8),(_Key_Add_Lock)&7
	line	751
	
l15505:	
;pattern_fuction.c: 751: Key_Reduce_Lock=1;
	bsf	(_Key_Reduce_Lock/8),(_Key_Reduce_Lock)&7
	line	752
	
l15507:	
;pattern_fuction.c: 752: Key_80_Z_Lock=0;
	bcf	(_Key_80_Z_Lock/8),(_Key_80_Z_Lock)&7
	line	753
	
l15509:	
;pattern_fuction.c: 753: Key_120_Z_Lock=0;
	bcf	(_Key_120_Z_Lock/8),(_Key_120_Z_Lock)&7
	line	754
	
l15511:	
;pattern_fuction.c: 754: Key_210_Z_Lock=0;
	bcf	(_Key_210_Z_Lock/8),(_Key_210_Z_Lock)&7
	line	755
	
l15513:	
;pattern_fuction.c: 755: Key_420_Z_Lock=0;
	bcf	(_Key_420_Z_Lock/8),(_Key_420_Z_Lock)&7
	line	756
	
l15515:	
;pattern_fuction.c: 756: Key_Option_Lock=0;
	bcf	(_Key_Option_Lock/8),(_Key_Option_Lock)&7
	line	757
	
l15517:	
;pattern_fuction.c: 757: Key_Start_Lock=1;
	bsf	(_Key_Start_Lock/8),(_Key_Start_Lock)&7
	line	760
	
l15519:	
;pattern_fuction.c: 760: RA6=0;
	bcf	(46/8),(46)&7
	line	761
	
l15521:	
;pattern_fuction.c: 761: HOT_MAJOR_State=0;
	clrf	(_HOT_MAJOR_State)
	line	762
	
l15523:	
;pattern_fuction.c: 762: RC0=0;
	bcf	(56/8),(56)&7
	line	763
	
l15525:	
;pattern_fuction.c: 763: RA7=0;
	bcf	(47/8),(47)&7
	line	764
	
l15527:	
;pattern_fuction.c: 764: Solenoid_State=0;
	clrf	(_Solenoid_State)
	line	766
	
l15529:	
;pattern_fuction.c: 766: Pattern_State=1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_Pattern_State)^080h
	incf	(_Pattern_State)^080h,f
	line	768
	
l15531:	
;pattern_fuction.c: 768: LCD_HOUR_Flash_Times=0;
	clrf	(_LCD_HOUR_Flash_Times)^080h
	line	769
	
l15533:	
;pattern_fuction.c: 769: LCD_MINUTE_Flash_Times=0;
	clrf	(_LCD_MINUTE_Flash_Times)^080h
	line	770
;pattern_fuction.c: 770: if(BG_LED_ON_Time>=30)
	movlw	(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_BG_LED_ON_Time),w
	skipc
	goto	u9731
	goto	u9730
u9731:
	goto	l15547
u9730:
	line	772
	
l15535:	
;pattern_fuction.c: 771: {
;pattern_fuction.c: 772: display[4]|=1<<0;
	bsf	0+(_display)+04h+(0/8),(0)&7	;volatile
	line	773
;pattern_fuction.c: 773: display[4]|=1<<1;
	bsf	0+(_display)+04h+(1/8),(1)&7	;volatile
	line	774
;pattern_fuction.c: 774: display[4]|=1<<2;
	bsf	0+(_display)+04h+(2/8),(2)&7	;volatile
	line	775
;pattern_fuction.c: 775: display[4]|=1<<3;
	bsf	0+(_display)+04h+(3/8),(3)&7	;volatile
	line	776
	
l15537:	
;pattern_fuction.c: 776: BG_LED_State=0;
	clrf	(_BG_LED_State)
	line	777
	
l15539:	
;pattern_fuction.c: 777: LCD_TEMP_Flash_Times=255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_LCD_TEMP_Flash_Times)^080h
	line	778
	
l15541:	
;pattern_fuction.c: 778: LCD_TIMER_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_TIMER_Flash_Times)^080h
	line	779
	
l15543:	
;pattern_fuction.c: 779: LCD_AUTO_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_AUTO_Flash_Times)^080h
	line	780
	
l15545:	
;pattern_fuction.c: 780: LCD_COL_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_COL_Flash_Times)^080h
	line	782
	
l15547:	
;pattern_fuction.c: 781: }
;pattern_fuction.c: 782: if(Option)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Option),w
	skipz
	goto	u9740
	goto	l15551
u9740:
	line	784
	
l15549:	
;pattern_fuction.c: 783: {
;pattern_fuction.c: 784: Pattern_State=4;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Pattern_State)^080h
	line	787
	
l15551:	
;pattern_fuction.c: 785: }
;pattern_fuction.c: 787: if(Regular|Bold|Iced|Tea|_80_z|_120_z|_210_z|_420_z)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Regular),w
	iorwf	(_Bold),w
	iorwf	(_Iced),w
	iorwf	(_Tea),w
	iorwf	(__80_z),w
	iorwf	(__120_z),w
	iorwf	(__210_z),w
	iorwf	(__420_z),w
	btfsc	status,2
	goto	u9751
	goto	u9750
u9751:
	goto	l5514
u9750:
	line	789
	
l15553:	
;pattern_fuction.c: 788: {
;pattern_fuction.c: 789: Pattern_State=2;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Pattern_State)^080h
	goto	l5514
	line	794
	
l15555:	
;pattern_fuction.c: 794: Pattern_LED_Crt=2;
	movlw	02h
	movwf	(_Pattern_LED_Crt)^080h
	clrf	(_Pattern_LED_Crt+1)^080h
	line	795
;pattern_fuction.c: 795: Pattern_State=3;
	movlw	(03h)
	movwf	(_Pattern_State)^080h
	line	796
	
l15557:	
;pattern_fuction.c: 796: Key_Option_Lock=1;
	bsf	(_Key_Option_Lock/8),(_Key_Option_Lock)&7
	line	797
;pattern_fuction.c: 797: break;
	goto	l5514
	line	802
	
l15559:	
;pattern_fuction.c: 802: if((Regular|Bold|Iced|Tea)&&(_80_z|_120_z|_210_z|_420_z))
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Regular),w
	iorwf	(_Bold),w
	iorwf	(_Iced),w
	iorwf	(_Tea),w
	btfsc	status,2
	goto	u9761
	goto	u9760
u9761:
	goto	l15565
u9760:
	
l15561:	
	movf	(__80_z),w
	iorwf	(__120_z),w
	iorwf	(__210_z),w
	iorwf	(__420_z),w
	btfsc	status,2
	goto	u9771
	goto	u9770
u9771:
	goto	l15565
u9770:
	line	804
	
l15563:	
;pattern_fuction.c: 803: {
;pattern_fuction.c: 804: Key_Start_Lock=0;
	bcf	(_Key_Start_Lock/8),(_Key_Start_Lock)&7
	line	805
;pattern_fuction.c: 805: Key_Option_Lock=1;
	bsf	(_Key_Option_Lock/8),(_Key_Option_Lock)&7
	line	808
	
l15565:	
;pattern_fuction.c: 806: }
;pattern_fuction.c: 808: if(Option) Pattern_State=4;
	movf	(_Option),w
	skipz
	goto	u9780
	goto	l5369
u9780:
	
l15567:	
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Pattern_State)^080h
	
l5369:	
	line	809
;pattern_fuction.c: 809: if(Start)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Start),w
	skipz
	goto	u9790
	goto	l5514
u9790:
	line	811
	
l15569:	
;pattern_fuction.c: 810: {
;pattern_fuction.c: 811: Pattern_State=10;
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Pattern_State)^080h
	goto	l5514
	line	816
	
l15571:	
;pattern_fuction.c: 816: Pattern_LED_Crt=2;
	movlw	02h
	movwf	(_Pattern_LED_Crt)^080h
	clrf	(_Pattern_LED_Crt+1)^080h
	line	818
	
l15573:	
;pattern_fuction.c: 818: Key_Regular_Lock=1;
	bsf	(_Key_Regular_Lock/8),(_Key_Regular_Lock)&7
	line	819
	
l15575:	
;pattern_fuction.c: 819: Key_Bold_Lock=1;
	bsf	(_Key_Bold_Lock/8),(_Key_Bold_Lock)&7
	line	820
	
l15577:	
;pattern_fuction.c: 820: Key_Iced_Lock=1;
	bsf	(_Key_Iced_Lock/8),(_Key_Iced_Lock)&7
	line	821
	
l15579:	
;pattern_fuction.c: 821: Key_Tea_Lock=1;
	bsf	(_Key_Tea_Lock/8),(_Key_Tea_Lock)&7
	line	822
	
l15581:	
;pattern_fuction.c: 822: Key_Add_Lock=0;
	bcf	(_Key_Add_Lock/8),(_Key_Add_Lock)&7
	line	823
	
l15583:	
;pattern_fuction.c: 823: Key_Reduce_Lock=0;
	bcf	(_Key_Reduce_Lock/8),(_Key_Reduce_Lock)&7
	line	824
	
l15585:	
;pattern_fuction.c: 824: Key_80_Z_Lock=1;
	bsf	(_Key_80_Z_Lock/8),(_Key_80_Z_Lock)&7
	line	825
	
l15587:	
;pattern_fuction.c: 825: Key_120_Z_Lock=1;
	bsf	(_Key_120_Z_Lock/8),(_Key_120_Z_Lock)&7
	line	826
	
l15589:	
;pattern_fuction.c: 826: Key_210_Z_Lock=1;
	bsf	(_Key_210_Z_Lock/8),(_Key_210_Z_Lock)&7
	line	827
	
l15591:	
;pattern_fuction.c: 827: Key_420_Z_Lock=1;
	bsf	(_Key_420_Z_Lock/8),(_Key_420_Z_Lock)&7
	line	828
	
l15593:	
;pattern_fuction.c: 828: Key_Option_Lock=0;
	bcf	(_Key_Option_Lock/8),(_Key_Option_Lock)&7
	line	829
	
l15595:	
;pattern_fuction.c: 829: Key_Start_Lock=0;
	bcf	(_Key_Start_Lock/8),(_Key_Start_Lock)&7
	line	830
	
l15597:	
;pattern_fuction.c: 830: Start=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_Start)
	line	831
	
l15599:	
;pattern_fuction.c: 831: Pattern_State=5;
	movlw	(05h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Pattern_State)^080h
	line	832
;pattern_fuction.c: 832: break;
	goto	l5514
	line	835
	
l15601:	
;pattern_fuction.c: 835: if(Start) Option=0;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Start),w
	skipz
	goto	u9800
	goto	l15605
u9800:
	
l15603:	
	clrf	(_Option)
	line	836
	
l15605:	
;pattern_fuction.c: 836: if(Option==0) Pattern_State=6;
	movf	(_Option),f
	skipz
	goto	u9811
	goto	u9810
u9811:
	goto	l5374
u9810:
	
l15607:	
	movlw	(06h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Pattern_State)^080h
	
l5374:	
	line	838
;pattern_fuction.c: 838: LCD_COL_Flash_Times=255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_LCD_COL_Flash_Times)^080h
	line	839
;pattern_fuction.c: 839: LCD_AUTO_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_AUTO_Flash_Times)^080h
	line	840
	
l15609:	
;pattern_fuction.c: 840: display[4]&=~(1<<2);
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_display)+04h+(2/8),(2)&7	;volatile
	line	841
;pattern_fuction.c: 841: switch(Option)
	goto	l15813
	line	844
	
l15611:	
;pattern_fuction.c: 844: LCD_MINUTE_Flash_Times=255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_LCD_MINUTE_Flash_Times)^080h
	line	845
;pattern_fuction.c: 845: LCD_TEMP_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_TEMP_Flash_Times)^080h
	line	846
	
l15613:	
;pattern_fuction.c: 846: display[4]|=1<<3;
	bcf	status, 5	;RP0=0, select bank0
	bsf	0+(_display)+04h+(3/8),(3)&7	;volatile
	line	848
	
l15615:	
;pattern_fuction.c: 848: display[4]&=~(1<<0);
	bcf	0+(_display)+04h+(0/8),(0)&7	;volatile
	line	850
	
l15617:	
;pattern_fuction.c: 850: LCD_HOUR_Flash_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LCD_HOUR_Flash_Times)^080h
	line	851
	
l15619:	
;pattern_fuction.c: 851: Display_Temp[0]=LCDCode[Hour/10];
	movlw	0Ah
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_Hour),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Display_Temp)^080h	;volatile
	line	852
	
l15621:	
;pattern_fuction.c: 852: Display_Temp[1]=LCDCode[Hour%10];
	movlw	0Ah
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_Hour),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_Display_Temp)^080h+01h	;volatile
	line	854
	
l15623:	
;pattern_fuction.c: 854: if(Key_Add_3S_ON|Key_Reduce_3S_ON)
	btfsc	(_Key_Add_3S_ON/8),(_Key_Add_3S_ON)&7
	goto	u9821
	goto	u9820
u9821:
	goto	l15627
u9820:
	
l15625:	
	btfss	(_Key_Reduce_3S_ON/8),(_Key_Reduce_3S_ON)&7
	goto	u9831
	goto	u9830
u9831:
	goto	l15655
u9830:
	line	856
	
l15627:	
;pattern_fuction.c: 855: {
;pattern_fuction.c: 856: LCD_HOUR_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_HOUR_Flash_Times)^080h
	line	858
	
l15629:	
;pattern_fuction.c: 858: if(Timer_3S_Times++>=50)
	incf	(_Timer_3S_Times)^080h,f
	skipnz
	incf	(_Timer_3S_Times+1)^080h,f
	movlw	high(033h)
	subwf	((_Timer_3S_Times+1)^080h),w
	movlw	low(033h)
	skipnz
	subwf	((_Timer_3S_Times)^080h),w
	skipc
	goto	u9841
	goto	u9840
u9841:
	goto	l15675
u9840:
	line	860
	
l15631:	
;pattern_fuction.c: 859: {
;pattern_fuction.c: 860: if(Key_Add_3S_ON)
	btfss	(_Key_Add_3S_ON/8),(_Key_Add_3S_ON)&7
	goto	u9851
	goto	u9850
u9851:
	goto	l15635
u9850:
	line	862
	
l15633:	
;pattern_fuction.c: 861: {
;pattern_fuction.c: 862: Hour+=1;;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_Hour),f
	line	863
;pattern_fuction.c: 863: }
	goto	l15637
	line	865
	
l15635:	
;pattern_fuction.c: 864: else
;pattern_fuction.c: 865: Hour-=1;;
	bcf	status, 5	;RP0=0, select bank0
	decf	(_Hour),f
	line	867
	
l15637:	
;pattern_fuction.c: 867: if(Hour>23) Hour=0;
	movf	(_Hour),w
	xorlw	80h
	addlw	-((018h)^80h)
	skipc
	goto	u9861
	goto	u9860
u9861:
	goto	l15641
u9860:
	
l15639:	
	clrf	(_Hour)
	line	868
	
l15641:	
;pattern_fuction.c: 868: if(Hour<0) Hour=23;
	btfss	(_Hour),7
	goto	u9871
	goto	u9870
u9871:
	goto	l15645
u9870:
	
l15643:	
	movlw	(017h)
	movwf	(_Hour)
	line	870
	
l15645:	
;pattern_fuction.c: 870: Timer_3S_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_Timer_3S_Times)^080h
	clrf	(_Timer_3S_Times+1)^080h
	line	871
	
l15647:	
;pattern_fuction.c: 871: Key_Add_3S_ON=0;
	bcf	(_Key_Add_3S_ON/8),(_Key_Add_3S_ON)&7
	line	872
	
l15649:	
;pattern_fuction.c: 872: Key_Reduce_3S_ON=0;
	bcf	(_Key_Reduce_3S_ON/8),(_Key_Reduce_3S_ON)&7
	line	873
	
l15651:	
;pattern_fuction.c: 873: display[0]=LCDCode[Hour/10];
	movlw	0Ah
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_Hour),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(_display)	;volatile
	line	874
	
l15653:	
;pattern_fuction.c: 874: display[1]=LCDCode[Hour%10];
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_Hour),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+01h	;volatile
	goto	l15675
	line	878
	
l15655:	
;pattern_fuction.c: 877: else
;pattern_fuction.c: 878: if(Add|Reduce)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Add),w
	iorwf	(_Reduce),w
	btfsc	status,2
	goto	u9881
	goto	u9880
u9881:
	goto	l15675
u9880:
	line	880
	
l15657:	
;pattern_fuction.c: 879: {
;pattern_fuction.c: 880: if(Add)
	movf	(_Add),w
	skipz
	goto	u9890
	goto	l15661
u9890:
	line	882
	
l15659:	
;pattern_fuction.c: 881: {
;pattern_fuction.c: 882: Hour++;
	incf	(_Hour),f
	line	883
;pattern_fuction.c: 883: }
	goto	l15665
	line	884
	
l15661:	
;pattern_fuction.c: 884: else if(Reduce)
	movf	(_Reduce),w
	skipz
	goto	u9900
	goto	l15665
u9900:
	line	886
	
l15663:	
;pattern_fuction.c: 885: {
;pattern_fuction.c: 886: Hour--;
	decf	(_Hour),f
	line	888
	
l15665:	
;pattern_fuction.c: 887: }
;pattern_fuction.c: 888: if(Hour>23) Hour=0;
	movf	(_Hour),w
	xorlw	80h
	addlw	-((018h)^80h)
	skipc
	goto	u9911
	goto	u9910
u9911:
	goto	l15669
u9910:
	
l15667:	
	clrf	(_Hour)
	line	889
	
l15669:	
;pattern_fuction.c: 889: if(Hour<0) Hour=23;
	btfss	(_Hour),7
	goto	u9921
	goto	u9920
u9921:
	goto	l15673
u9920:
	
l15671:	
	movlw	(017h)
	movwf	(_Hour)
	line	890
	
l15673:	
;pattern_fuction.c: 890: bool_TimeChange=1;
	bsf	(_bool_TimeChange/8),(_bool_TimeChange)&7
	line	893
	
l15675:	
;pattern_fuction.c: 891: }
;pattern_fuction.c: 893: display[2]=LCDCode[Minute/10];
	movlw	0Ah
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_Minute),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+02h	;volatile
	line	894
	
l15677:	
;pattern_fuction.c: 894: display[3]=LCDCode[Minute%10];
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_Minute),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+03h	;volatile
	line	896
	
l15679:	
;pattern_fuction.c: 896: LCD_TIMER_Flash_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LCD_TIMER_Flash_Times)^080h
	line	897
;pattern_fuction.c: 897: break;
	goto	l5514
	line	899
	
l15681:	
;pattern_fuction.c: 899: LCD_HOUR_Flash_Times=255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_LCD_HOUR_Flash_Times)^080h
	line	901
	
l15683:	
;pattern_fuction.c: 901: Display_Temp[2]=LCDCode[Minute/10];
	movlw	0Ah
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_Minute),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_Display_Temp)^080h+02h	;volatile
	line	902
	
l15685:	
;pattern_fuction.c: 902: Display_Temp[3]=LCDCode[Minute%10];
	movlw	0Ah
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_Minute),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_Display_Temp)^080h+03h	;volatile
	line	903
	
l15687:	
;pattern_fuction.c: 903: LCD_MINUTE_Flash_Times=0;
	clrf	(_LCD_MINUTE_Flash_Times)^080h
	line	906
	
l15689:	
;pattern_fuction.c: 906: if(Key_Add_3S_ON|Key_Reduce_3S_ON)
	btfsc	(_Key_Add_3S_ON/8),(_Key_Add_3S_ON)&7
	goto	u9931
	goto	u9930
u9931:
	goto	l15693
u9930:
	
l15691:	
	btfss	(_Key_Reduce_3S_ON/8),(_Key_Reduce_3S_ON)&7
	goto	u9941
	goto	u9940
u9941:
	goto	l15721
u9940:
	line	908
	
l15693:	
;pattern_fuction.c: 907: {
;pattern_fuction.c: 908: LCD_MINUTE_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_MINUTE_Flash_Times)^080h
	line	909
	
l15695:	
;pattern_fuction.c: 909: if(Timer_3S_Times++>=50)
	incf	(_Timer_3S_Times)^080h,f
	skipnz
	incf	(_Timer_3S_Times+1)^080h,f
	movlw	high(033h)
	subwf	((_Timer_3S_Times+1)^080h),w
	movlw	low(033h)
	skipnz
	subwf	((_Timer_3S_Times)^080h),w
	skipc
	goto	u9951
	goto	u9950
u9951:
	goto	l15733
u9950:
	line	911
	
l15697:	
;pattern_fuction.c: 910: {
;pattern_fuction.c: 911: if(Key_Add_3S_ON)
	btfss	(_Key_Add_3S_ON/8),(_Key_Add_3S_ON)&7
	goto	u9961
	goto	u9960
u9961:
	goto	l15701
u9960:
	line	913
	
l15699:	
;pattern_fuction.c: 912: {
;pattern_fuction.c: 913: Minute+=1;;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_Minute),f
	line	914
;pattern_fuction.c: 914: }
	goto	l15703
	line	916
	
l15701:	
;pattern_fuction.c: 915: else
;pattern_fuction.c: 916: Minute-=1;;
	bcf	status, 5	;RP0=0, select bank0
	decf	(_Minute),f
	line	918
	
l15703:	
;pattern_fuction.c: 918: if(Minute>59) Minute=0;
	movf	(_Minute),w
	xorlw	80h
	addlw	-((03Ch)^80h)
	skipc
	goto	u9971
	goto	u9970
u9971:
	goto	l15707
u9970:
	
l15705:	
	clrf	(_Minute)
	line	919
	
l15707:	
;pattern_fuction.c: 919: if(Minute<0) Minute=59;
	btfss	(_Minute),7
	goto	u9981
	goto	u9980
u9981:
	goto	l15711
u9980:
	
l15709:	
	movlw	(03Bh)
	movwf	(_Minute)
	line	921
	
l15711:	
;pattern_fuction.c: 921: Timer_3S_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_Timer_3S_Times)^080h
	clrf	(_Timer_3S_Times+1)^080h
	line	922
	
l15713:	
;pattern_fuction.c: 922: Key_Add_3S_ON=0;
	bcf	(_Key_Add_3S_ON/8),(_Key_Add_3S_ON)&7
	line	923
	
l15715:	
;pattern_fuction.c: 923: Key_Reduce_3S_ON=0;
	bcf	(_Key_Reduce_3S_ON/8),(_Key_Reduce_3S_ON)&7
	line	924
	
l15717:	
;pattern_fuction.c: 924: display[2]=LCDCode[Minute/10];
	movlw	0Ah
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_Minute),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+02h	;volatile
	line	925
	
l15719:	
;pattern_fuction.c: 925: display[3]=LCDCode[Minute%10];
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_Minute),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+03h	;volatile
	goto	l15733
	line	929
	
l15721:	
;pattern_fuction.c: 928: else
;pattern_fuction.c: 929: if(Add|Reduce)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Add),w
	iorwf	(_Reduce),w
	btfsc	status,2
	goto	u9991
	goto	u9990
u9991:
	goto	l15733
u9990:
	line	931
	
l15723:	
;pattern_fuction.c: 930: {
;pattern_fuction.c: 931: if(Add) Minute++;
	movf	(_Add),w
	skipz
	goto	u10000
	goto	l15727
u10000:
	
l15725:	
	incf	(_Minute),f
	goto	l15731
	line	933
	
l15727:	
;pattern_fuction.c: 932: else
;pattern_fuction.c: 933: if(Reduce) Minute--;
	movf	(_Reduce),w
	skipz
	goto	u10010
	goto	l15731
u10010:
	
l15729:	
	decf	(_Minute),f
	line	934
	
l15731:	
;pattern_fuction.c: 934: bool_TimeChange=1;
	bsf	(_bool_TimeChange/8),(_bool_TimeChange)&7
	line	937
	
l15733:	
;pattern_fuction.c: 935: }
;pattern_fuction.c: 937: if(Minute>59) Minute=0;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Minute),w
	xorlw	80h
	addlw	-((03Ch)^80h)
	skipc
	goto	u10021
	goto	u10020
u10021:
	goto	l15737
u10020:
	
l15735:	
	clrf	(_Minute)
	line	938
	
l15737:	
;pattern_fuction.c: 938: if(Minute<0) Minute=59;
	btfss	(_Minute),7
	goto	u10031
	goto	u10030
u10031:
	goto	l15741
u10030:
	
l15739:	
	movlw	(03Bh)
	movwf	(_Minute)
	line	940
	
l15741:	
;pattern_fuction.c: 940: display[0]=LCDCode[Hour/10];
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_Hour),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(_display)	;volatile
	line	941
	
l15743:	
;pattern_fuction.c: 941: display[1]=LCDCode[Hour%10];
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_Hour),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+01h	;volatile
	line	943
;pattern_fuction.c: 943: break;
	goto	l5514
	line	945
	
l15745:	
;pattern_fuction.c: 945: LCD_MINUTE_Flash_Times=255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_LCD_MINUTE_Flash_Times)^080h
	line	946
;pattern_fuction.c: 946: LCD_TIMER_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_TIMER_Flash_Times)^080h
	line	947
	
l15747:	
;pattern_fuction.c: 947: display[2]=LCDCode[12];
	movlw	low(_LCDCode|8000h+0Ch)
	movwf	fsr0
	movlw	high(_LCDCode|8000h+0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+02h	;volatile
	line	948
	
l15749:	
;pattern_fuction.c: 948: display[3]=LCDCode[10];
	movlw	low(_LCDCode|8000h+0Ah)
	movwf	fsr0
	movlw	high(_LCDCode|8000h+0Ah)
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+03h	;volatile
	line	950
	
l15751:	
;pattern_fuction.c: 950: display[4]&=~(1<<3);
	bcf	0+(_display)+04h+(3/8),(3)&7	;volatile
	line	951
	
l15753:	
;pattern_fuction.c: 951: display[4]&=~(1<<1);
	bcf	0+(_display)+04h+(1/8),(1)&7	;volatile
	line	953
	
l15755:	
;pattern_fuction.c: 953: Display_Temp[0]=LCDCode[Water_Temp/10];
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_Water_Temp),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Display_Temp)^080h	;volatile
	line	954
	
l15757:	
;pattern_fuction.c: 954: Display_Temp[1]=LCDCode[Water_Temp%10];
	movlw	0Ah
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_Water_Temp),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_Display_Temp)^080h+01h	;volatile
	line	955
	
l15759:	
;pattern_fuction.c: 955: LCD_HOUR_Flash_Times=0;
	clrf	(_LCD_HOUR_Flash_Times)^080h
	line	956
	
l15761:	
;pattern_fuction.c: 956: if(Key_Add_3S_ON|Key_Reduce_3S_ON)
	btfsc	(_Key_Add_3S_ON/8),(_Key_Add_3S_ON)&7
	goto	u10041
	goto	u10040
u10041:
	goto	l15765
u10040:
	
l15763:	
	btfss	(_Key_Reduce_3S_ON/8),(_Key_Reduce_3S_ON)&7
	goto	u10051
	goto	u10050
u10051:
	goto	l15791
u10050:
	line	958
	
l15765:	
;pattern_fuction.c: 957: {
;pattern_fuction.c: 958: LCD_HOUR_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_HOUR_Flash_Times)^080h
	line	959
	
l15767:	
;pattern_fuction.c: 959: if(Timer_3S_Times++>=50)
	incf	(_Timer_3S_Times)^080h,f
	skipnz
	incf	(_Timer_3S_Times+1)^080h,f
	movlw	high(033h)
	subwf	((_Timer_3S_Times+1)^080h),w
	movlw	low(033h)
	skipnz
	subwf	((_Timer_3S_Times)^080h),w
	skipc
	goto	u10061
	goto	u10060
u10061:
	goto	l15809
u10060:
	line	961
	
l15769:	
;pattern_fuction.c: 960: {
;pattern_fuction.c: 961: if(Key_Add_3S_ON)
	btfss	(_Key_Add_3S_ON/8),(_Key_Add_3S_ON)&7
	goto	u10071
	goto	u10070
u10071:
	goto	l15773
u10070:
	line	963
	
l15771:	
;pattern_fuction.c: 962: {
;pattern_fuction.c: 963: Water_Temp+=1;;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_Water_Temp),f
	line	964
;pattern_fuction.c: 964: }
	goto	l15775
	line	966
	
l15773:	
;pattern_fuction.c: 965: else
;pattern_fuction.c: 966: Water_Temp-=1;;
	bcf	status, 5	;RP0=0, select bank0
	decf	(_Water_Temp),f
	line	968
	
l15775:	
;pattern_fuction.c: 968: if(Water_Temp>95) Water_Temp=40;
	movf	(_Water_Temp),w
	xorlw	80h
	addlw	-((060h)^80h)
	skipc
	goto	u10081
	goto	u10080
u10081:
	goto	l5416
u10080:
	
l15777:	
	movlw	(028h)
	movwf	(_Water_Temp)
	
l5416:	
	line	969
;pattern_fuction.c: 969: if(Water_Temp<40) Water_Temp=95;
	movf	(_Water_Temp),w
	xorlw	80h
	addlw	-((028h)^80h)
	skipnc
	goto	u10091
	goto	u10090
u10091:
	goto	l15781
u10090:
	
l15779:	
	movlw	(05Fh)
	movwf	(_Water_Temp)
	line	970
	
l15781:	
;pattern_fuction.c: 970: Timer_3S_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_Timer_3S_Times)^080h
	clrf	(_Timer_3S_Times+1)^080h
	line	971
	
l15783:	
;pattern_fuction.c: 971: Key_Add_3S_ON=0;
	bcf	(_Key_Add_3S_ON/8),(_Key_Add_3S_ON)&7
	line	972
	
l15785:	
;pattern_fuction.c: 972: Key_Reduce_3S_ON=0;
	bcf	(_Key_Reduce_3S_ON/8),(_Key_Reduce_3S_ON)&7
	line	973
	
l15787:	
;pattern_fuction.c: 973: display[0]=LCDCode[Water_Temp/10];
	movlw	0Ah
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_Water_Temp),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(_display)	;volatile
	line	974
	
l15789:	
;pattern_fuction.c: 974: display[1]=LCDCode[Water_Temp%10];
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_Water_Temp),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+01h	;volatile
	goto	l15809
	line	978
	
l15791:	
;pattern_fuction.c: 977: else
;pattern_fuction.c: 978: if(Add|Reduce)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Add),w
	iorwf	(_Reduce),w
	btfsc	status,2
	goto	u10101
	goto	u10100
u10101:
	goto	l15809
u10100:
	line	980
	
l15793:	
;pattern_fuction.c: 979: {
;pattern_fuction.c: 980: if(Add) Water_Temp++;
	movf	(_Add),w
	skipz
	goto	u10110
	goto	l15797
u10110:
	
l15795:	
	incf	(_Water_Temp),f
	goto	l15801
	line	982
	
l15797:	
;pattern_fuction.c: 981: else
;pattern_fuction.c: 982: if(Reduce) Water_Temp--;
	movf	(_Reduce),w
	skipz
	goto	u10120
	goto	l15801
u10120:
	
l15799:	
	decf	(_Water_Temp),f
	line	984
	
l15801:	
;pattern_fuction.c: 984: if(Water_Temp>95) Water_Temp=40;
	movf	(_Water_Temp),w
	xorlw	80h
	addlw	-((060h)^80h)
	skipc
	goto	u10131
	goto	u10130
u10131:
	goto	l5423
u10130:
	
l15803:	
	movlw	(028h)
	movwf	(_Water_Temp)
	
l5423:	
	line	985
;pattern_fuction.c: 985: if(Water_Temp<40) Water_Temp=95;
	movf	(_Water_Temp),w
	xorlw	80h
	addlw	-((028h)^80h)
	skipnc
	goto	u10141
	goto	u10140
u10141:
	goto	l15807
u10140:
	
l15805:	
	movlw	(05Fh)
	movwf	(_Water_Temp)
	line	986
	
l15807:	
;pattern_fuction.c: 986: bool_WaterTempChange=1;
	bsf	(_bool_WaterTempChange/8),(_bool_WaterTempChange)&7
	line	989
	
l15809:	
;pattern_fuction.c: 987: }
;pattern_fuction.c: 989: LCD_TEMP_Flash_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LCD_TEMP_Flash_Times)^080h
	line	991
;pattern_fuction.c: 991: break;
	goto	l5514
	line	841
	
l15813:	
	movf	(_Option),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 1 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           20    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l15611
	xorlw	2^1	; case 2
	skipnz
	goto	l15681
	xorlw	3^2	; case 3
	skipnz
	goto	l15745
	goto	l5514
	opt asmopt_on

	line	995
;pattern_fuction.c: 995: case 6:
	
l5425:	
	line	998
;pattern_fuction.c: 998: if((bool_TimeChange==0)&&(bool_WaterTempChange==0))
	btfsc	(_bool_TimeChange/8),(_bool_TimeChange)&7
	goto	u10151
	goto	u10150
u10151:
	goto	l5426
u10150:
	
l15815:	
	btfsc	(_bool_WaterTempChange/8),(_bool_WaterTempChange)&7
	goto	u10161
	goto	u10160
u10161:
	goto	l5426
u10160:
	line	1000
	
l15817:	
;pattern_fuction.c: 999: {
;pattern_fuction.c: 1000: bool_TimeChange=1;
	bsf	(_bool_TimeChange/8),(_bool_TimeChange)&7
	line	1001
;pattern_fuction.c: 1001: bool_WaterTempChange=1;
	bsf	(_bool_WaterTempChange/8),(_bool_WaterTempChange)&7
	line	1003
	
l5426:	
	line	1008
;pattern_fuction.c: 1003: }
;pattern_fuction.c: 1008: Key_Regular_Lock=0;
	bcf	(_Key_Regular_Lock/8),(_Key_Regular_Lock)&7
	line	1009
;pattern_fuction.c: 1009: Key_Bold_Lock=0;
	bcf	(_Key_Bold_Lock/8),(_Key_Bold_Lock)&7
	line	1010
;pattern_fuction.c: 1010: Key_Iced_Lock=0;
	bcf	(_Key_Iced_Lock/8),(_Key_Iced_Lock)&7
	line	1011
;pattern_fuction.c: 1011: Key_Tea_Lock=0;
	bcf	(_Key_Tea_Lock/8),(_Key_Tea_Lock)&7
	line	1012
;pattern_fuction.c: 1012: Key_Add_Lock=1;
	bsf	(_Key_Add_Lock/8),(_Key_Add_Lock)&7
	line	1013
;pattern_fuction.c: 1013: Key_Reduce_Lock=1;
	bsf	(_Key_Reduce_Lock/8),(_Key_Reduce_Lock)&7
	line	1014
;pattern_fuction.c: 1014: Key_80_Z_Lock=0;
	bcf	(_Key_80_Z_Lock/8),(_Key_80_Z_Lock)&7
	line	1015
;pattern_fuction.c: 1015: Key_120_Z_Lock=0;
	bcf	(_Key_120_Z_Lock/8),(_Key_120_Z_Lock)&7
	line	1016
;pattern_fuction.c: 1016: Key_210_Z_Lock=0;
	bcf	(_Key_210_Z_Lock/8),(_Key_210_Z_Lock)&7
	line	1017
;pattern_fuction.c: 1017: Key_420_Z_Lock=0;
	bcf	(_Key_420_Z_Lock/8),(_Key_420_Z_Lock)&7
	line	1018
;pattern_fuction.c: 1018: Key_Option_Lock=1;
	bsf	(_Key_Option_Lock/8),(_Key_Option_Lock)&7
	line	1019
;pattern_fuction.c: 1019: Key_Start_Lock=1;
	bsf	(_Key_Start_Lock/8),(_Key_Start_Lock)&7
	line	1020
	
l15819:	
;pattern_fuction.c: 1020: Start=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_Start)
	line	1021
	
l15821:	
;pattern_fuction.c: 1021: Pattern_State=7;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Pattern_State)^080h
	line	1022
;pattern_fuction.c: 1022: break;
	goto	l5514
	line	1024
	
l15823:	
;pattern_fuction.c: 1024: LCD_AUTO_Flash_Times=0;
	clrf	(_LCD_AUTO_Flash_Times)^080h
	line	1026
	
l15825:	
;pattern_fuction.c: 1026: if(Time_Temp_Counter++>=1250)
	incf	(_Time_Temp_Counter)^080h,f
	skipnz
	incf	(_Time_Temp_Counter+1)^080h,f
	movlw	high(04E3h)
	subwf	((_Time_Temp_Counter+1)^080h),w
	movlw	low(04E3h)
	skipnz
	subwf	((_Time_Temp_Counter)^080h),w
	skipc
	goto	u10171
	goto	u10170
u10171:
	goto	l15831
u10170:
	line	1028
	
l15827:	
;pattern_fuction.c: 1027: {
;pattern_fuction.c: 1028: Time_Temp_Dis=~Time_Temp_Dis;
	movlw	1<<((_Time_Temp_Dis)&7)
	xorwf	((_Time_Temp_Dis)/8),f
	line	1029
	
l15829:	
;pattern_fuction.c: 1029: Time_Temp_Counter=0;
	clrf	(_Time_Temp_Counter)^080h
	clrf	(_Time_Temp_Counter+1)^080h
	line	1032
	
l15831:	
;pattern_fuction.c: 1030: }
;pattern_fuction.c: 1032: if(Time_Temp_Dis)
	btfss	(_Time_Temp_Dis/8),(_Time_Temp_Dis)&7
	goto	u10181
	goto	u10180
u10181:
	goto	l5429
u10180:
	line	1034
	
l15833:	
;pattern_fuction.c: 1033: {
;pattern_fuction.c: 1034: if(bool_TimeChange)
	btfss	(_bool_TimeChange/8),(_bool_TimeChange)&7
	goto	u10191
	goto	u10190
u10191:
	goto	l5430
u10190:
	line	1036
	
l15835:	
;pattern_fuction.c: 1035: {
;pattern_fuction.c: 1036: LCD_TIMER_Flash_Times=0;
	clrf	(_LCD_TIMER_Flash_Times)^080h
	line	1037
	
l15837:	
;pattern_fuction.c: 1037: LCD_TEMP_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_TEMP_Flash_Times)^080h
	line	1038
	
l15839:	
;pattern_fuction.c: 1038: LCD_HOUR_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_HOUR_Flash_Times)^080h
	line	1039
	
l15841:	
;pattern_fuction.c: 1039: LCD_MINUTE_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_MINUTE_Flash_Times)^080h
	line	1040
	
l15843:	
;pattern_fuction.c: 1040: LCD_COL_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_COL_Flash_Times)^080h
	line	1041
	
l15845:	
;pattern_fuction.c: 1041: display[4]&=~(1<<0);
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_display)+04h+(0/8),(0)&7	;volatile
	line	1042
	
l15847:	
;pattern_fuction.c: 1042: display[4]|=1<<3;
	bsf	0+(_display)+04h+(3/8),(3)&7	;volatile
	line	1044
	
l15849:	
;pattern_fuction.c: 1044: display[0]=LCDCode[Hour/10];
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_Hour),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(_display)	;volatile
	line	1045
	
l15851:	
;pattern_fuction.c: 1045: display[1]=LCDCode[Hour%10];
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_Hour),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+01h	;volatile
	line	1046
	
l15853:	
;pattern_fuction.c: 1046: display[2]=LCDCode[Minute/10];
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_Minute),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+02h	;volatile
	line	1047
	
l15855:	
;pattern_fuction.c: 1047: display[3]=LCDCode[Minute%10];
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_Minute),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+03h	;volatile
	line	1049
;pattern_fuction.c: 1049: }
	goto	l15879
	line	1050
	
l5430:	
	line	1052
;pattern_fuction.c: 1050: else
;pattern_fuction.c: 1051: {
;pattern_fuction.c: 1052: Time_Temp_Dis=0;
	bcf	(_Time_Temp_Dis/8),(_Time_Temp_Dis)&7
	goto	l15879
	line	1055
	
l5429:	
	line	1057
;pattern_fuction.c: 1055: else
;pattern_fuction.c: 1056: {
;pattern_fuction.c: 1057: if(bool_WaterTempChange)
	btfss	(_bool_WaterTempChange/8),(_bool_WaterTempChange)&7
	goto	u10201
	goto	u10200
u10201:
	goto	l5433
u10200:
	line	1059
	
l15857:	
;pattern_fuction.c: 1058: {
;pattern_fuction.c: 1059: LCD_TIMER_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_TIMER_Flash_Times)^080h
	line	1060
	
l15859:	
;pattern_fuction.c: 1060: LCD_TEMP_Flash_Times=0;
	clrf	(_LCD_TEMP_Flash_Times)^080h
	line	1061
	
l15861:	
;pattern_fuction.c: 1061: LCD_HOUR_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_HOUR_Flash_Times)^080h
	line	1062
	
l15863:	
;pattern_fuction.c: 1062: LCD_MINUTE_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_MINUTE_Flash_Times)^080h
	line	1063
	
l15865:	
;pattern_fuction.c: 1063: LCD_COL_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_COL_Flash_Times)^080h
	line	1064
	
l15867:	
;pattern_fuction.c: 1064: display[4]&=~(1<<1);
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_display)+04h+(1/8),(1)&7	;volatile
	line	1065
	
l15869:	
;pattern_fuction.c: 1065: display[4]&=~(1<<3);
	bcf	0+(_display)+04h+(3/8),(3)&7	;volatile
	line	1067
	
l15871:	
;pattern_fuction.c: 1067: display[0]=LCDCode[Water_Temp/10];
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_Water_Temp),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(_display)	;volatile
	line	1068
	
l15873:	
;pattern_fuction.c: 1068: display[1]=LCDCode[Water_Temp%10];
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_Water_Temp),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+01h	;volatile
	line	1069
	
l15875:	
;pattern_fuction.c: 1069: display[2]=LCDCode[12];
	movlw	low(_LCDCode|8000h+0Ch)
	movwf	fsr0
	movlw	high(_LCDCode|8000h+0Ch)
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+02h	;volatile
	line	1070
	
l15877:	
;pattern_fuction.c: 1070: display[3]=LCDCode[10];
	movlw	low(_LCDCode|8000h+0Ah)
	movwf	fsr0
	movlw	high(_LCDCode|8000h+0Ah)
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+03h	;volatile
	line	1072
;pattern_fuction.c: 1072: }
	goto	l15879
	line	1073
	
l5433:	
	line	1075
;pattern_fuction.c: 1073: else
;pattern_fuction.c: 1074: {
;pattern_fuction.c: 1075: Time_Temp_Dis=1;
	bsf	(_Time_Temp_Dis/8),(_Time_Temp_Dis)&7
	line	1081
	
l15879:	
;pattern_fuction.c: 1076: }
;pattern_fuction.c: 1077: }
;pattern_fuction.c: 1081: if((Regular|Bold|Iced|Tea)&&(_80_z|_120_z|_210_z|_420_z))
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Regular),w
	iorwf	(_Bold),w
	iorwf	(_Iced),w
	iorwf	(_Tea),w
	btfsc	status,2
	goto	u10211
	goto	u10210
u10211:
	goto	l5514
u10210:
	
l15881:	
	movf	(__80_z),w
	iorwf	(__120_z),w
	iorwf	(__210_z),w
	iorwf	(__420_z),w
	btfsc	status,2
	goto	u10221
	goto	u10220
u10221:
	goto	l5514
u10220:
	line	1083
	
l15883:	
;pattern_fuction.c: 1082: {
;pattern_fuction.c: 1083: Key_Start_Lock=0;
	bcf	(_Key_Start_Lock/8),(_Key_Start_Lock)&7
	line	1084
	
l15885:	
;pattern_fuction.c: 1084: if(Start)
	movf	(_Start),w
	skipz
	goto	u10230
	goto	l5514
u10230:
	line	1085
	
l15887:	
;pattern_fuction.c: 1085: Pattern_State=8;
	movlw	(08h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Pattern_State)^080h
	goto	l5514
	line	1094
	
l15889:	
;pattern_fuction.c: 1094: Pattern_State=9;
	movlw	(09h)
	movwf	(_Pattern_State)^080h
	line	1095
;pattern_fuction.c: 1095: break;
	goto	l5514
	line	1101
	
l15891:	
;pattern_fuction.c: 1101: if(Time_Temp_Counter++>=1250)
	incf	(_Time_Temp_Counter)^080h,f
	skipnz
	incf	(_Time_Temp_Counter+1)^080h,f
	movlw	high(04E3h)
	subwf	((_Time_Temp_Counter+1)^080h),w
	movlw	low(04E3h)
	skipnz
	subwf	((_Time_Temp_Counter)^080h),w
	skipc
	goto	u10241
	goto	u10240
u10241:
	goto	l15897
u10240:
	line	1103
	
l15893:	
;pattern_fuction.c: 1102: {
;pattern_fuction.c: 1103: Time_Temp_Dis=~Time_Temp_Dis;
	movlw	1<<((_Time_Temp_Dis)&7)
	xorwf	((_Time_Temp_Dis)/8),f
	line	1104
	
l15895:	
;pattern_fuction.c: 1104: Time_Temp_Counter=0;
	clrf	(_Time_Temp_Counter)^080h
	clrf	(_Time_Temp_Counter+1)^080h
	line	1107
	
l15897:	
;pattern_fuction.c: 1105: }
;pattern_fuction.c: 1107: if(Time_Temp_Dis)
	btfss	(_Time_Temp_Dis/8),(_Time_Temp_Dis)&7
	goto	u10251
	goto	u10250
u10251:
	goto	l5440
u10250:
	line	1109
	
l15899:	
;pattern_fuction.c: 1108: {
;pattern_fuction.c: 1109: if(bool_TimeChange)
	btfss	(_bool_TimeChange/8),(_bool_TimeChange)&7
	goto	u10261
	goto	u10260
u10261:
	goto	l5441
u10260:
	line	1111
	
l15901:	
;pattern_fuction.c: 1110: {
;pattern_fuction.c: 1111: LCD_TIMER_Flash_Times=0;
	clrf	(_LCD_TIMER_Flash_Times)^080h
	line	1112
	
l15903:	
;pattern_fuction.c: 1112: LCD_TEMP_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_TEMP_Flash_Times)^080h
	line	1113
	
l15905:	
;pattern_fuction.c: 1113: LCD_HOUR_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_HOUR_Flash_Times)^080h
	line	1114
	
l15907:	
;pattern_fuction.c: 1114: LCD_MINUTE_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_MINUTE_Flash_Times)^080h
	line	1115
	
l15909:	
;pattern_fuction.c: 1115: LCD_COL_Flash_Times=0;
	clrf	(_LCD_COL_Flash_Times)^080h
	line	1116
	
l15911:	
;pattern_fuction.c: 1116: display[4]&=~(1<<0);
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_display)+04h+(0/8),(0)&7	;volatile
	line	1119
	
l15913:	
;pattern_fuction.c: 1119: display[0]=LCDCode[Hour/10];
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_Hour),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(_display)	;volatile
	line	1120
	
l15915:	
;pattern_fuction.c: 1120: display[1]=LCDCode[Hour%10];
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_Hour),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+01h	;volatile
	line	1121
	
l15917:	
;pattern_fuction.c: 1121: display[2]=LCDCode[Minute/10];
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_Minute),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+02h	;volatile
	line	1122
	
l15919:	
;pattern_fuction.c: 1122: display[3]=LCDCode[Minute%10];
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_Minute),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+03h	;volatile
	line	1124
;pattern_fuction.c: 1124: }
	goto	l15943
	line	1125
	
l5441:	
	line	1127
;pattern_fuction.c: 1125: else
;pattern_fuction.c: 1126: {
;pattern_fuction.c: 1127: Time_Temp_Dis=0;
	bcf	(_Time_Temp_Dis/8),(_Time_Temp_Dis)&7
	goto	l15943
	line	1130
	
l5440:	
	line	1132
;pattern_fuction.c: 1130: else
;pattern_fuction.c: 1131: {
;pattern_fuction.c: 1132: if(bool_WaterTempChange)
	btfss	(_bool_WaterTempChange/8),(_bool_WaterTempChange)&7
	goto	u10271
	goto	u10270
u10271:
	goto	l5444
u10270:
	line	1134
	
l15921:	
;pattern_fuction.c: 1133: {
;pattern_fuction.c: 1134: LCD_TIMER_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_TIMER_Flash_Times)^080h
	line	1135
	
l15923:	
;pattern_fuction.c: 1135: LCD_TEMP_Flash_Times=0;
	clrf	(_LCD_TEMP_Flash_Times)^080h
	line	1136
	
l15925:	
;pattern_fuction.c: 1136: LCD_HOUR_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_HOUR_Flash_Times)^080h
	line	1137
	
l15927:	
;pattern_fuction.c: 1137: LCD_MINUTE_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_MINUTE_Flash_Times)^080h
	line	1138
	
l15929:	
;pattern_fuction.c: 1138: LCD_COL_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_COL_Flash_Times)^080h
	line	1139
	
l15931:	
;pattern_fuction.c: 1139: display[4]&=~(1<<1);
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_display)+04h+(1/8),(1)&7	;volatile
	line	1140
	
l15933:	
;pattern_fuction.c: 1140: display[4]&=~(1<<3);
	bcf	0+(_display)+04h+(3/8),(3)&7	;volatile
	line	1142
	
l15935:	
;pattern_fuction.c: 1142: display[0]=LCDCode[Water_Temp/10];
	movlw	0Ah
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	movf	(_Water_Temp),w
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	btfsc	0+(?___awdiv)+02h,7
	decf	1+(?___awdiv)+02h,f
	fcall	___awdiv
	movf	(0+(?___awdiv)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(_display)	;volatile
	line	1143
	
l15937:	
;pattern_fuction.c: 1143: display[1]=LCDCode[Water_Temp%10];
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(_Water_Temp),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+01h	;volatile
	line	1144
	
l15939:	
;pattern_fuction.c: 1144: display[2]=LCDCode[12];
	movlw	low(_LCDCode|8000h+0Ch)
	movwf	fsr0
	movlw	high(_LCDCode|8000h+0Ch)
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+02h	;volatile
	line	1145
	
l15941:	
;pattern_fuction.c: 1145: display[3]=LCDCode[10];
	movlw	low(_LCDCode|8000h+0Ah)
	movwf	fsr0
	movlw	high(_LCDCode|8000h+0Ah)
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+03h	;volatile
	line	1147
;pattern_fuction.c: 1147: }
	goto	l15943
	line	1148
	
l5444:	
	line	1150
;pattern_fuction.c: 1148: else
;pattern_fuction.c: 1149: {
;pattern_fuction.c: 1150: Time_Temp_Dis=1;
	bsf	(_Time_Temp_Dis/8),(_Time_Temp_Dis)&7
	line	1154
	
l15943:	
;pattern_fuction.c: 1151: }
;pattern_fuction.c: 1152: }
;pattern_fuction.c: 1154: if(++TimeCounter>250)
	movlw	(0FBh)
	bsf	status, 5	;RP0=1, select bank1
	incf	(_TimeCounter)^080h,f
	subwf	((_TimeCounter)^080h),w
	skipc
	goto	u10281
	goto	u10280
u10281:
	goto	l5446
u10280:
	line	1156
	
l15945:	
;pattern_fuction.c: 1155: {
;pattern_fuction.c: 1156: TimeCounter=0;
	clrf	(_TimeCounter)^080h
	line	1157
	
l15947:	
;pattern_fuction.c: 1157: Second++;
	incf	(_Second)^080h,f
	line	1158
	
l15949:	
;pattern_fuction.c: 1158: if(Second>=60)
	movlw	(03Ch)
	subwf	(_Second)^080h,w
	skipc
	goto	u10291
	goto	u10290
u10291:
	goto	l5446
u10290:
	line	1160
	
l15951:	
;pattern_fuction.c: 1159: {
;pattern_fuction.c: 1160: Second=0;
	clrf	(_Second)^080h
	line	1161
	
l15953:	
;pattern_fuction.c: 1161: Minute--;
	bcf	status, 5	;RP0=0, select bank0
	decf	(_Minute),f
	line	1162
	
l15955:	
;pattern_fuction.c: 1162: if(Minute<0)
	btfss	(_Minute),7
	goto	u10301
	goto	u10300
u10301:
	goto	l5446
u10300:
	line	1164
	
l15957:	
;pattern_fuction.c: 1163: {
;pattern_fuction.c: 1164: Hour--;
	decf	(_Hour),f
	line	1169
	
l5446:	
	line	1171
;pattern_fuction.c: 1165: }
;pattern_fuction.c: 1167: }
;pattern_fuction.c: 1169: }
;pattern_fuction.c: 1171: if((Hour==0)&&(Minute==0))
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Hour),f
	skipz
	goto	u10311
	goto	u10310
u10311:
	goto	l5514
u10310:
	
l15959:	
	movf	(_Minute),f
	skipz
	goto	u10321
	goto	u10320
u10321:
	goto	l5514
u10320:
	goto	l15569
	line	1178
;pattern_fuction.c: 1178: case 10:
	
l5450:	
	line	1180
;pattern_fuction.c: 1180: ANNULUS_LIGHT_State=1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_ANNULUS_LIGHT_State)
	incf	(_ANNULUS_LIGHT_State),f
	line	1181
;pattern_fuction.c: 1181: SHOW_LIGHT_State=1;
	clrf	(_SHOW_LIGHT_State)
	incf	(_SHOW_LIGHT_State),f
	line	1183
	
l15963:	
;pattern_fuction.c: 1183: LCD_TEMP_Flash_Times=255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_LCD_TEMP_Flash_Times)^080h
	line	1184
;pattern_fuction.c: 1184: LCD_AUTO_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_AUTO_Flash_Times)^080h
	line	1187
;pattern_fuction.c: 1187: LCD_HOUR_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_HOUR_Flash_Times)^080h
	line	1188
;pattern_fuction.c: 1188: LCD_MINUTE_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_MINUTE_Flash_Times)^080h
	line	1190
	
l15965:	
;pattern_fuction.c: 1190: Temp_595[1]|=1<<6;
	bcf	status, 5	;RP0=0, select bank0
	bsf	0+(_Temp_595)+01h+(6/8),(6)&7	;volatile
	line	1191
	
l15967:	
;pattern_fuction.c: 1191: Temp_595[1]|=1<<7;
	bsf	0+(_Temp_595)+01h+(7/8),(7)&7	;volatile
	line	1194
	
l15969:	
;pattern_fuction.c: 1194: display[4]&=~(1<<1);
	bcf	0+(_display)+04h+(1/8),(1)&7	;volatile
	line	1195
	
l15971:	
;pattern_fuction.c: 1195: display[4]|=1<<0;
	bsf	0+(_display)+04h+(0/8),(0)&7	;volatile
	line	1196
	
l15973:	
;pattern_fuction.c: 1196: display[4]&=~(1<<2);
	bcf	0+(_display)+04h+(2/8),(2)&7	;volatile
	line	1197
;pattern_fuction.c: 1197: LCD_State=5;
	movlw	(05h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_LCD_State)^080h
	line	1199
	
l15975:	
;pattern_fuction.c: 1199: LED12_State=1;
	clrf	(_LED12_State)^080h
	incf	(_LED12_State)^080h,f
	line	1202
	
l15977:	
;pattern_fuction.c: 1202: Key_Regular_Lock=1;
	bsf	(_Key_Regular_Lock/8),(_Key_Regular_Lock)&7
	line	1203
	
l15979:	
;pattern_fuction.c: 1203: Key_Bold_Lock=1;
	bsf	(_Key_Bold_Lock/8),(_Key_Bold_Lock)&7
	line	1204
	
l15981:	
;pattern_fuction.c: 1204: Key_Iced_Lock=1;
	bsf	(_Key_Iced_Lock/8),(_Key_Iced_Lock)&7
	line	1205
	
l15983:	
;pattern_fuction.c: 1205: Key_Tea_Lock=1;
	bsf	(_Key_Tea_Lock/8),(_Key_Tea_Lock)&7
	line	1206
	
l15985:	
;pattern_fuction.c: 1206: Key_Add_Lock=1;
	bsf	(_Key_Add_Lock/8),(_Key_Add_Lock)&7
	line	1207
	
l15987:	
;pattern_fuction.c: 1207: Key_Reduce_Lock=1;
	bsf	(_Key_Reduce_Lock/8),(_Key_Reduce_Lock)&7
	line	1208
	
l15989:	
;pattern_fuction.c: 1208: Key_80_Z_Lock=1;
	bsf	(_Key_80_Z_Lock/8),(_Key_80_Z_Lock)&7
	line	1209
	
l15991:	
;pattern_fuction.c: 1209: Key_120_Z_Lock=1;
	bsf	(_Key_120_Z_Lock/8),(_Key_120_Z_Lock)&7
	line	1210
	
l15993:	
;pattern_fuction.c: 1210: Key_210_Z_Lock=1;
	bsf	(_Key_210_Z_Lock/8),(_Key_210_Z_Lock)&7
	line	1211
	
l15995:	
;pattern_fuction.c: 1211: Key_420_Z_Lock=1;
	bsf	(_Key_420_Z_Lock/8),(_Key_420_Z_Lock)&7
	line	1212
	
l15997:	
;pattern_fuction.c: 1212: Key_Option_Lock=1;
	bsf	(_Key_Option_Lock/8),(_Key_Option_Lock)&7
	line	1213
	
l15999:	
;pattern_fuction.c: 1213: Key_Start_Lock=0;
	bcf	(_Key_Start_Lock/8),(_Key_Start_Lock)&7
	line	1214
	
l16001:	
;pattern_fuction.c: 1214: Start=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_Start)
	line	1216
	
l16003:	
;pattern_fuction.c: 1216: LCD_TIMER_Flash_Times=255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_LCD_TIMER_Flash_Times)^080h
	line	1217
	
l16005:	
;pattern_fuction.c: 1217: LCD_TEMP_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_TEMP_Flash_Times)^080h
	line	1218
	
l16007:	
;pattern_fuction.c: 1218: LCD_HOUR_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_HOUR_Flash_Times)^080h
	line	1219
	
l16009:	
;pattern_fuction.c: 1219: LCD_MINUTE_Flash_Times=255;
	movlw	(0FFh)
	movwf	(_LCD_MINUTE_Flash_Times)^080h
	line	1221
	
l16011:	
;pattern_fuction.c: 1221: Pattern_State=11;
	movlw	(0Bh)
	movwf	(_Pattern_State)^080h
	line	1222
;pattern_fuction.c: 1222: break;
	goto	l5514
	line	1225
	
l16013:	
;pattern_fuction.c: 1225: if(Start) Pattern_State=0;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Start),w
	skipz
	goto	u10330
	goto	l16017
u10330:
	
l16015:	
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_Pattern_State)^080h
	line	1226
	
l16017:	
;pattern_fuction.c: 1226: if(WortTimeCount++>=250)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	incf	(_WortTimeCount)^0180h,f
	skipnz
	incf	(_WortTimeCount+1)^0180h,f
	movlw	high(0FBh)
	subwf	((_WortTimeCount+1)^0180h),w
	movlw	low(0FBh)
	skipnz
	subwf	((_WortTimeCount)^0180h),w
	skipc
	goto	u10341
	goto	u10340
u10341:
	goto	l16039
u10340:
	line	1228
	
l16019:	
;pattern_fuction.c: 1227: {
;pattern_fuction.c: 1228: WortTimeCount=0;
	clrf	(_WortTimeCount)^0180h
	clrf	(_WortTimeCount+1)^0180h
	line	1230
	
l16021:	
;pattern_fuction.c: 1230: if(++Time_Temp_Counter>=6)
	bcf	status, 6	;RP1=0, select bank1
	incf	(_Time_Temp_Counter)^080h,f
	skipnz
	incf	(_Time_Temp_Counter+1)^080h,f
	movlw	high(06h)
	subwf	((_Time_Temp_Counter+1)^080h),w
	movlw	low(06h)
	skipnz
	subwf	((_Time_Temp_Counter)^080h),w
	skipc
	goto	u10351
	goto	u10350
u10351:
	goto	l16027
u10350:
	line	1232
	
l16023:	
;pattern_fuction.c: 1231: {
;pattern_fuction.c: 1232: Time_Temp_Counter=0;
	clrf	(_Time_Temp_Counter)^080h
	clrf	(_Time_Temp_Counter+1)^080h
	line	1233
	
l16025:	
;pattern_fuction.c: 1233: Time_Temp_Dis=~Time_Temp_Dis;
	movlw	1<<((_Time_Temp_Dis)&7)
	xorwf	((_Time_Temp_Dis)/8),f
	line	1236
	
l16027:	
;pattern_fuction.c: 1234: }
;pattern_fuction.c: 1236: WorkSecond+=1;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_WorkSecond),f
	line	1237
	
l16029:	
;pattern_fuction.c: 1237: if(WorkSecond>59)
	movlw	(03Ch)
	subwf	(_WorkSecond),w
	skipc
	goto	u10361
	goto	u10360
u10361:
	goto	l16039
u10360:
	line	1239
	
l16031:	
;pattern_fuction.c: 1238: {
;pattern_fuction.c: 1239: WorkSecond=0;
	clrf	(_WorkSecond)
	line	1240
	
l16033:	
;pattern_fuction.c: 1240: WorkMinute++;
	incf	(_WorkMinute),f
	line	1241
	
l16035:	
;pattern_fuction.c: 1241: if(WorkMinute>99) WorkMinute=0;
	movlw	(064h)
	subwf	(_WorkMinute),w
	skipc
	goto	u10371
	goto	u10370
u10371:
	goto	l16039
u10370:
	
l16037:	
	clrf	(_WorkMinute)
	line	1245
	
l16039:	
;pattern_fuction.c: 1242: }
;pattern_fuction.c: 1243: }
;pattern_fuction.c: 1245: if(Time_Temp_Dis)
	btfss	(_Time_Temp_Dis/8),(_Time_Temp_Dis)&7
	goto	u10381
	goto	u10380
u10381:
	goto	l16055
u10380:
	line	1253
	
l16041:	
;pattern_fuction.c: 1246: {
;pattern_fuction.c: 1248: {
;pattern_fuction.c: 1253: LCD_COL_Flash_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_LCD_COL_Flash_Times)^080h
	line	1254
	
l16043:	
;pattern_fuction.c: 1254: display[4]&=~(1<<0);
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_display)+04h+(0/8),(0)&7	;volatile
	line	1255
	
l16045:	
;pattern_fuction.c: 1255: display[4]|=1<<1;
	bsf	0+(_display)+04h+(1/8),(1)&7	;volatile
	line	1258
	
l16047:	
;pattern_fuction.c: 1258: display[0]=LCDCode[WorkMinute/10];
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(_WorkMinute),w
	fcall	___lbdiv
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(_display)	;volatile
	line	1259
	
l16049:	
;pattern_fuction.c: 1259: display[1]=LCDCode[WorkMinute%10];
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(_WorkMinute),w
	fcall	___lbmod
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+01h	;volatile
	line	1260
	
l16051:	
;pattern_fuction.c: 1260: display[2]=LCDCode[WorkSecond/10];
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(_WorkSecond),w
	fcall	___lbdiv
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+02h	;volatile
	line	1261
	
l16053:	
;pattern_fuction.c: 1261: display[3]=LCDCode[WorkSecond%10];
	movlw	(0Ah)
	movwf	(?___lbmod)
	movf	(_WorkSecond),w
	fcall	___lbmod
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+03h	;volatile
	line	1268
;pattern_fuction.c: 1263: }
;pattern_fuction.c: 1265: {
;pattern_fuction.c: 1267: }
;pattern_fuction.c: 1268: }
	goto	l16189
	line	1274
	
l16055:	
;pattern_fuction.c: 1269: else
;pattern_fuction.c: 1270: {
;pattern_fuction.c: 1272: {
;pattern_fuction.c: 1274: LCD_COL_Flash_Times=255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_LCD_COL_Flash_Times)^080h
	line	1275
	
l16057:	
;pattern_fuction.c: 1275: display[4]|=1<<0;
	bcf	status, 5	;RP0=0, select bank0
	bsf	0+(_display)+04h+(0/8),(0)&7	;volatile
	line	1276
	
l16059:	
;pattern_fuction.c: 1276: display[4]&=~(1<<1);
	bcf	0+(_display)+04h+(1/8),(1)&7	;volatile
	line	1277
	
l16061:	
;pattern_fuction.c: 1277: display[4]&=~(1<<3);
	bcf	0+(_display)+04h+(3/8),(3)&7	;volatile
	line	1278
	
l16063:	
;pattern_fuction.c: 1278: Hex_To_Temp(Temperature_Dat);
	movf	(_Temperature_Dat),w	;volatile
	fcall	_Hex_To_Temp
	goto	l16189
	line	1290
	
l16065:	
;pattern_fuction.c: 1290: if(_80_z)
	bcf	status, 5	;RP0=0, select bank0
	movf	(__80_z),w
	skipz
	goto	u10390
	goto	l16083
u10390:
	line	1292
	
l16067:	
;pattern_fuction.c: 1291: {
;pattern_fuction.c: 1292: Solenoid_Work_Time=15;
	movlw	0Fh
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Solenoid_Work_Time)^080h
	clrf	(_Solenoid_Work_Time+1)^080h
	line	1293
;pattern_fuction.c: 1293: Solenoid_Stop_Time=5;
	movlw	05h
	movwf	(_Solenoid_Stop_Time)^080h
	clrf	(_Solenoid_Stop_Time+1)^080h
	line	1294
;pattern_fuction.c: 1294: if(Regular)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Regular),w
	skipz
	goto	u10400
	goto	l16071
u10400:
	line	1296
	
l16069:	
;pattern_fuction.c: 1295: {
;pattern_fuction.c: 1296: PATTERN_WORK_TIME=30;
	movlw	01Eh
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_PATTERN_WORK_TIME)^080h
	clrf	(_PATTERN_WORK_TIME+1)^080h
	line	1297
;pattern_fuction.c: 1297: }
	goto	l16137
	line	1299
	
l16071:	
;pattern_fuction.c: 1298: else
;pattern_fuction.c: 1299: if(Bold)
	movf	(_Bold),w
	skipz
	goto	u10410
	goto	l16075
u10410:
	line	1301
	
l16073:	
;pattern_fuction.c: 1300: {
;pattern_fuction.c: 1301: PATTERN_WORK_TIME=75;
	movlw	04Bh
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_PATTERN_WORK_TIME)^080h
	clrf	(_PATTERN_WORK_TIME+1)^080h
	line	1302
;pattern_fuction.c: 1302: }
	goto	l16137
	line	1304
	
l16075:	
;pattern_fuction.c: 1303: else
;pattern_fuction.c: 1304: if(Iced)
	movf	(_Iced),w
	skipz
	goto	u10420
	goto	l16079
u10420:
	goto	l16073
	line	1309
	
l16079:	
;pattern_fuction.c: 1308: else
;pattern_fuction.c: 1309: if(Tea)
	movf	(_Tea),w
	skipz
	goto	u10430
	goto	l5467
u10430:
	line	1311
	
l16081:	
;pattern_fuction.c: 1310: {
;pattern_fuction.c: 1311: PATTERN_WORK_TIME=20;
	movlw	014h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_PATTERN_WORK_TIME)^080h
	clrf	(_PATTERN_WORK_TIME+1)^080h
	goto	l16137
	line	1314
	
l5467:	
	goto	l16137
	line	1316
	
l16083:	
;pattern_fuction.c: 1315: else
;pattern_fuction.c: 1316: if(_120_z)
	movf	(__120_z),w
	skipz
	goto	u10440
	goto	l16101
u10440:
	line	1318
	
l16085:	
;pattern_fuction.c: 1317: {
;pattern_fuction.c: 1318: Solenoid_Work_Time=20;
	movlw	014h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Solenoid_Work_Time)^080h
	clrf	(_Solenoid_Work_Time+1)^080h
	line	1319
;pattern_fuction.c: 1319: Solenoid_Stop_Time=5;
	movlw	05h
	movwf	(_Solenoid_Stop_Time)^080h
	clrf	(_Solenoid_Stop_Time+1)^080h
	line	1320
;pattern_fuction.c: 1320: if(Regular)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Regular),w
	skipz
	goto	u10450
	goto	l16089
u10450:
	line	1322
	
l16087:	
;pattern_fuction.c: 1321: {
;pattern_fuction.c: 1322: PATTERN_WORK_TIME=53;
	movlw	035h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_PATTERN_WORK_TIME)^080h
	clrf	(_PATTERN_WORK_TIME+1)^080h
	line	1323
;pattern_fuction.c: 1323: }
	goto	l16137
	line	1325
	
l16089:	
;pattern_fuction.c: 1324: else
;pattern_fuction.c: 1325: if(Bold)
	movf	(_Bold),w
	skipz
	goto	u10460
	goto	l16093
u10460:
	line	1327
	
l16091:	
;pattern_fuction.c: 1326: {
;pattern_fuction.c: 1327: PATTERN_WORK_TIME=120;
	movlw	078h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_PATTERN_WORK_TIME)^080h
	clrf	(_PATTERN_WORK_TIME+1)^080h
	line	1328
;pattern_fuction.c: 1328: }
	goto	l16137
	line	1330
	
l16093:	
;pattern_fuction.c: 1329: else
;pattern_fuction.c: 1330: if(Iced)
	movf	(_Iced),w
	skipz
	goto	u10470
	goto	l16097
u10470:
	goto	l16091
	line	1335
	
l16097:	
;pattern_fuction.c: 1334: else
;pattern_fuction.c: 1335: if(Tea)
	movf	(_Tea),w
	skipz
	goto	u10480
	goto	l5467
u10480:
	line	1337
	
l16099:	
;pattern_fuction.c: 1336: {
;pattern_fuction.c: 1337: PATTERN_WORK_TIME=110;
	movlw	06Eh
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_PATTERN_WORK_TIME)^080h
	clrf	(_PATTERN_WORK_TIME+1)^080h
	goto	l16137
	line	1341
	
l16101:	
;pattern_fuction.c: 1340: else
;pattern_fuction.c: 1341: if(_210_z)
	movf	(__210_z),w
	skipz
	goto	u10490
	goto	l16119
u10490:
	line	1343
	
l16103:	
;pattern_fuction.c: 1342: {
;pattern_fuction.c: 1343: Solenoid_Work_Time=25;
	movlw	019h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Solenoid_Work_Time)^080h
	clrf	(_Solenoid_Work_Time+1)^080h
	line	1344
;pattern_fuction.c: 1344: Solenoid_Stop_Time=5;
	movlw	05h
	movwf	(_Solenoid_Stop_Time)^080h
	clrf	(_Solenoid_Stop_Time+1)^080h
	line	1345
;pattern_fuction.c: 1345: if(Regular)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Regular),w
	skipz
	goto	u10500
	goto	l16107
u10500:
	line	1347
	
l16105:	
;pattern_fuction.c: 1346: {
;pattern_fuction.c: 1347: PATTERN_WORK_TIME=60;
	movlw	03Ch
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_PATTERN_WORK_TIME)^080h
	clrf	(_PATTERN_WORK_TIME+1)^080h
	line	1348
;pattern_fuction.c: 1348: }
	goto	l16137
	line	1350
	
l16107:	
;pattern_fuction.c: 1349: else
;pattern_fuction.c: 1350: if(Bold)
	movf	(_Bold),w
	skipz
	goto	u10510
	goto	l16111
u10510:
	line	1352
	
l16109:	
;pattern_fuction.c: 1351: {
;pattern_fuction.c: 1352: PATTERN_WORK_TIME=165;
	movlw	0A5h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_PATTERN_WORK_TIME)^080h
	clrf	(_PATTERN_WORK_TIME+1)^080h
	line	1353
;pattern_fuction.c: 1353: }
	goto	l16137
	line	1355
	
l16111:	
;pattern_fuction.c: 1354: else
;pattern_fuction.c: 1355: if(Iced)
	movf	(_Iced),w
	skipz
	goto	u10520
	goto	l16115
u10520:
	line	1357
	
l16113:	
;pattern_fuction.c: 1356: {
;pattern_fuction.c: 1357: PATTERN_WORK_TIME=125;
	movlw	07Dh
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_PATTERN_WORK_TIME)^080h
	clrf	(_PATTERN_WORK_TIME+1)^080h
	line	1358
;pattern_fuction.c: 1358: }
	goto	l16137
	line	1360
	
l16115:	
;pattern_fuction.c: 1359: else
;pattern_fuction.c: 1360: if(Tea)
	movf	(_Tea),w
	skipz
	goto	u10530
	goto	l5467
u10530:
	line	1362
	
l16117:	
;pattern_fuction.c: 1361: {
;pattern_fuction.c: 1362: PATTERN_WORK_TIME=170;
	movlw	0AAh
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_PATTERN_WORK_TIME)^080h
	clrf	(_PATTERN_WORK_TIME+1)^080h
	goto	l16137
	line	1366
	
l16119:	
;pattern_fuction.c: 1365: else
;pattern_fuction.c: 1366: if(_420_z)
	movf	(__420_z),w
	skipz
	goto	u10540
	goto	l16137
u10540:
	line	1368
	
l16121:	
;pattern_fuction.c: 1367: {
;pattern_fuction.c: 1368: Solenoid_Work_Time=45;
	movlw	02Dh
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Solenoid_Work_Time)^080h
	clrf	(_Solenoid_Work_Time+1)^080h
	line	1369
;pattern_fuction.c: 1369: Solenoid_Stop_Time=10;
	movlw	0Ah
	movwf	(_Solenoid_Stop_Time)^080h
	clrf	(_Solenoid_Stop_Time+1)^080h
	line	1370
;pattern_fuction.c: 1370: if(Regular)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Regular),w
	skipz
	goto	u10550
	goto	l16125
u10550:
	line	1372
	
l16123:	
;pattern_fuction.c: 1371: {
;pattern_fuction.c: 1372: PATTERN_WORK_TIME=305;
	movlw	low(0131h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_PATTERN_WORK_TIME)^080h
	movlw	high(0131h)
	movwf	((_PATTERN_WORK_TIME)^080h)+1
	line	1373
;pattern_fuction.c: 1373: }
	goto	l16137
	line	1375
	
l16125:	
;pattern_fuction.c: 1374: else
;pattern_fuction.c: 1375: if(Bold)
	movf	(_Bold),w
	skipz
	goto	u10560
	goto	l16129
u10560:
	line	1377
	
l16127:	
;pattern_fuction.c: 1376: {
;pattern_fuction.c: 1377: PATTERN_WORK_TIME=365;
	movlw	low(016Dh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_PATTERN_WORK_TIME)^080h
	movlw	high(016Dh)
	movwf	((_PATTERN_WORK_TIME)^080h)+1
	line	1378
;pattern_fuction.c: 1378: }
	goto	l16137
	line	1380
	
l16129:	
;pattern_fuction.c: 1379: else
;pattern_fuction.c: 1380: if(Iced)
	movf	(_Iced),w
	skipz
	goto	u10570
	goto	l16133
u10570:
	line	1382
	
l16131:	
;pattern_fuction.c: 1381: {
;pattern_fuction.c: 1382: PATTERN_WORK_TIME=195;
	movlw	0C3h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_PATTERN_WORK_TIME)^080h
	clrf	(_PATTERN_WORK_TIME+1)^080h
	line	1383
;pattern_fuction.c: 1383: }
	goto	l16137
	line	1385
	
l16133:	
;pattern_fuction.c: 1384: else
;pattern_fuction.c: 1385: if(Tea)
	movf	(_Tea),w
	skipz
	goto	u10580
	goto	l5467
u10580:
	line	1387
	
l16135:	
;pattern_fuction.c: 1386: {
;pattern_fuction.c: 1387: PATTERN_WORK_TIME=330;
	movlw	low(014Ah)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_PATTERN_WORK_TIME)^080h
	movlw	high(014Ah)
	movwf	((_PATTERN_WORK_TIME)^080h)+1
	line	1393
	
l16137:	
;pattern_fuction.c: 1388: }
;pattern_fuction.c: 1389: }
;pattern_fuction.c: 1393: Pattern_Work_State=1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_Pattern_Work_State)^080h
	incf	(_Pattern_Work_State)^080h,f
	line	1394
;pattern_fuction.c: 1394: break;
	goto	l5514
	line	1396
;pattern_fuction.c: 1396: case 1:
	
l5497:	
	line	1397
;pattern_fuction.c: 1397: HOT_MAJOR_State=1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_HOT_MAJOR_State)
	incf	(_HOT_MAJOR_State),f
	line	1398
;pattern_fuction.c: 1398: RC0=1;
	bsf	(56/8),(56)&7
	line	1399
	
l16139:	
;pattern_fuction.c: 1399: Solenoid_State=0;
	clrf	(_Solenoid_State)
	line	1401
	
l16141:	
;pattern_fuction.c: 1401: if(Temperature_Dat>=Water_Temp)
	movf	(_Temperature_Dat),w
	xorlw	80h
	movwf	(??_Pattern+0)+0
	movf	(_Water_Temp),w
	xorlw	80h
	subwf	(??_Pattern+0)+0
	skipc
	goto	u10591
	goto	u10590
u10591:
	goto	l5514
u10590:
	line	1403
	
l16143:	
;pattern_fuction.c: 1402: {
;pattern_fuction.c: 1403: Pattern_Work_State=2;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Pattern_Work_State)^080h
	line	1404
;pattern_fuction.c: 1404: Solenoid_State=2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_Solenoid_State)
	goto	l5514
	line	1409
	
l16145:	
;pattern_fuction.c: 1409: if(Temperature_Dat>=Water_Temp)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Temperature_Dat),w
	xorlw	80h
	movwf	(??_Pattern+0)+0
	movf	(_Water_Temp),w
	xorlw	80h
	subwf	(??_Pattern+0)+0
	skipc
	goto	u10601
	goto	u10600
u10601:
	goto	l5500
u10600:
	line	1411
	
l16147:	
;pattern_fuction.c: 1410: {
;pattern_fuction.c: 1411: HOT_MAJOR_State=0;
	clrf	(_HOT_MAJOR_State)
	line	1412
;pattern_fuction.c: 1412: }
	goto	l16149
	line	1413
	
l5500:	
	line	1415
;pattern_fuction.c: 1413: else
;pattern_fuction.c: 1414: {
;pattern_fuction.c: 1415: HOT_MAJOR_State=1;
	clrf	(_HOT_MAJOR_State)
	incf	(_HOT_MAJOR_State),f
	line	1419
	
l16149:	
;pattern_fuction.c: 1416: }
;pattern_fuction.c: 1419: if(!Tea)
	movf	(_Tea),f
	skipz
	goto	u10611
	goto	u10610
u10611:
	goto	l16167
u10610:
	line	1421
	
l16151:	
;pattern_fuction.c: 1420: {
;pattern_fuction.c: 1421: if(Solenoid_ON_Time>=Solenoid_Work_Time)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_Solenoid_Work_Time+1)^080h,w
	subwf	(_Solenoid_ON_Time+1)^080h,w
	skipz
	goto	u10625
	movf	(_Solenoid_Work_Time)^080h,w
	subwf	(_Solenoid_ON_Time)^080h,w
u10625:
	skipc
	goto	u10621
	goto	u10620
u10621:
	goto	l5503
u10620:
	line	1422
	
l16153:	
;pattern_fuction.c: 1422: Solenoid_State=3;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_Solenoid_State)
	
l5503:	
	line	1424
;pattern_fuction.c: 1424: if(Solenoid_OFF_Time>=Solenoid_Stop_Time)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_Solenoid_Stop_Time+1)^080h,w
	subwf	(_Solenoid_OFF_Time+1)^080h,w
	skipz
	goto	u10635
	movf	(_Solenoid_Stop_Time)^080h,w
	subwf	(_Solenoid_OFF_Time)^080h,w
u10635:
	skipc
	goto	u10631
	goto	u10630
u10631:
	goto	l16171
u10630:
	line	1425
	
l16155:	
;pattern_fuction.c: 1425: if(++Pattern_Work_Times>=250)
	movlw	(0FAh)
	incf	(_Pattern_Work_Times)^080h,f
	subwf	((_Pattern_Work_Times)^080h),w
	skipc
	goto	u10641
	goto	u10640
u10641:
	goto	l16171
u10640:
	line	1427
	
l16157:	
;pattern_fuction.c: 1426: {
;pattern_fuction.c: 1427: Solenoid_State=1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_Solenoid_State)
	incf	(_Solenoid_State),f
	line	1428
	
l16159:	
;pattern_fuction.c: 1428: Pattern_Work_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_Pattern_Work_Times)^080h
	line	1429
	
l16161:	
;pattern_fuction.c: 1429: Pattern_Work_Time++;
	incf	(_Pattern_Work_Time)^080h,f
	skipnz
	incf	(_Pattern_Work_Time+1)^080h,f
	line	1430
	
l16163:	
;pattern_fuction.c: 1430: if(Pattern_Work_Time>=PATTERN_WORK_TIME)
	movf	(_PATTERN_WORK_TIME+1)^080h,w
	subwf	(_Pattern_Work_Time+1)^080h,w
	skipz
	goto	u10655
	movf	(_PATTERN_WORK_TIME)^080h,w
	subwf	(_Pattern_Work_Time)^080h,w
u10655:
	skipc
	goto	u10651
	goto	u10650
u10651:
	goto	l5504
u10650:
	line	1431
	
l16165:	
;pattern_fuction.c: 1431: Pattern_Work_State=3;
	movlw	(03h)
	movwf	(_Pattern_Work_State)^080h
	goto	l16171
	line	1434
	
l5504:	
;pattern_fuction.c: 1432: }
;pattern_fuction.c: 1434: }
	goto	l16171
	line	1437
	
l16167:	
;pattern_fuction.c: 1435: else
;pattern_fuction.c: 1436: {
;pattern_fuction.c: 1437: if(Solenoid_ON_Time>=PATTERN_WORK_TIME)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_PATTERN_WORK_TIME+1)^080h,w
	subwf	(_Solenoid_ON_Time+1)^080h,w
	skipz
	goto	u10665
	movf	(_PATTERN_WORK_TIME)^080h,w
	subwf	(_Solenoid_ON_Time)^080h,w
u10665:
	skipc
	goto	u10661
	goto	u10660
u10661:
	goto	l16171
u10660:
	goto	l16165
	line	1440
	
l16171:	
;pattern_fuction.c: 1439: }
;pattern_fuction.c: 1440: RA7=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(47/8),(47)&7
	line	1441
;pattern_fuction.c: 1441: break;
	goto	l5514
	line	1443
	
l16173:	
;pattern_fuction.c: 1443: HOT_MAJOR_State=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_HOT_MAJOR_State)
	line	1445
;pattern_fuction.c: 1445: ANNULUS_LIGHT_State=0;
	clrf	(_ANNULUS_LIGHT_State)
	line	1446
;pattern_fuction.c: 1446: SHOW_LIGHT_State=0;
	clrf	(_SHOW_LIGHT_State)
	line	1448
;pattern_fuction.c: 1448: Solenoid_State=0;
	clrf	(_Solenoid_State)
	line	1449
	
l16175:	
;pattern_fuction.c: 1449: RA7=0;
	bcf	(47/8),(47)&7
	line	1455
	
l16177:	
;pattern_fuction.c: 1455: if(WorkMinute>=35)
	movlw	(023h)
	subwf	(_WorkMinute),w
	skipc
	goto	u10671
	goto	u10670
u10671:
	goto	l5514
u10670:
	line	1456
	
l16179:	
;pattern_fuction.c: 1456: Pattern_Work_State=4;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Pattern_Work_State)^080h
	goto	l5514
	line	1461
	
l16181:	
;pattern_fuction.c: 1461: Rbeep=6;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_Rbeep)
	line	1462
;pattern_fuction.c: 1462: Pattern_LED_Crt=5;
	movlw	05h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_Pattern_LED_Crt)^080h
	clrf	(_Pattern_LED_Crt+1)^080h
	line	1463
;pattern_fuction.c: 1463: Pattern_Work_State=5;
	movlw	(05h)
	movwf	(_Pattern_Work_State)^080h
	line	1464
;pattern_fuction.c: 1464: break;
	goto	l5514
	line	1465
;pattern_fuction.c: 1465: case 5:
	
l5512:	
	line	1466
;pattern_fuction.c: 1466: RC0=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	line	1469
	
l16183:	
;pattern_fuction.c: 1469: if(Start) Pattern_State=0;
	movf	(_Start),w
	skipz
	goto	u10680
	goto	l5514
u10680:
	
l16185:	
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_Pattern_State)^080h
	goto	l5514
	line	1286
	
l16189:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(_Pattern_Work_State)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 5
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           19    10 (average)
; direct_byte           26     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable            10     6 (fixed)
; spacedrange           18     9 (fixed)
; locatedrange           6     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l16065
	xorlw	1^0	; case 1
	skipnz
	goto	l5497
	xorlw	2^1	; case 2
	skipnz
	goto	l16145
	xorlw	3^2	; case 3
	skipnz
	goto	l16173
	xorlw	4^3	; case 4
	skipnz
	goto	l16181
	xorlw	5^4	; case 5
	skipnz
	goto	l5512
	goto	l5514
	opt asmopt_on

	line	699
	
l16193:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(_Pattern_State)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 12, Range of values is 0 to 11
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           37    19 (average)
; direct_byte           44     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable            16     6 (fixed)
; spacedrange           30     9 (fixed)
; locatedrange          12     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5360
	xorlw	1^0	; case 1
	skipnz
	goto	l15531
	xorlw	2^1	; case 2
	skipnz
	goto	l15555
	xorlw	3^2	; case 3
	skipnz
	goto	l15559
	xorlw	4^3	; case 4
	skipnz
	goto	l15571
	xorlw	5^4	; case 5
	skipnz
	goto	l15601
	xorlw	6^5	; case 6
	skipnz
	goto	l5425
	xorlw	7^6	; case 7
	skipnz
	goto	l15823
	xorlw	8^7	; case 8
	skipnz
	goto	l15889
	xorlw	9^8	; case 9
	skipnz
	goto	l15891
	xorlw	10^9	; case 10
	skipnz
	goto	l5450
	xorlw	11^10	; case 11
	skipnz
	goto	l16013
	goto	l5514
	opt asmopt_on

	line	1477
	
l5514:	
	return
	opt stack 0
GLOBAL	__end_of_Pattern
	__end_of_Pattern:
;; =============== function _Pattern ends ============

	signat	_Pattern,88
	global	_CheckKeyOldValue
psect	text1272,local,class=CODE,delta=2
global __ptext1272
__ptext1272:

;; *************** function _CheckKeyOldValue *****************
;; Defined at:
;;		line 336 in file "F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  KeyOldTemp      2    6[BANK0 ] unsigned int 
;;  KeyResTemp      2    4[BANK0 ] unsigned int 
;;  cnt             1    8[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 40/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_KeyIsIn
;; This function is called by:
;;		_CheckTouchKey
;; This function uses a non-reentrant model
;;
psect	text1272
	file	"F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
	line	336
	global	__size_of_CheckKeyOldValue
	__size_of_CheckKeyOldValue	equ	__end_of_CheckKeyOldValue-_CheckKeyOldValue
	
_CheckKeyOldValue:	
	opt	stack 2
; Regs used in _CheckKeyOldValue: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	338
	
l15387:	
;CheckTouchKey.c: 337: static unsigned char counter = 0;
;CheckTouchKey.c: 338: unsigned char cnt = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(CheckKeyOldValue@cnt)
	line	342
	
l15389:	
;CheckTouchKey.c: 339: unsigned int KeyResTemp;
;CheckTouchKey.c: 340: unsigned int KeyOldTemp;
;CheckTouchKey.c: 342: if(++counter < 4)
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	incf	(CheckKeyOldValue@counter)^080h,f
	subwf	((CheckKeyOldValue@counter)^080h),w
	skipnc
	goto	u9641
	goto	u9640
u9641:
	goto	l15393
u9640:
	goto	l6967
	line	344
	
l15393:	
;CheckTouchKey.c: 344: counter = 0;
	clrf	(CheckKeyOldValue@counter)^080h
	line	348
	
l15395:	
;CheckTouchKey.c: 347: {
;CheckTouchKey.c: 348: KeyResTemp = KeyResSum[cnt];
	bcf	status, 5	;RP0=0, select bank0
	clrc
	rlf	(CheckKeyOldValue@cnt),w
	addlw	_KeyResSum&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(CheckKeyOldValue@KeyResTemp)
	incf	fsr0,f
	movf	indf,w
	movwf	(CheckKeyOldValue@KeyResTemp+1)
	line	349
	
l15397:	
;CheckTouchKey.c: 349: if(!KeyIsIn(cnt))
	movf	(CheckKeyOldValue@cnt),w
	fcall	_KeyIsIn
	iorlw	0
	skipz
	goto	u9651
	goto	u9650
u9651:
	goto	l6969
u9650:
	line	352
	
l15399:	
;CheckTouchKey.c: 350: {
;CheckTouchKey.c: 352: KeyOldTemp = KeyOldValue0[cnt] - KeyResTemp;
	clrc
	rlf	(CheckKeyOldValue@cnt),w
	addlw	_KeyOldValue0&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(CheckKeyOldValue@KeyOldTemp)
	incf	fsr0,f
	movf	indf,w
	movwf	(CheckKeyOldValue@KeyOldTemp+1)
	
l15401:	
	movf	(CheckKeyOldValue@KeyResTemp),w
	subwf	(CheckKeyOldValue@KeyOldTemp),f
	movf	(CheckKeyOldValue@KeyResTemp+1),w
	skipc
	decf	(CheckKeyOldValue@KeyOldTemp+1),f
	subwf	(CheckKeyOldValue@KeyOldTemp+1),f
	line	353
	
l15403:	
;CheckTouchKey.c: 353: if(KeyOldTemp <= 1 || KeyOldTemp >= -1)
	movlw	high(02h)
	subwf	(CheckKeyOldValue@KeyOldTemp+1),w
	movlw	low(02h)
	skipnz
	subwf	(CheckKeyOldValue@KeyOldTemp),w
	skipc
	goto	u9661
	goto	u9660
u9661:
	goto	l15407
u9660:
	
l15405:	
	incf	(CheckKeyOldValue@KeyOldTemp),w
	skipnz
	incf	(CheckKeyOldValue@KeyOldTemp+1),w

	skipz
	goto	u9671
	goto	u9670
u9671:
	goto	l6969
u9670:
	line	355
	
l15407:	
;CheckTouchKey.c: 354: {
;CheckTouchKey.c: 355: KeyOldTemp = KeyOldValue1[cnt] - KeyResTemp;
	clrc
	rlf	(CheckKeyOldValue@cnt),w
	addlw	_KeyOldValue1&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(CheckKeyOldValue@KeyOldTemp)
	incf	fsr0,f
	movf	indf,w
	movwf	(CheckKeyOldValue@KeyOldTemp+1)
	
l15409:	
	movf	(CheckKeyOldValue@KeyResTemp),w
	subwf	(CheckKeyOldValue@KeyOldTemp),f
	movf	(CheckKeyOldValue@KeyResTemp+1),w
	skipc
	decf	(CheckKeyOldValue@KeyOldTemp+1),f
	subwf	(CheckKeyOldValue@KeyOldTemp+1),f
	line	356
	
l15411:	
;CheckTouchKey.c: 356: if(KeyOldTemp <= 1 || KeyOldTemp >= -1)
	movlw	high(02h)
	subwf	(CheckKeyOldValue@KeyOldTemp+1),w
	movlw	low(02h)
	skipnz
	subwf	(CheckKeyOldValue@KeyOldTemp),w
	skipc
	goto	u9681
	goto	u9680
u9681:
	goto	l15415
u9680:
	
l15413:	
	incf	(CheckKeyOldValue@KeyOldTemp),w
	skipnz
	incf	(CheckKeyOldValue@KeyOldTemp+1),w

	skipz
	goto	u9691
	goto	u9690
u9691:
	goto	l6969
u9690:
	line	358
	
l15415:	
;CheckTouchKey.c: 357: {
;CheckTouchKey.c: 358: KeyOldTemp = KeyOldValue2[cnt] - KeyResTemp;
	clrc
	rlf	(CheckKeyOldValue@cnt),w
	addlw	_KeyOldValue2&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(CheckKeyOldValue@KeyOldTemp)
	incf	fsr0,f
	movf	indf,w
	movwf	(CheckKeyOldValue@KeyOldTemp+1)
	
l15417:	
	movf	(CheckKeyOldValue@KeyResTemp),w
	subwf	(CheckKeyOldValue@KeyOldTemp),f
	movf	(CheckKeyOldValue@KeyResTemp+1),w
	skipc
	decf	(CheckKeyOldValue@KeyOldTemp+1),f
	subwf	(CheckKeyOldValue@KeyOldTemp+1),f
	line	359
	
l15419:	
;CheckTouchKey.c: 359: if(KeyOldTemp <= 1 || KeyOldTemp >= -1)
	movlw	high(02h)
	subwf	(CheckKeyOldValue@KeyOldTemp+1),w
	movlw	low(02h)
	skipnz
	subwf	(CheckKeyOldValue@KeyOldTemp),w
	skipc
	goto	u9701
	goto	u9700
u9701:
	goto	l15423
u9700:
	
l15421:	
	incf	(CheckKeyOldValue@KeyOldTemp),w
	skipnz
	incf	(CheckKeyOldValue@KeyOldTemp+1),w

	skipz
	goto	u9711
	goto	u9710
u9711:
	goto	l6969
u9710:
	line	361
	
l15423:	
;CheckTouchKey.c: 360: {
;CheckTouchKey.c: 361: KeyReference[cnt] = KeyResTemp;
	clrc
	rlf	(CheckKeyOldValue@cnt),w
	addlw	_KeyReference&0ffh
	movwf	fsr0
	movf	(CheckKeyOldValue@KeyResTemp),w
	movwf	indf
	incf	fsr0,f
	movf	(CheckKeyOldValue@KeyResTemp+1),w
	movwf	indf
	line	365
	
l6969:	
	line	368
;CheckTouchKey.c: 362: }
;CheckTouchKey.c: 363: }
;CheckTouchKey.c: 364: }
;CheckTouchKey.c: 365: }
;CheckTouchKey.c: 368: KeyOldValue2[cnt] = KeyOldValue1[cnt];
	clrc
	rlf	(CheckKeyOldValue@cnt),w
	addlw	_KeyOldValue1&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(??_CheckKeyOldValue+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_CheckKeyOldValue+0)+0+1
	clrc
	rlf	(CheckKeyOldValue@cnt),w
	addlw	_KeyOldValue2&0ffh
	movwf	fsr0
	movf	0+(??_CheckKeyOldValue+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_CheckKeyOldValue+0)+0,w
	movwf	indf
	line	369
;CheckTouchKey.c: 369: KeyOldValue1[cnt] = KeyOldValue0[cnt];
	clrc
	rlf	(CheckKeyOldValue@cnt),w
	addlw	_KeyOldValue0&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_CheckKeyOldValue+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_CheckKeyOldValue+0)+0+1
	clrc
	rlf	(CheckKeyOldValue@cnt),w
	addlw	_KeyOldValue1&0ffh
	movwf	fsr0
	movf	0+(??_CheckKeyOldValue+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_CheckKeyOldValue+0)+0,w
	movwf	indf
	line	370
;CheckTouchKey.c: 370: KeyOldValue0[cnt] = KeyResTemp;
	clrc
	rlf	(CheckKeyOldValue@cnt),w
	addlw	_KeyOldValue0&0ffh
	movwf	fsr0
	movf	(CheckKeyOldValue@KeyResTemp),w
	movwf	indf
	incf	fsr0,f
	movf	(CheckKeyOldValue@KeyResTemp+1),w
	movwf	indf
	line	371
	
l15425:	
	movlw	(0Ch)
	incf	(CheckKeyOldValue@cnt),f
	subwf	((CheckKeyOldValue@cnt)),w
	skipc
	goto	u9721
	goto	u9720
u9721:
	goto	l15395
u9720:
	line	372
	
l6967:	
	return
	opt stack 0
GLOBAL	__end_of_CheckKeyOldValue
	__end_of_CheckKeyOldValue:
;; =============== function _CheckKeyOldValue ends ============

	signat	_CheckKeyOldValue,88
	global	_CheckOnceResult
psect	text1273,local,class=CODE,delta=2
global __ptext1273
__ptext1273:

;; *************** function _CheckOnceResult *****************
;; Defined at:
;;		line 222 in file "F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  KeyResTemp      2   13[BANK0 ] unsigned int 
;;  KeyValue        2   10[BANK0 ] unsigned int 
;;  OldValue        2    7[BANK0 ] unsigned int 
;;  cnt             1   15[BANK0 ] unsigned char 
;;  KeyDown         1   12[BANK0 ] unsigned char 
;;  flag            1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 160/100
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       9       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_KeyIsIn
;;		_KeyHave
;;		_KeyClearOne
;; This function is called by:
;;		_CheckTouchKey
;; This function uses a non-reentrant model
;;
psect	text1273
	file	"F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
	line	222
	global	__size_of_CheckOnceResult
	__size_of_CheckOnceResult	equ	__end_of_CheckOnceResult-_CheckOnceResult
	
_CheckOnceResult:	
	opt	stack 2
; Regs used in _CheckOnceResult: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	223
	
l15321:	
;CheckTouchKey.c: 223: unsigned char cnt = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(CheckOnceResult@cnt)
	line	231
;CheckTouchKey.c: 224: unsigned char KeyDown;
;CheckTouchKey.c: 225: unsigned char flag;
;CheckTouchKey.c: 227: unsigned int KeyResTemp;
;CheckTouchKey.c: 228: unsigned int KeyValue;
;CheckTouchKey.c: 229: unsigned int OldValue;
;CheckTouchKey.c: 231: KeyData[0] = 0;
	clrf	(_KeyData)	;volatile
	line	232
;CheckTouchKey.c: 232: KeyData[1] = 0;
	clrf	0+(_KeyData)+01h	;volatile
	line	233
;CheckTouchKey.c: 233: KeyMaxSub = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_KeyMaxSub)^080h
	line	238
	
l15323:	
;CheckTouchKey.c: 237: {
;CheckTouchKey.c: 238: flag = Table_KeyFalg[cnt&0x7];
	bcf	status, 5	;RP0=0, select bank0
	movf	(CheckOnceResult@cnt),w
	andlw	07h
	addlw	low(_Table_KeyFalg|8000h)
	movwf	fsr0
	movlw	high(_Table_KeyFalg|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(CheckOnceResult@flag)
	line	240
	
l15325:	
;CheckTouchKey.c: 240: KeyResSum[cnt] >>= 3;
	clrc
	rlf	(CheckOnceResult@cnt),w
	addlw	_KeyResSum&0ffh
	movwf	fsr0
	movlw	03h
u9515:
	incf	fsr0,f
	clrc
	bsf	status, 7	;select IRP bank3
	rrf	indf,f
	decf	fsr0,f
	rrf	indf,f
u9510:
	addlw	-1
	skipz
	goto	u9515
	line	241
	
l15327:	
;CheckTouchKey.c: 241: KeyResTemp = KeyResSum[cnt];
	clrc
	rlf	(CheckOnceResult@cnt),w
	addlw	_KeyResSum&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(CheckOnceResult@KeyResTemp)
	incf	fsr0,f
	movf	indf,w
	movwf	(CheckOnceResult@KeyResTemp+1)
	line	242
;CheckTouchKey.c: 242: KeyDown = Table_KeyDown[cnt];
	movf	(CheckOnceResult@cnt),w
	addlw	low(_Table_KeyDown|8000h)
	movwf	fsr0
	movlw	high(_Table_KeyDown|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(CheckOnceResult@KeyDown)
	line	244
	
l15329:	
;CheckTouchKey.c: 244: KeyValue = KeyResTemp + KeyDown;
	movf	(CheckOnceResult@KeyDown),w
	movwf	(CheckOnceResult@KeyValue)
	clrf	(CheckOnceResult@KeyValue+1)
	
l15331:	
	movf	(CheckOnceResult@KeyResTemp),w
	addwf	(CheckOnceResult@KeyValue),f
	skipnc
	incf	(CheckOnceResult@KeyValue+1),f
	movf	(CheckOnceResult@KeyResTemp+1),w
	addwf	(CheckOnceResult@KeyValue+1),f
	line	246
	
l15333:	
;CheckTouchKey.c: 246: if(!KeyIsIn(cnt))
	movf	(CheckOnceResult@cnt),w
	fcall	_KeyIsIn
	iorlw	0
	skipz
	goto	u9521
	goto	u9520
u9521:
	goto	l15363
u9520:
	line	249
	
l15335:	
;CheckTouchKey.c: 247: {
;CheckTouchKey.c: 249: OldValue = KeyOldValue2[cnt];
	clrc
	rlf	(CheckOnceResult@cnt),w
	addlw	_KeyOldValue2&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(CheckOnceResult@OldValue)
	incf	fsr0,f
	movf	indf,w
	movwf	(CheckOnceResult@OldValue+1)
	line	251
;CheckTouchKey.c: 251: if(KeyReference[cnt] > KeyValue)
	clrc
	rlf	(CheckOnceResult@cnt),w
	addlw	_KeyReference&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_CheckOnceResult+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_CheckOnceResult+0)+0+1
	movf	1+(??_CheckOnceResult+0)+0,w
	subwf	(CheckOnceResult@KeyValue+1),w
	skipz
	goto	u9535
	movf	0+(??_CheckOnceResult+0)+0,w
	subwf	(CheckOnceResult@KeyValue),w
u9535:
	skipnc
	goto	u9531
	goto	u9530
u9531:
	goto	l15339
u9530:
	line	253
	
l15337:	
;CheckTouchKey.c: 252: {
;CheckTouchKey.c: 253: KeyResTemp = KeyReference[cnt] - KeyResTemp;
	clrc
	rlf	(CheckOnceResult@cnt),w
	addlw	_KeyReference&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_CheckOnceResult+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_CheckOnceResult+0)+0+1
	movf	(CheckOnceResult@KeyResTemp),w
	subwf	0+(??_CheckOnceResult+0)+0,w
	movwf	(CheckOnceResult@KeyResTemp)
	movf	(CheckOnceResult@KeyResTemp+1),w
	skipc
	incf	(CheckOnceResult@KeyResTemp+1),w
	subwf	1+(??_CheckOnceResult+0)+0,w
	movwf	1+(CheckOnceResult@KeyResTemp)
	line	254
;CheckTouchKey.c: 254: }
	goto	l15347
	line	255
	
l15339:	
;CheckTouchKey.c: 255: else if ((OldValue > KeyValue) && (KeyOldValue1[cnt] > KeyValue))
	movf	(CheckOnceResult@OldValue+1),w
	subwf	(CheckOnceResult@KeyValue+1),w
	skipz
	goto	u9545
	movf	(CheckOnceResult@OldValue),w
	subwf	(CheckOnceResult@KeyValue),w
u9545:
	skipnc
	goto	u9541
	goto	u9540
u9541:
	goto	l15385
u9540:
	
l15341:	
	clrc
	rlf	(CheckOnceResult@cnt),w
	addlw	_KeyOldValue1&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_CheckOnceResult+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_CheckOnceResult+0)+0+1
	movf	1+(??_CheckOnceResult+0)+0,w
	subwf	(CheckOnceResult@KeyValue+1),w
	skipz
	goto	u9555
	movf	0+(??_CheckOnceResult+0)+0,w
	subwf	(CheckOnceResult@KeyValue),w
u9555:
	skipnc
	goto	u9551
	goto	u9550
u9551:
	goto	l15385
u9550:
	line	257
	
l15343:	
;CheckTouchKey.c: 256: {
;CheckTouchKey.c: 257: KeyReference[cnt] = OldValue;
	clrc
	rlf	(CheckOnceResult@cnt),w
	addlw	_KeyReference&0ffh
	movwf	fsr0
	movf	(CheckOnceResult@OldValue),w
	movwf	indf
	incf	fsr0,f
	movf	(CheckOnceResult@OldValue+1),w
	movwf	indf
	line	258
	
l15345:	
;CheckTouchKey.c: 258: KeyResTemp = OldValue - KeyResTemp;
	movf	(CheckOnceResult@KeyResTemp),w
	subwf	(CheckOnceResult@OldValue),w
	movwf	(CheckOnceResult@KeyResTemp)
	movf	(CheckOnceResult@KeyResTemp+1),w
	skipc
	incf	(CheckOnceResult@KeyResTemp+1),w
	subwf	(CheckOnceResult@OldValue+1),w
	movwf	1+(CheckOnceResult@KeyResTemp)
	line	265
;CheckTouchKey.c: 259: }
	
l15347:	
;CheckTouchKey.c: 263: }
;CheckTouchKey.c: 265: KeyUpShake[cnt] = 0;
	movf	(CheckOnceResult@cnt),w
	addlw	_KeyUpShake&0ffh
	movwf	fsr0
	clrf	indf
	line	269
	
l15349:	
;CheckTouchKey.c: 268: {
;CheckTouchKey.c: 269: if(KeyResTemp >> 8)
	movf	(CheckOnceResult@KeyResTemp+1),w
	xorlw	0
	skipnz
	goto	u9561
	goto	u9560
u9561:
	goto	l15353
u9560:
	line	271
	
l15351:	
;CheckTouchKey.c: 270: {
;CheckTouchKey.c: 271: KeyDown = 0xFF;
	movlw	(0FFh)
	movwf	(CheckOnceResult@KeyDown)
	line	272
;CheckTouchKey.c: 272: }
	goto	l6945
	line	275
	
l15353:	
;CheckTouchKey.c: 273: else
;CheckTouchKey.c: 274: {
;CheckTouchKey.c: 275: KeyDown = KeyResTemp & 0xFF;
	movf	(CheckOnceResult@KeyResTemp),w
	movwf	(CheckOnceResult@KeyDown)
	line	276
	
l6945:	
	line	278
;CheckTouchKey.c: 276: }
;CheckTouchKey.c: 278: if(KeyMaxSub < KeyDown)
	movf	(CheckOnceResult@KeyDown),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_KeyMaxSub)^080h,w
	skipnc
	goto	u9571
	goto	u9570
u9571:
	goto	l15359
u9570:
	line	280
	
l15355:	
;CheckTouchKey.c: 279: {
;CheckTouchKey.c: 280: KeyMaxSub = KeyDown;
	bcf	status, 5	;RP0=0, select bank0
	movf	(CheckOnceResult@KeyDown),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_KeyMaxSub)^080h
	line	281
	
l15357:	
;CheckTouchKey.c: 281: KeyHave(cnt,flag);
	bcf	status, 5	;RP0=0, select bank0
	movf	(CheckOnceResult@flag),w
	movwf	(?_KeyHave)
	clrf	(?_KeyHave+1)
	movf	(CheckOnceResult@cnt),w
	fcall	_KeyHave
	line	282
;CheckTouchKey.c: 282: }
	goto	l15385
	line	285
	
l15359:	
;CheckTouchKey.c: 283: else
;CheckTouchKey.c: 284: {
;CheckTouchKey.c: 285: KeyCounter++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_KeyCounter),f
	goto	l15385
	line	298
	
l15363:	
;CheckTouchKey.c: 294: else
;CheckTouchKey.c: 295: {
;CheckTouchKey.c: 298: if(KeyReference[cnt]+1 < KeyValue)
	clrc
	rlf	(CheckOnceResult@cnt),w
	addlw	_KeyReference&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(??_CheckOnceResult+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_CheckOnceResult+0)+0+1
	movf	0+(??_CheckOnceResult+0)+0,w
	addlw	low(01h)
	movwf	(??_CheckOnceResult+2)+0
	movf	1+(??_CheckOnceResult+0)+0,w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+(??_CheckOnceResult+2)+0
	movf	(CheckOnceResult@KeyValue+1),w
	subwf	1+(??_CheckOnceResult+2)+0,w
	skipz
	goto	u9585
	movf	(CheckOnceResult@KeyValue),w
	subwf	0+(??_CheckOnceResult+2)+0,w
u9585:
	skipnc
	goto	u9581
	goto	u9580
u9581:
	goto	l15369
u9580:
	goto	l15385
	line	302
	
l15369:	
;CheckTouchKey.c: 302: else if((KeyOldValue2[cnt]+KeyDown<KeyResTemp) || (KeyOldValue1[cnt]+KeyDown<KeyResTemp))
	clrc
	rlf	(CheckOnceResult@cnt),w
	addlw	_KeyOldValue2&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_CheckOnceResult+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_CheckOnceResult+0)+0+1
	movf	(CheckOnceResult@KeyDown),w
	addwf	0+(??_CheckOnceResult+0)+0,w
	movwf	(??_CheckOnceResult+2)+0
	movf	1+(??_CheckOnceResult+0)+0,w
	skipnc
	incf	1+(??_CheckOnceResult+0)+0,w
	movwf	((??_CheckOnceResult+2)+0)+1
	movf	(CheckOnceResult@KeyResTemp+1),w
	subwf	1+(??_CheckOnceResult+2)+0,w
	skipz
	goto	u9595
	movf	(CheckOnceResult@KeyResTemp),w
	subwf	0+(??_CheckOnceResult+2)+0,w
u9595:
	skipc
	goto	u9591
	goto	u9590
u9591:
	goto	l15373
u9590:
	
l15371:	
	clrc
	rlf	(CheckOnceResult@cnt),w
	addlw	_KeyOldValue1&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_CheckOnceResult+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_CheckOnceResult+0)+0+1
	movf	(CheckOnceResult@KeyDown),w
	addwf	0+(??_CheckOnceResult+0)+0,w
	movwf	(??_CheckOnceResult+2)+0
	movf	1+(??_CheckOnceResult+0)+0,w
	skipnc
	incf	1+(??_CheckOnceResult+0)+0,w
	movwf	((??_CheckOnceResult+2)+0)+1
	movf	(CheckOnceResult@KeyResTemp+1),w
	subwf	1+(??_CheckOnceResult+2)+0,w
	skipz
	goto	u9605
	movf	(CheckOnceResult@KeyResTemp),w
	subwf	0+(??_CheckOnceResult+2)+0,w
u9605:
	skipnc
	goto	u9601
	goto	u9600
u9601:
	goto	l15377
u9600:
	line	304
	
l15373:	
;CheckTouchKey.c: 303: {
;CheckTouchKey.c: 304: if(++KeyUpShake[cnt] > 8)
	movf	(CheckOnceResult@cnt),w
	addlw	_KeyUpShake&0ffh
	movwf	fsr0
	incf	indf,f
	movlw	(09h)
	subwf	(indf),w
	skipc
	goto	u9611
	goto	u9610
u9611:
	goto	l6951
u9610:
	line	306
	
l15375:	
;CheckTouchKey.c: 305: {
;CheckTouchKey.c: 306: KeyClearOne(cnt);
	movf	(CheckOnceResult@cnt),w
	fcall	_KeyClearOne
	line	307
;CheckTouchKey.c: 307: continue;
	goto	l15385
	line	312
	
l15377:	
;CheckTouchKey.c: 310: else
;CheckTouchKey.c: 311: {
;CheckTouchKey.c: 312: KeyUpShake[cnt] = 0;
	movf	(CheckOnceResult@cnt),w
	addlw	_KeyUpShake&0ffh
	movwf	fsr0
	clrf	indf
	goto	l15381
	line	313
	
l6951:	
	line	319
	
l15381:	
;CheckTouchKey.c: 319: else if(!(KeyData[0] | KeyData[1]))
	movf	0+(_KeyData)+01h,w	;volatile
	iorwf	(_KeyData),w	;volatile
	btfss	status,2
	goto	u9621
	goto	u9620
u9621:
	goto	l15385
u9620:
	line	321
	
l15383:	
;CheckTouchKey.c: 320: {
;CheckTouchKey.c: 321: KeyHave(cnt,flag);
	movf	(CheckOnceResult@flag),w
	movwf	(?_KeyHave)
	clrf	(?_KeyHave+1)
	movf	(CheckOnceResult@cnt),w
	fcall	_KeyHave
	line	324
	
l15385:	
	movlw	(0Ch)
	incf	(CheckOnceResult@cnt),f
	subwf	((CheckOnceResult@cnt)),w
	skipc
	goto	u9631
	goto	u9630
u9631:
	goto	l15323
u9630:
	line	325
	
l6961:	
	return
	opt stack 0
GLOBAL	__end_of_CheckOnceResult
	__end_of_CheckOnceResult:
;; =============== function _CheckOnceResult ends ============

	signat	_CheckOnceResult,88
	global	_GetTouchKeyValue
psect	text1274,local,class=CODE,delta=2
global __ptext1274
__ptext1274:

;; *************** function _GetTouchKeyValue *****************
;; Defined at:
;;		line 181 in file "F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  cnt             1    2[BANK0 ] unsigned char 
;;  temp            1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 160/100
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_ClearResSum
;; This function is called by:
;;		_CheckTouchKey
;; This function uses a non-reentrant model
;;
psect	text1274
	file	"F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
	line	181
	global	__size_of_GetTouchKeyValue
	__size_of_GetTouchKeyValue	equ	__end_of_GetTouchKeyValue-_GetTouchKeyValue
	
_GetTouchKeyValue:	
	opt	stack 2
; Regs used in _GetTouchKeyValue: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	182
	
l15303:	
;CheckTouchKey.c: 182: unsigned char cnt = 0,temp;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(GetTouchKeyValue@cnt)
	line	184
;CheckTouchKey.c: 184: do
	
l6927:	
	line	186
;CheckTouchKey.c: 185: {
;CheckTouchKey.c: 186: KEYCON0 = 0;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(275)^0100h	;volatile
	line	187
;CheckTouchKey.c: 187: KEYCON1 = 0;
	clrf	(276)^0100h	;volatile
	line	194
	
l15305:	
;CheckTouchKey.c: 194: KEYCON0 = Table_KeyCap[cnt];
	bcf	status, 6	;RP1=0, select bank0
	movf	(GetTouchKeyValue@cnt),w
	addlw	low(_Table_KeyCap|8000h)
	movwf	fsr0
	movlw	high(_Table_KeyCap|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	bsf	status, 6	;RP1=1, select bank2
	movwf	(275)^0100h	;volatile
	line	195
	
l15307:	
;CheckTouchKey.c: 195: KEYCON1 = Table_KeyChannel[cnt];
	bcf	status, 6	;RP1=0, select bank0
	movf	(GetTouchKeyValue@cnt),w
	addlw	low(_Table_KeyChannel|8000h)
	movwf	fsr0
	movlw	high(_Table_KeyChannel|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	bsf	status, 6	;RP1=1, select bank2
	movwf	(276)^0100h	;volatile
	line	196
	
l15309:	
;CheckTouchKey.c: 196: KEYCON0 |= 0x1;
	bsf	(275)^0100h+(0/8),(0)&7	;volatile
	line	198
;CheckTouchKey.c: 198: temp = 0;
	bcf	status, 6	;RP1=0, select bank0
	clrf	(GetTouchKeyValue@temp)
	line	199
;CheckTouchKey.c: 199: while(!(KEYCON0&0x80))
	goto	l6928
	
l6929:	
	line	201
;CheckTouchKey.c: 200: {
;CheckTouchKey.c: 201: if(0 == (--temp))
	bcf	status, 6	;RP1=0, select bank0
	decfsz	(GetTouchKeyValue@temp),f
	goto	u9481
	goto	u9480
u9481:
	goto	l6928
u9480:
	line	203
	
l15311:	
;CheckTouchKey.c: 202: {
;CheckTouchKey.c: 203: KeyCounter = 255;
	movlw	(0FFh)
	movwf	(_KeyCounter)
	line	204
	
l15313:	
;CheckTouchKey.c: 204: ClearResSum();
	fcall	_ClearResSum
	goto	l6931
	line	207
	
l6928:	
	line	199
	bsf	status, 6	;RP1=1, select bank2
	btfss	(275)^0100h,(7)&7
	goto	u9491
	goto	u9490
u9491:
	goto	l6929
u9490:
	line	209
	
l15317:	
;CheckTouchKey.c: 206: }
;CheckTouchKey.c: 207: }
;CheckTouchKey.c: 209: KeyResSum[cnt] += ((KEYDATAH<<8) | KEYDATAL);
	bcf	status, 6	;RP1=0, select bank0
	clrc
	rlf	(GetTouchKeyValue@cnt),w
	addlw	_KeyResSum&0ffh
	movwf	fsr0
	bsf	status, 6	;RP1=1, select bank2
	movf	(277)^0100h,w	;volatile
	bsf	status, 7	;select IRP bank3
	addwf	indf,f
	incfsz	fsr0,f
	movf	indf,w
	skipnc
	incf	indf,w
	movwf	btemp+1
	movf	(278)^0100h,w	;volatile
	addwf	btemp+1,w
	movwf	indf
	decf	fsr0,f
	line	210
	
l15319:	
	movlw	(0Ch)
	bcf	status, 6	;RP1=0, select bank0
	incf	(GetTouchKeyValue@cnt),f
	subwf	((GetTouchKeyValue@cnt)),w
	skipc
	goto	u9501
	goto	u9500
u9501:
	goto	l6927
u9500:
	line	211
	
l6931:	
	return
	opt stack 0
GLOBAL	__end_of_GetTouchKeyValue
	__end_of_GetTouchKeyValue:
;; =============== function _GetTouchKeyValue ends ============

	signat	_GetTouchKeyValue,88
	global	_KeyStopClear
psect	text1275,local,class=CODE,delta=2
global __ptext1275
__ptext1275:

;; *************** function _KeyStopClear *****************
;; Defined at:
;;		line 108 in file "F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 160/100
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_KeyClearOne
;; This function is called by:
;;		_CheckTouchKey
;; This function uses a non-reentrant model
;;
psect	text1275
	file	"F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
	line	108
	global	__size_of_KeyStopClear
	__size_of_KeyStopClear	equ	__end_of_KeyStopClear-_KeyStopClear
	
_KeyStopClear:	
	opt	stack 2
; Regs used in _KeyStopClear: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	110
	
l15289:	
;CheckTouchKey.c: 109: unsigned char i;
;CheckTouchKey.c: 110: KeyFlag[0] = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_KeyFlag)	;volatile
	line	111
;CheckTouchKey.c: 111: KeyFlag[1] = 0;
	clrf	0+(_KeyFlag)+01h	;volatile
	line	112
;CheckTouchKey.c: 112: for(i = 0; i < KeyTotalNumber; i++)
	clrf	(KeyStopClear@i)
	line	114
	
l15295:	
;CheckTouchKey.c: 113: {
;CheckTouchKey.c: 114: KeyResSum[i] = 0;
	clrc
	rlf	(KeyStopClear@i),w
	addlw	_KeyResSum&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	115
	
l15297:	
;CheckTouchKey.c: 115: KeyClearOne(i);
	movf	(KeyStopClear@i),w
	fcall	_KeyClearOne
	line	112
	
l15299:	
	incf	(KeyStopClear@i),f
	
l15301:	
	movlw	(0Ch)
	subwf	(KeyStopClear@i),w
	skipc
	goto	u9471
	goto	u9470
u9471:
	goto	l15295
u9470:
	line	117
	
l6910:	
	return
	opt stack 0
GLOBAL	__end_of_KeyStopClear
	__end_of_KeyStopClear:
;; =============== function _KeyStopClear ends ============

	signat	_KeyStopClear,88
	global	_KeyClearIn
psect	text1276,local,class=CODE,delta=2
global __ptext1276
__ptext1276:

;; *************** function _KeyClearIn *****************
;; Defined at:
;;		line 89 in file "F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  cnt             1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 160/100
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_KeyIsIn
;;		_KeyClearOne
;; This function is called by:
;;		_TurnKeyFlags
;; This function uses a non-reentrant model
;;
psect	text1276
	file	"F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
	line	89
	global	__size_of_KeyClearIn
	__size_of_KeyClearIn	equ	__end_of_KeyClearIn-_KeyClearIn
	
_KeyClearIn:	
	opt	stack 1
; Regs used in _KeyClearIn: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	91
	
l15275:	
;CheckTouchKey.c: 90: unsigned char cnt;
;CheckTouchKey.c: 91: for(cnt=0;cnt < KeyTotalNumber;cnt++)
	clrf	(KeyClearIn@cnt)
	line	93
	
l15281:	
;CheckTouchKey.c: 92: {
;CheckTouchKey.c: 93: if(!KeyIsIn(cnt))
	movf	(KeyClearIn@cnt),w
	fcall	_KeyIsIn
	iorlw	0
	skipz
	goto	u9451
	goto	u9450
u9451:
	goto	l15285
u9450:
	line	95
	
l15283:	
;CheckTouchKey.c: 94: {
;CheckTouchKey.c: 95: KeyClearOne(cnt);
	movf	(KeyClearIn@cnt),w
	fcall	_KeyClearOne
	line	91
	
l15285:	
	incf	(KeyClearIn@cnt),f
	
l15287:	
	movlw	(0Ch)
	subwf	(KeyClearIn@cnt),w
	skipc
	goto	u9461
	goto	u9460
u9461:
	goto	l15281
u9460:
	line	98
	
l6905:	
	return
	opt stack 0
GLOBAL	__end_of_KeyClearIn
	__end_of_KeyClearIn:
;; =============== function _KeyClearIn ends ============

	signat	_KeyClearIn,88
	global	_Hex_To_Temp
psect	text1277,local,class=CODE,delta=2
global __ptext1277
__ptext1277:

;; *************** function _Hex_To_Temp *****************
;; Defined at:
;;		line 43 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\LCD.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     char 
;; Auto vars:     Size  Location     Type
;;  data            1   10[BANK0 ] char 
;;  BCD             3    7[BANK0 ] unsigned char [3]
;;  i               1    6[BANK0 ] char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___awmod
;;		___lbdiv
;; This function is called by:
;;		_Pattern
;; This function uses a non-reentrant model
;;
psect	text1277
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\LCD.c"
	line	43
	global	__size_of_Hex_To_Temp
	__size_of_Hex_To_Temp	equ	__end_of_Hex_To_Temp-_Hex_To_Temp
	
_Hex_To_Temp:	
	opt	stack 2
; Regs used in _Hex_To_Temp: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;Hex_To_Temp@data stored from wreg
	line	50
	movwf	(Hex_To_Temp@data)
	
l15255:	
;LCD.c: 50: if(data>=100)
	movf	(Hex_To_Temp@data),w
	xorlw	80h
	addlw	-((064h)^80h)
	skipc
	goto	u9431
	goto	u9430
u9431:
	goto	l3795
u9430:
	line	52
	
l15257:	
;LCD.c: 51: {
;LCD.c: 52: i=2;
	movlw	(02h)
	movwf	(Hex_To_Temp@i)
	line	53
	
l15259:	
;LCD.c: 53: display[3]=LCDCode[12];
	movlw	low(_LCDCode|8000h+0Ch)
	movwf	fsr0
	movlw	high(_LCDCode|8000h+0Ch)
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+03h	;volatile
	line	54
;LCD.c: 54: }
	goto	l15271
	line	55
	
l3795:	
	line	57
;LCD.c: 55: else
;LCD.c: 56: {
;LCD.c: 57: i=1;
	clrf	(Hex_To_Temp@i)
	incf	(Hex_To_Temp@i),f
	line	58
	
l15261:	
;LCD.c: 58: BCD[2]=12;
	movlw	(0Ch)
	movwf	0+(Hex_To_Temp@BCD)+02h
	line	59
	
l15263:	
;LCD.c: 59: display[3]=LCDCode[10];
	movlw	low(_LCDCode|8000h+0Ah)
	movwf	fsr0
	movlw	high(_LCDCode|8000h+0Ah)
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+03h	;volatile
	goto	l15271
	line	64
	
l15265:	
;LCD.c: 63: {
;LCD.c: 64: BCD[i--]=data%10;
	movf	(Hex_To_Temp@i),w
	addlw	Hex_To_Temp@BCD&0ffh
	movwf	fsr0
	movlw	0Ah
	movwf	(?___awmod)
	clrf	(?___awmod+1)
	movf	(Hex_To_Temp@data),w
	movwf	0+(?___awmod)+02h
	clrf	1+(?___awmod)+02h
	btfsc	0+(?___awmod)+02h,7
	decf	1+(?___awmod)+02h,f
	fcall	___awmod
	movf	(0+(?___awmod)),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l15267:	
	decf	(Hex_To_Temp@i),f
	line	65
	
l15269:	
;LCD.c: 65: data /= 10;
	movlw	(0Ah)
	movwf	(?___lbdiv)
	movf	(Hex_To_Temp@data),w
	fcall	___lbdiv
	movwf	(Hex_To_Temp@data)
	line	62
	
l15271:	
	movf	(Hex_To_Temp@data),f
	skipz
	goto	u9441
	goto	u9440
u9441:
	goto	l15265
u9440:
	line	68
	
l15273:	
;LCD.c: 67: }
;LCD.c: 68: display[0]=LCDCode[BCD[0]];
	movf	(Hex_To_Temp@BCD),w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(_display)	;volatile
	line	69
;LCD.c: 69: display[1]=LCDCode[BCD[1]];
	movf	0+(Hex_To_Temp@BCD)+01h,w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+01h	;volatile
	line	70
;LCD.c: 70: display[2]=LCDCode[BCD[2]];
	movf	0+(Hex_To_Temp@BCD)+02h,w
	addlw	low(_LCDCode|8000h)
	movwf	fsr0
	movlw	high(_LCDCode|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	0+(_display)+02h	;volatile
	line	74
	
l3800:	
	return
	opt stack 0
GLOBAL	__end_of_Hex_To_Temp
	__end_of_Hex_To_Temp:
;; =============== function _Hex_To_Temp ends ============

	signat	_Hex_To_Temp,4216
	global	_NtcAD_Testing
psect	text1278,local,class=CODE,delta=2
global __ptext1278
__ptext1278:

;; *************** function _NtcAD_Testing *****************
;; Defined at:
;;		line 170 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\AD.c"
;; Parameters:    Size  Location     Type
;;  i               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  i               1   11[BANK0 ] unsigned char 
;;  data            2   12[BANK0 ] volatile unsigned short 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_AD_Sample
;;		___lwdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1278
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\AD.c"
	line	170
	global	__size_of_NtcAD_Testing
	__size_of_NtcAD_Testing	equ	__end_of_NtcAD_Testing-_NtcAD_Testing
	
_NtcAD_Testing:	
	opt	stack 3
; Regs used in _NtcAD_Testing: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;NtcAD_Testing@i stored from wreg
	line	184
	bcf	status, 5	;RP0=0, select bank0
	movwf	(NtcAD_Testing@i)
	
l15197:	
;AD.c: 171: static volatile unsigned char adtimes=0;
;AD.c: 172: static volatile unsigned short admin,admax=0,adsum=0;
;AD.c: 173: volatile unsigned short data;
;AD.c: 174: static volatile signed char range=0;
;AD.c: 175: static volatile signed char TAB_pos=0;
;AD.c: 184: if(AD_Sample(i))
	movf	(NtcAD_Testing@i),w
	fcall	_AD_Sample
	xorlw	0
	skipnz
	goto	u9301
	goto	u9300
u9301:
	goto	l15253
u9300:
	line	187
	
l15199:	
;AD.c: 185: {
;AD.c: 187: data = (ADRESH<<4);
	movf	(30),w	;volatile
	movwf	(NtcAD_Testing@data)
	clrf	(NtcAD_Testing@data+1)
	swapf	(NtcAD_Testing@data),f
	swapf	(NtcAD_Testing@data+1),f
	movlw	0f0h
	andwf	(NtcAD_Testing@data+1),f
	movf	(NtcAD_Testing@data),w
	andlw	0fh
	iorwf	(NtcAD_Testing@data+1),f
	movlw	0f0h
	andwf	(NtcAD_Testing@data),f
	line	188
	
l15201:	
;AD.c: 188: data |= (ADRESL>>4);
	bsf	status, 5	;RP0=1, select bank1
	swapf	(158)^080h,w	;volatile
	andlw	(0ffh shr 4) & 0ffh
	bcf	status, 5	;RP0=0, select bank0
	iorwf	(NtcAD_Testing@data),f	;volatile
	line	190
;AD.c: 190: if(0 == admax)
	movf	((NtcAD_Testing@admax+1)),w	;volatile
	iorwf	((NtcAD_Testing@admax)),w	;volatile
	skipz
	goto	u9311
	goto	u9310
u9311:
	goto	l15205
u9310:
	line	192
	
l15203:	
;AD.c: 191: {
;AD.c: 192: admax = data;
	movf	(NtcAD_Testing@data+1),w	;volatile
	movwf	(NtcAD_Testing@admax+1)	;volatile
	movf	(NtcAD_Testing@data),w	;volatile
	movwf	(NtcAD_Testing@admax)	;volatile
	line	193
;AD.c: 193: admin = data;
	movf	(NtcAD_Testing@data+1),w	;volatile
	movwf	(NtcAD_Testing@admin+1)	;volatile
	movf	(NtcAD_Testing@data),w	;volatile
	movwf	(NtcAD_Testing@admin)	;volatile
	line	194
;AD.c: 194: }
	goto	l6818
	line	195
	
l15205:	
;AD.c: 195: else if(data > admax)
	movf	(NtcAD_Testing@data+1),w	;volatile
	subwf	(NtcAD_Testing@admax+1),w	;volatile
	skipz
	goto	u9325
	movf	(NtcAD_Testing@data),w	;volatile
	subwf	(NtcAD_Testing@admax),w	;volatile
u9325:
	skipnc
	goto	u9321
	goto	u9320
u9321:
	goto	l15209
u9320:
	line	197
	
l15207:	
;AD.c: 196: {
;AD.c: 197: admax = data;
	movf	(NtcAD_Testing@data+1),w	;volatile
	movwf	(NtcAD_Testing@admax+1)	;volatile
	movf	(NtcAD_Testing@data),w	;volatile
	movwf	(NtcAD_Testing@admax)	;volatile
	line	198
;AD.c: 198: }
	goto	l6818
	line	199
	
l15209:	
;AD.c: 199: else if(data < admin)
	movf	(NtcAD_Testing@admin+1),w	;volatile
	subwf	(NtcAD_Testing@data+1),w	;volatile
	skipz
	goto	u9335
	movf	(NtcAD_Testing@admin),w	;volatile
	subwf	(NtcAD_Testing@data),w	;volatile
u9335:
	skipnc
	goto	u9331
	goto	u9330
u9331:
	goto	l6818
u9330:
	line	201
	
l15211:	
;AD.c: 200: {
;AD.c: 201: admin = data;
	movf	(NtcAD_Testing@data+1),w	;volatile
	movwf	(NtcAD_Testing@admin+1)	;volatile
	movf	(NtcAD_Testing@data),w	;volatile
	movwf	(NtcAD_Testing@admin)	;volatile
	line	203
	
l6818:	
;AD.c: 202: }
;AD.c: 203: adsum += data;
	movf	(NtcAD_Testing@data),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	addwf	(NtcAD_Testing@adsum)^080h,f	;volatile
	skipnc
	incf	(NtcAD_Testing@adsum+1)^080h,f	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movf	(NtcAD_Testing@data+1),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	addwf	(NtcAD_Testing@adsum+1)^080h,f	;volatile
	line	204
	
l15213:	
;AD.c: 204: if(++adtimes >= 8)
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	incf	(NtcAD_Testing@adtimes),f	;volatile
	subwf	((NtcAD_Testing@adtimes)),w	;volatile
	skipc
	goto	u9341
	goto	u9340
u9341:
	goto	l6832
u9340:
	line	206
	
l15215:	
;AD.c: 205: {
;AD.c: 206: adsum -= admax;
	movf	(NtcAD_Testing@admax),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	subwf	(NtcAD_Testing@adsum)^080h,f	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movf	(NtcAD_Testing@admax+1),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	skipc
	decf	(NtcAD_Testing@adsum+1)^080h,f	;volatile
	subwf	(NtcAD_Testing@adsum+1)^080h,f	;volatile
	line	207
;AD.c: 207: adsum -= admin;
	bcf	status, 5	;RP0=0, select bank0
	movf	(NtcAD_Testing@admin),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	subwf	(NtcAD_Testing@adsum)^080h,f	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movf	(NtcAD_Testing@admin+1),w	;volatile
	bsf	status, 5	;RP0=1, select bank1
	skipc
	decf	(NtcAD_Testing@adsum+1)^080h,f	;volatile
	subwf	(NtcAD_Testing@adsum+1)^080h,f	;volatile
	line	209
	
l15217:	
;AD.c: 209: AdResult_12bit=adsum/6;
	movlw	06h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?___lwdiv)
	clrf	(?___lwdiv+1)
	bsf	status, 5	;RP0=1, select bank1
	movf	(NtcAD_Testing@adsum+1)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	1+(?___lwdiv)+02h
	bsf	status, 5	;RP0=1, select bank1
	movf	(NtcAD_Testing@adsum)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(?___lwdiv)+02h
	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	movwf	(_AdResult_12bit+1)
	movf	(0+(?___lwdiv)),w
	movwf	(_AdResult_12bit)
	line	210
	
l15219:	
;AD.c: 210: range=0;
	clrf	(NtcAD_Testing@range)	;volatile
	line	211
	
l15221:	
;AD.c: 211: BreakTimeOut = 106;
	movlw	(06Ah)
	movwf	(_BreakTimeOut)
	line	212
;AD.c: 212: while(BreakTimeOut--)
	goto	l15249
	line	215
	
l15223:	
;AD.c: 213: {
;AD.c: 215: TAB_pos=Temperature_Dat+range;
	movf	(NtcAD_Testing@range),w
	addwf	(_Temperature_Dat),w
	movwf	(NtcAD_Testing@TAB_pos)	;volatile
	line	216
	
l15225:	
;AD.c: 216: if(TAB_pos<=105)
	movf	(NtcAD_Testing@TAB_pos),w	;volatile
	xorlw	80h
	addlw	-((06Ah)^80h)
	skipnc
	goto	u9351
	goto	u9350
u9351:
	goto	l15233
u9350:
	line	218
	
l15227:	
;AD.c: 217: {
;AD.c: 218: if((AdResult_12bit>=TempTab[TAB_pos][0])&&(AdResult_12bit<=TempTab[TAB_pos][1]))
	movf	(NtcAD_Testing@TAB_pos),w	;volatile
	movwf	(??_NtcAD_Testing+0)+0
	clrf	(??_NtcAD_Testing+0)+0+1
	clrc
	rlf	(??_NtcAD_Testing+0)+0,f
	rlf	(??_NtcAD_Testing+0)+1,f
	clrc
	rlf	(??_NtcAD_Testing+0)+0,f
	rlf	(??_NtcAD_Testing+0)+1,f
	movlw	high(_TempTab|8000h)
	addwf	1+(??_NtcAD_Testing+0)+0,w
	movwf	btemp+1
	movlw	low(_TempTab|8000h)
	addwf	0+(??_NtcAD_Testing+0)+0,w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	(??_NtcAD_Testing+2)+0
	fcall	stringtab
	movwf	(??_NtcAD_Testing+2)+0+1
	movf	1+(??_NtcAD_Testing+2)+0,w
	subwf	(_AdResult_12bit+1),w	;volatile
	skipz
	goto	u9365
	movf	0+(??_NtcAD_Testing+2)+0,w
	subwf	(_AdResult_12bit),w	;volatile
u9365:
	skipc
	goto	u9361
	goto	u9360
u9361:
	goto	l15233
u9360:
	
l15229:	
	movf	(NtcAD_Testing@TAB_pos),w	;volatile
	movwf	(??_NtcAD_Testing+0)+0
	clrf	(??_NtcAD_Testing+0)+0+1
	clrc
	rlf	(??_NtcAD_Testing+0)+0,f
	rlf	(??_NtcAD_Testing+0)+1,f
	clrc
	rlf	(??_NtcAD_Testing+0)+0,f
	rlf	(??_NtcAD_Testing+0)+1,f
	movlw	high(_TempTab|8000h+02h)
	addwf	1+(??_NtcAD_Testing+0)+0,w
	movwf	btemp+1
	movlw	low(_TempTab|8000h+02h)
	addwf	0+(??_NtcAD_Testing+0)+0,w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	(??_NtcAD_Testing+2)+0
	fcall	stringtab
	movwf	(??_NtcAD_Testing+2)+0+1
	movf	(_AdResult_12bit+1),w	;volatile
	subwf	1+(??_NtcAD_Testing+2)+0,w
	skipz
	goto	u9375
	movf	(_AdResult_12bit),w	;volatile
	subwf	0+(??_NtcAD_Testing+2)+0,w
u9375:
	skipc
	goto	u9371
	goto	u9370
u9371:
	goto	l15233
u9370:
	line	220
	
l15231:	
;AD.c: 219: {
;AD.c: 220: Temperature_Dat=TAB_pos;
	movf	(NtcAD_Testing@TAB_pos),w	;volatile
	movwf	(_Temperature_Dat)	;volatile
	line	221
;AD.c: 221: break;
	goto	l15251
	line	224
	
l15233:	
;AD.c: 222: }
;AD.c: 223: }
;AD.c: 224: TAB_pos=Temperature_Dat-range;
	movf	(NtcAD_Testing@range),w
	subwf	(_Temperature_Dat),w
	movwf	(NtcAD_Testing@TAB_pos)	;volatile
	line	225
	
l15235:	
;AD.c: 225: if(TAB_pos>=0)
	btfsc	(NtcAD_Testing@TAB_pos),7	;volatile
	goto	u9381
	goto	u9380
u9381:
	goto	l15243
u9380:
	line	227
	
l15237:	
;AD.c: 226: {
;AD.c: 227: if(AdResult_12bit<=TempTab[TAB_pos][1]&&AdResult_12bit>=TempTab[TAB_pos][0])
	movf	(NtcAD_Testing@TAB_pos),w	;volatile
	movwf	(??_NtcAD_Testing+0)+0
	clrf	(??_NtcAD_Testing+0)+0+1
	clrc
	rlf	(??_NtcAD_Testing+0)+0,f
	rlf	(??_NtcAD_Testing+0)+1,f
	clrc
	rlf	(??_NtcAD_Testing+0)+0,f
	rlf	(??_NtcAD_Testing+0)+1,f
	movlw	high(_TempTab|8000h+02h)
	addwf	1+(??_NtcAD_Testing+0)+0,w
	movwf	btemp+1
	movlw	low(_TempTab|8000h+02h)
	addwf	0+(??_NtcAD_Testing+0)+0,w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	(??_NtcAD_Testing+2)+0
	fcall	stringtab
	movwf	(??_NtcAD_Testing+2)+0+1
	movf	(_AdResult_12bit+1),w	;volatile
	subwf	1+(??_NtcAD_Testing+2)+0,w
	skipz
	goto	u9395
	movf	(_AdResult_12bit),w	;volatile
	subwf	0+(??_NtcAD_Testing+2)+0,w
u9395:
	skipc
	goto	u9391
	goto	u9390
u9391:
	goto	l15243
u9390:
	
l15239:	
	movf	(NtcAD_Testing@TAB_pos),w	;volatile
	movwf	(??_NtcAD_Testing+0)+0
	clrf	(??_NtcAD_Testing+0)+0+1
	clrc
	rlf	(??_NtcAD_Testing+0)+0,f
	rlf	(??_NtcAD_Testing+0)+1,f
	clrc
	rlf	(??_NtcAD_Testing+0)+0,f
	rlf	(??_NtcAD_Testing+0)+1,f
	movlw	high(_TempTab|8000h)
	addwf	1+(??_NtcAD_Testing+0)+0,w
	movwf	btemp+1
	movlw	low(_TempTab|8000h)
	addwf	0+(??_NtcAD_Testing+0)+0,w
	movwf	fsr0
	skipnc
	incf	btemp+1,f
	fcall	stringtab
	movwf	(??_NtcAD_Testing+2)+0
	fcall	stringtab
	movwf	(??_NtcAD_Testing+2)+0+1
	movf	1+(??_NtcAD_Testing+2)+0,w
	subwf	(_AdResult_12bit+1),w	;volatile
	skipz
	goto	u9405
	movf	0+(??_NtcAD_Testing+2)+0,w
	subwf	(_AdResult_12bit),w	;volatile
u9405:
	skipc
	goto	u9401
	goto	u9400
u9401:
	goto	l15243
u9400:
	goto	l15231
	line	233
	
l15243:	
;AD.c: 231: }
;AD.c: 232: }
;AD.c: 233: range++;
	incf	(NtcAD_Testing@range),f	;volatile
	line	234
	
l15245:	
;AD.c: 234: if(AdResult_12bit>=TempTab[105][1])
	movlw	low(_TempTab|8000h+01A6h)
	movwf	fsr0
	movlw	high(_TempTab|8000h+01A6h)
	movwf	btemp+1
	fcall	stringtab
	movwf	(??_NtcAD_Testing+0)+0
	fcall	stringtab
	movwf	(??_NtcAD_Testing+0)+0+1
	movf	1+(??_NtcAD_Testing+0)+0,w
	subwf	(_AdResult_12bit+1),w	;volatile
	skipz
	goto	u9415
	movf	0+(??_NtcAD_Testing+0)+0,w
	subwf	(_AdResult_12bit),w	;volatile
u9415:
	skipc
	goto	u9411
	goto	u9410
u9411:
	goto	l15249
u9410:
	line	236
	
l15247:	
;AD.c: 235: {
;AD.c: 236: Temperature_Dat=105;
	movlw	(069h)
	movwf	(_Temperature_Dat)	;volatile
	line	237
;AD.c: 237: break;
	goto	l15251
	line	212
	
l15249:	
	decf	(_BreakTimeOut),f
	movf	((_BreakTimeOut)),w
	xorlw	0FFh
	skipz
	goto	u9421
	goto	u9420
u9421:
	goto	l15223
u9420:
	line	241
	
l15251:	
;AD.c: 238: }
;AD.c: 240: }
;AD.c: 241: adsum = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(NtcAD_Testing@adsum)^080h	;volatile
	clrf	(NtcAD_Testing@adsum+1)^080h	;volatile
	line	242
;AD.c: 242: admin = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(NtcAD_Testing@admin)	;volatile
	clrf	(NtcAD_Testing@admin+1)	;volatile
	line	243
;AD.c: 243: admax = 0;
	clrf	(NtcAD_Testing@admax)	;volatile
	clrf	(NtcAD_Testing@admax+1)	;volatile
	line	244
;AD.c: 244: adtimes = 0;
	clrf	(NtcAD_Testing@adtimes)	;volatile
	goto	l6832
	line	250
	
l15253:	
;AD.c: 248: else
;AD.c: 249: {
;AD.c: 250: adsum = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(NtcAD_Testing@adsum)^080h	;volatile
	clrf	(NtcAD_Testing@adsum+1)^080h	;volatile
	line	251
;AD.c: 251: admin = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(NtcAD_Testing@admin)	;volatile
	clrf	(NtcAD_Testing@admin+1)	;volatile
	line	252
;AD.c: 252: admax = 0;
	clrf	(NtcAD_Testing@admax)	;volatile
	clrf	(NtcAD_Testing@admax+1)	;volatile
	line	255
	
l6832:	
	return
	opt stack 0
GLOBAL	__end_of_NtcAD_Testing
	__end_of_NtcAD_Testing:
;; =============== function _NtcAD_Testing ends ============

	signat	_NtcAD_Testing,4216
	global	_ShutDowm_Device
psect	text1279,local,class=CODE,delta=2
global __ptext1279
__ptext1279:

;; *************** function _ShutDowm_Device *****************
;; Defined at:
;;		line 1714 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/60
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		__74HC595_SET
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1279
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
	line	1714
	global	__size_of_ShutDowm_Device
	__size_of_ShutDowm_Device	equ	__end_of_ShutDowm_Device-_ShutDowm_Device
	
_ShutDowm_Device:	
	opt	stack 3
; Regs used in _ShutDowm_Device: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	1726
	
l15093:	
;pattern_fuction.c: 1726: ADCON0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(31)	;volatile
	line	1729
	
l15095:	
;pattern_fuction.c: 1729: Temp_595[0]=0xFF;
	movlw	(0FFh)
	movwf	(_Temp_595)	;volatile
	line	1730
	
l15097:	
;pattern_fuction.c: 1730: Temp_595[1]=0xFF;
	movlw	(0FFh)
	movwf	0+(_Temp_595)+01h	;volatile
	line	1731
;pattern_fuction.c: 1731: Temp_595[2]=0x00;
	clrf	0+(_Temp_595)+02h	;volatile
	line	1733
	
l15099:	
;pattern_fuction.c: 1733: Temp_595[0]&=~(1<<7);
	bcf	(_Temp_595)+(7/8),(7)&7	;volatile
	line	1734
	
l15101:	
;pattern_fuction.c: 1734: Temp_595[0]&=~(1<<6);
	bcf	(_Temp_595)+(6/8),(6)&7	;volatile
	line	1735
	
l15103:	
;pattern_fuction.c: 1735: RA7=0;
	bcf	(47/8),(47)&7
	line	1736
	
l15105:	
;pattern_fuction.c: 1736: RC0=0;
	bcf	(56/8),(56)&7
	line	1737
	
l15107:	
;pattern_fuction.c: 1737: RA6=0;
	bcf	(46/8),(46)&7
	line	1738
	
l15109:	
;pattern_fuction.c: 1738: Temp_595[1]&=~(1<<7);
	bcf	0+(_Temp_595)+01h+(7/8),(7)&7	;volatile
	line	1739
	
l15111:	
;pattern_fuction.c: 1739: Temp_595[1]&=~(1<<6);
	bcf	0+(_Temp_595)+01h+(6/8),(6)&7	;volatile
	line	1741
	
l15113:	
;pattern_fuction.c: 1741: _74HC595_SET();
	fcall	__74HC595_SET
	line	1744
	
l15115:	
;pattern_fuction.c: 1744: TRISC &= ~(0x3C);
	movlw	(0C3h)
	bsf	status, 5	;RP0=1, select bank1
	andwf	(135)^080h,f	;volatile
	line	1745
	
l15117:	
;pattern_fuction.c: 1745: RC2=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(58/8),(58)&7
	line	1746
	
l15119:	
;pattern_fuction.c: 1746: RC3=0;
	bcf	(59/8),(59)&7
	line	1747
	
l15121:	
;pattern_fuction.c: 1747: RC4=0;
	bcf	(60/8),(60)&7
	line	1748
	
l15123:	
;pattern_fuction.c: 1748: RC5=0;
	bcf	(61/8),(61)&7
	line	1750
	
l15125:	
;pattern_fuction.c: 1750: WDTCON=0;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(261)^0100h	;volatile
	line	1752
	
l15127:	
;pattern_fuction.c: 1752: TRISE = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(137)^080h	;volatile
	line	1753
	
l15129:	
;pattern_fuction.c: 1753: TRISB = 0B00000010;
	movlw	(02h)
	movwf	(134)^080h	;volatile
	line	1756
	
l15131:	
;pattern_fuction.c: 1756: TRISA = 0B00000000;
	clrf	(133)^080h	;volatile
	line	1757
	
l15133:	
;pattern_fuction.c: 1757: TRISC = 0B00000000;
	clrf	(135)^080h	;volatile
	line	1759
	
l15135:	
;pattern_fuction.c: 1759: RE1=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(73/8),(73)&7
	line	1760
	
l15137:	
;pattern_fuction.c: 1760: RB1=0;
	bcf	(49/8),(49)&7
	line	1762
	
l15139:	
;pattern_fuction.c: 1762: LCDCON0=0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(400)^0180h	;volatile
	line	1763
	
l15141:	
;pattern_fuction.c: 1763: LCDADD=0;
	clrf	(402)^0180h	;volatile
	line	1764
	
l15143:	
;pattern_fuction.c: 1764: COMEN =0;
	clrf	(407)^0180h	;volatile
	line	1765
	
l15145:	
;pattern_fuction.c: 1765: TRISC =0;
	bcf	status, 6	;RP1=0, select bank1
	clrf	(135)^080h	;volatile
	line	1768
	
l15147:	
;pattern_fuction.c: 1768: KEYCON0&=0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	andwf	(275)^0100h,f	;volatile
	line	1769
	
l15149:	
;pattern_fuction.c: 1769: RB1=RB1;
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(49/8),(49)&7
	goto	u9281
	goto	u9280
	
u9281:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(49/8),(49)&7
	goto	u9294
u9280:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(49/8),(49)&7
u9294:
	line	1770
	
l15151:	
# 1770 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
clrwdt ;#
psect	text1279
	line	1771
	
l15153:	
;pattern_fuction.c: 1771: INTCON=0B00001000;
	movlw	(08h)
	movwf	(11)	;volatile
	line	1772
	
l15155:	
# 1772 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
nop ;#
psect	text1279
	line	1773
	
l15157:	
# 1773 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
nop ;#
psect	text1279
	line	1774
	
l15159:	
# 1774 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
nop ;#
psect	text1279
	line	1775
	
l15161:	
# 1775 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
nop ;#
psect	text1279
	line	1776
	
l15163:	
# 1776 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
SLEEP ;#
psect	text1279
	line	1777
	
l15165:	
# 1777 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
nop ;#
psect	text1279
	line	1778
	
l15167:	
# 1778 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
nop ;#
psect	text1279
	line	1780
	
l15169:	
;pattern_fuction.c: 1780: INTCON = 0B11000000;
	movlw	(0C0h)
	movwf	(11)	;volatile
	line	1783
	
l15171:	
# 1783 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
nop ;#
psect	text1279
	line	1784
	
l15173:	
# 1784 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
nop ;#
psect	text1279
	line	1785
	
l15175:	
# 1785 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
clrwdt ;#
psect	text1279
	line	1786
	
l15177:	
# 1786 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
nop ;#
psect	text1279
	line	1787
	
l15179:	
# 1787 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
nop ;#
psect	text1279
	line	1790
	
l15181:	
;pattern_fuction.c: 1790: TRISE = 0B11110011;
	movlw	(0F3h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(137)^080h	;volatile
	line	1791
	
l15183:	
;pattern_fuction.c: 1791: TRISB = 0B11111111;
	movlw	(0FFh)
	movwf	(134)^080h	;volatile
	line	1792
	
l15185:	
;pattern_fuction.c: 1792: TRISC = 0B10111100;
	movlw	(0BCh)
	movwf	(135)^080h	;volatile
	line	1794
	
l15187:	
;pattern_fuction.c: 1794: TRISA = 0B00111111;
	movlw	(03Fh)
	movwf	(133)^080h	;volatile
	line	1795
	
l15189:	
;pattern_fuction.c: 1795: No_AC=0;
	bcf	(_No_AC/8),(_No_AC)&7
	line	1796
	
l15191:	
;pattern_fuction.c: 1796: LH_Count=0;
	clrf	(_LH_Count)^080h
	clrf	(_LH_Count+1)^080h
	line	1798
	
l15193:	
;pattern_fuction.c: 1798: LCDCON0=0B10110000;
	movlw	(0B0h)
	bsf	status, 6	;RP1=1, select bank3
	movwf	(400)^0180h	;volatile
	line	1799
	
l15195:	
;pattern_fuction.c: 1799: LCDADD =0B01100000;
	movlw	(060h)
	movwf	(402)^0180h	;volatile
	line	1802
	
l5570:	
	return
	opt stack 0
GLOBAL	__end_of_ShutDowm_Device
	__end_of_ShutDowm_Device:
;; =============== function _ShutDowm_Device ends ============

	signat	_ShutDowm_Device,88
	global	_Init_System
psect	text1280,local,class=CODE,delta=2
global __ptext1280
__ptext1280:

;; *************** function _Init_System *****************
;; Defined at:
;;		line 17 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/40
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		__74HC595_SET
;;		_DelayX
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1280
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\main.c"
	line	17
	global	__size_of_Init_System
	__size_of_Init_System	equ	__end_of_Init_System-_Init_System
	
_Init_System:	
	opt	stack 3
; Regs used in _Init_System: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	18
	
l15059:	
# 18 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\main.c"
nop ;#
psect	text1280
	line	19
	
l15061:	
;main.c: 19: INTCON = 0;
	clrf	(11)	;volatile
	line	20
	
l15063:	
;main.c: 20: OSCCON = 0X71;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	21
	
l15065:	
;main.c: 21: OPTION_REG = 0;
	clrf	(129)^080h	;volatile
	line	25
;main.c: 25: TRISE = 0B11110011;
	movlw	(0F3h)
	movwf	(137)^080h	;volatile
	line	26
;main.c: 26: TRISB = 0B11111111;
	movlw	(0FFh)
	movwf	(134)^080h	;volatile
	line	27
;main.c: 27: TRISC = 0B10111100;
	movlw	(0BCh)
	movwf	(135)^080h	;volatile
	line	29
;main.c: 29: TRISA = 0B00111111;
	movlw	(03Fh)
	movwf	(133)^080h	;volatile
	line	38
;main.c: 38: PIE1 = 2;
	movlw	(02h)
	movwf	(140)^080h	;volatile
	line	39
;main.c: 39: PR2 = 250;
	movlw	(0FAh)
	movwf	(146)^080h	;volatile
	line	40
;main.c: 40: T2CON = 6;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	43
	
l15067:	
;main.c: 43: RC0=0;
	bcf	(56/8),(56)&7
	line	44
	
l15069:	
;main.c: 44: RA6=0;
	bcf	(46/8),(46)&7
	line	45
	
l15071:	
;main.c: 45: Temp_595[0]&=~(1<<7);
	bcf	(_Temp_595)+(7/8),(7)&7	;volatile
	line	46
	
l15073:	
;main.c: 46: RA7=0;
	bcf	(47/8),(47)&7
	line	47
;main.c: 47: Temp_595[0]=0XFF;
	movlw	(0FFh)
	movwf	(_Temp_595)	;volatile
	line	48
;main.c: 48: Temp_595[1]=0XFF;
	movlw	(0FFh)
	movwf	0+(_Temp_595)+01h	;volatile
	line	49
;main.c: 49: Temp_595[2]=0XFF;
	movlw	(0FFh)
	movwf	0+(_Temp_595)+02h	;volatile
	line	50
	
l15075:	
;main.c: 50: RC0=1;
	bsf	(56/8),(56)&7
	line	52
	
l15077:	
;main.c: 52: _74HC595_SET();
	fcall	__74HC595_SET
	line	53
	
l15079:	
;main.c: 53: RE2=0;
	bcf	(74/8),(74)&7
	line	54
	
l15081:	
;main.c: 54: DelayX(1000);
	movlw	low(03E8h)
	movwf	(?_DelayX)
	movlw	high(03E8h)
	movwf	((?_DelayX))+1
	fcall	_DelayX
	line	57
	
l15083:	
;main.c: 57: IOCB=0x02;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(150)^080h	;volatile
	line	58
	
l15085:	
;main.c: 58: OPTION_REG&=~(1<<7);
	bcf	(129)^080h+(7/8),(7)&7	;volatile
	line	59
	
l15087:	
;main.c: 59: INTCON = 0B11001000;
	movlw	(0C8h)
	movwf	(11)	;volatile
	line	61
	
l15089:	
;main.c: 61: WPUB=0B00000010;
	movlw	(02h)
	movwf	(149)^080h	;volatile
	line	63
	
l15091:	
;main.c: 63: WDTCON=0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(261)^0100h	;volatile
	line	64
	
l1265:	
	return
	opt stack 0
GLOBAL	__end_of_Init_System
	__end_of_Init_System:
;; =============== function _Init_System ends ============

	signat	_Init_System,88
	global	___awmod
psect	text1281,local,class=CODE,delta=2
global __ptext1281
__ptext1281:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "E:\BBA'DATA\CMS_ID~1.32_\data\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] int 
;;  dividend        2    2[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    5[BANK0 ] unsigned char 
;;  counter         1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Hex_To_Temp
;;		_Pattern
;; This function uses a non-reentrant model
;;
psect	text1281
	file	"E:\BBA'DATA\CMS_ID~1.32_\data\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 2
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l15023:	
	clrf	(___awmod@sign)
	line	9
	
l15025:	
	btfss	(___awmod@dividend+1),7
	goto	u9211
	goto	u9210
u9211:
	goto	l15031
u9210:
	line	10
	
l15027:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	
l15029:	
	clrf	(___awmod@sign)
	incf	(___awmod@sign),f
	line	13
	
l15031:	
	btfss	(___awmod@divisor+1),7
	goto	u9221
	goto	u9220
u9221:
	goto	l15035
u9220:
	line	14
	
l15033:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	line	15
	
l15035:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u9231
	goto	u9230
u9231:
	goto	l15051
u9230:
	line	16
	
l15037:	
	clrf	(___awmod@counter)
	incf	(___awmod@counter),f
	line	17
	goto	l15041
	line	18
	
l15039:	
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	line	19
	incf	(___awmod@counter),f
	line	17
	
l15041:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u9241
	goto	u9240
u9241:
	goto	l15039
u9240:
	line	22
	
l15043:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u9255
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u9255:
	skipc
	goto	u9251
	goto	u9250
u9251:
	goto	l15047
u9250:
	line	23
	
l15045:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	line	24
	
l15047:	
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	line	25
	
l15049:	
	decfsz	(___awmod@counter),f
	goto	u9261
	goto	u9260
u9261:
	goto	l15043
u9260:
	line	27
	
l15051:	
	movf	(___awmod@sign),w
	skipz
	goto	u9270
	goto	l15055
u9270:
	line	28
	
l15053:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	29
	
l15055:	
	movf	(___awmod@dividend+1),w
	movwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	movwf	(?___awmod)
	line	30
	
l8167:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text1282,local,class=CODE,delta=2
global __ptext1282
__ptext1282:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "E:\BBA'DATA\CMS_ID~1.32_\data\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] int 
;;  dividend        2    2[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    6[BANK0 ] int 
;;  sign            1    5[BANK0 ] unsigned char 
;;  counter         1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Pattern
;; This function uses a non-reentrant model
;;
psect	text1282
	file	"E:\BBA'DATA\CMS_ID~1.32_\data\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 3
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l14979:	
	clrf	(___awdiv@sign)
	line	10
	
l14981:	
	btfss	(___awdiv@divisor+1),7
	goto	u9141
	goto	u9140
u9141:
	goto	l14987
u9140:
	line	11
	
l14983:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	
l14985:	
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	14
	
l14987:	
	btfss	(___awdiv@dividend+1),7
	goto	u9151
	goto	u9150
u9151:
	goto	l14993
u9150:
	line	15
	
l14989:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l14991:	
	movlw	(01h)
	xorwf	(___awdiv@sign),f
	line	18
	
l14993:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l14995:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u9161
	goto	u9160
u9161:
	goto	l15015
u9160:
	line	20
	
l14997:	
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	21
	goto	l15001
	line	22
	
l14999:	
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	line	23
	incf	(___awdiv@counter),f
	line	21
	
l15001:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u9171
	goto	u9170
u9171:
	goto	l14999
u9170:
	line	26
	
l15003:	
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	line	27
	
l15005:	
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u9185
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u9185:
	skipc
	goto	u9181
	goto	u9180
u9181:
	goto	l15011
u9180:
	line	28
	
l15007:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l15009:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	31
	
l15011:	
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	line	32
	
l15013:	
	decfsz	(___awdiv@counter),f
	goto	u9191
	goto	u9190
u9191:
	goto	l15003
u9190:
	line	34
	
l15015:	
	movf	(___awdiv@sign),w
	skipz
	goto	u9200
	goto	l15019
u9200:
	line	35
	
l15017:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	36
	
l15019:	
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	37
	
l8099:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___lbmod
psect	text1283,local,class=CODE,delta=2
global __ptext1283
__ptext1283:

;; *************** function ___lbmod *****************
;; Defined at:
;;		line 5 in file "E:\BBA'DATA\CMS_ID~1.32_\data\sources\lbmod.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    2[BANK0 ] unsigned char 
;;  rem             1    4[BANK0 ] unsigned char 
;;  counter         1    3[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Pattern
;; This function uses a non-reentrant model
;;
psect	text1283
	file	"E:\BBA'DATA\CMS_ID~1.32_\data\sources\lbmod.c"
	line	5
	global	__size_of___lbmod
	__size_of___lbmod	equ	__end_of___lbmod-___lbmod
	
___lbmod:	
	opt	stack 3
; Regs used in ___lbmod: [wreg+status,2+status,0]
;___lbmod@dividend stored from wreg
	line	9
	movwf	(___lbmod@dividend)
	
l12549:	
	movlw	(08h)
	movwf	(___lbmod@counter)
	line	10
	
l12551:	
	clrf	(___lbmod@rem)
	line	12
	
l12553:	
	movf	(___lbmod@dividend),w
	movwf	(??___lbmod+0)+0
	movlw	07h
u6065:
	clrc
	rrf	(??___lbmod+0)+0,f
	addlw	-1
	skipz
	goto	u6065
	clrc
	rlf	(___lbmod@rem),w
	iorwf	0+(??___lbmod+0)+0,w
	movwf	(___lbmod@rem)
	line	13
	
l12555:	
	clrc
	rlf	(___lbmod@dividend),f
	line	14
	
l12557:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),w
	skipc
	goto	u6071
	goto	u6070
u6071:
	goto	l12561
u6070:
	line	15
	
l12559:	
	movf	(___lbmod@divisor),w
	subwf	(___lbmod@rem),f
	line	16
	
l12561:	
	decfsz	(___lbmod@counter),f
	goto	u6081
	goto	u6080
u6081:
	goto	l12553
u6080:
	line	17
	
l12563:	
	movf	(___lbmod@rem),w
	line	18
	
l7988:	
	return
	opt stack 0
GLOBAL	__end_of___lbmod
	__end_of___lbmod:
;; =============== function ___lbmod ends ============

	signat	___lbmod,8313
	global	___lbdiv
psect	text1284,local,class=CODE,delta=2
global __ptext1284
__ptext1284:

;; *************** function ___lbdiv *****************
;; Defined at:
;;		line 5 in file "E:\BBA'DATA\CMS_ID~1.32_\data\sources\lbdiv.c"
;; Parameters:    Size  Location     Type
;;  dividend        1    wreg     unsigned char 
;;  divisor         1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dividend        1    1[BANK0 ] unsigned char 
;;  quotient        1    3[BANK0 ] unsigned char 
;;  counter         1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Hex_To_Temp
;;		_Pattern
;; This function uses a non-reentrant model
;;
psect	text1284
	file	"E:\BBA'DATA\CMS_ID~1.32_\data\sources\lbdiv.c"
	line	5
	global	__size_of___lbdiv
	__size_of___lbdiv	equ	__end_of___lbdiv-___lbdiv
	
___lbdiv:	
	opt	stack 2
; Regs used in ___lbdiv: [wreg+status,2+status,0]
;___lbdiv@dividend stored from wreg
	line	9
	movwf	(___lbdiv@dividend)
	
l14955:	
	clrf	(___lbdiv@quotient)
	line	10
	
l14957:	
	movf	(___lbdiv@divisor),w
	skipz
	goto	u9100
	goto	l14975
u9100:
	line	11
	
l14959:	
	clrf	(___lbdiv@counter)
	incf	(___lbdiv@counter),f
	line	12
	goto	l14963
	
l7977:	
	line	13
	clrc
	rlf	(___lbdiv@divisor),f
	line	14
	
l14961:	
	incf	(___lbdiv@counter),f
	line	12
	
l14963:	
	btfss	(___lbdiv@divisor),(7)&7
	goto	u9111
	goto	u9110
u9111:
	goto	l7977
u9110:
	line	16
	
l7979:	
	line	17
	clrc
	rlf	(___lbdiv@quotient),f
	line	18
	
l14965:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),w
	skipc
	goto	u9121
	goto	u9120
u9121:
	goto	l14971
u9120:
	line	19
	
l14967:	
	movf	(___lbdiv@divisor),w
	subwf	(___lbdiv@dividend),f
	line	20
	
l14969:	
	bsf	(___lbdiv@quotient)+(0/8),(0)&7
	line	22
	
l14971:	
	clrc
	rrf	(___lbdiv@divisor),f
	line	23
	
l14973:	
	decfsz	(___lbdiv@counter),f
	goto	u9131
	goto	u9130
u9131:
	goto	l7979
u9130:
	line	25
	
l14975:	
	movf	(___lbdiv@quotient),w
	line	26
	
l7982:	
	return
	opt stack 0
GLOBAL	__end_of___lbdiv
	__end_of___lbdiv:
;; =============== function ___lbdiv ends ============

	signat	___lbdiv,8313
	global	___lwdiv
psect	text1285,local,class=CODE,delta=2
global __ptext1285
__ptext1285:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "E:\BBA'DATA\CMS_ID~1.32_\data\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] unsigned int 
;;  dividend        2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[BANK0 ] unsigned int 
;;  counter         1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_NtcAD_Testing
;; This function uses a non-reentrant model
;;
psect	text1285
	file	"E:\BBA'DATA\CMS_ID~1.32_\data\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 3
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l14929:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l14931:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u9061
	goto	u9060
u9061:
	goto	l14951
u9060:
	line	11
	
l14933:	
	clrf	(___lwdiv@counter)
	incf	(___lwdiv@counter),f
	line	12
	goto	l14937
	line	13
	
l14935:	
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	line	14
	incf	(___lwdiv@counter),f
	line	12
	
l14937:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u9071
	goto	u9070
u9071:
	goto	l14935
u9070:
	line	17
	
l14939:	
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	line	18
	
l14941:	
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u9085
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u9085:
	skipc
	goto	u9081
	goto	u9080
u9081:
	goto	l14947
u9080:
	line	19
	
l14943:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l14945:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	line	22
	
l14947:	
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	line	23
	
l14949:	
	decfsz	(___lwdiv@counter),f
	goto	u9091
	goto	u9090
u9091:
	goto	l14939
u9090:
	line	25
	
l14951:	
	movf	(___lwdiv@quotient+1),w
	movwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	movwf	(?___lwdiv)
	line	26
	
l7962:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_CheckValidTime
psect	text1286,local,class=CODE,delta=2
global __ptext1286
__ptext1286:

;; *************** function _CheckValidTime *****************
;; Defined at:
;;		line 468 in file "F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/100
;;		On exit  : 60/160
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_CheckTouchKey
;; This function uses a non-reentrant model
;;
psect	text1286
	file	"F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
	line	468
	global	__size_of_CheckValidTime
	__size_of_CheckValidTime	equ	__end_of_CheckValidTime-_CheckValidTime
	
_CheckValidTime:	
	opt	stack 3
; Regs used in _CheckValidTime: [wreg+status,2+status,0]
	line	473
	
l14919:	
;CheckTouchKey.c: 472: {
;CheckTouchKey.c: 473: if(KeyFlag[0] | KeyFlag[1])
	movf	0+(_KeyFlag)+01h,w	;volatile
	iorwf	(_KeyFlag),w	;volatile
	btfsc	status,2
	goto	u9041
	goto	u9040
u9041:
	goto	l14925
u9040:
	line	475
	
l14921:	
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	incf	(CheckValidTime@validtime)^0180h,f
	skipnz
	incf	(CheckValidTime@validtime+1)^0180h,f
	movlw	high(03A98h)
	subwf	((CheckValidTime@validtime+1)^0180h),w
	movlw	low(03A98h)
	skipnz
	subwf	((CheckValidTime@validtime)^0180h),w
	skipc
	goto	u9051
	goto	u9050
u9051:
	goto	l7003
u9050:
	line	477
	
l14923:	
;CheckTouchKey.c: 476: {
;CheckTouchKey.c: 477: b_kerr = 1;
	bsf	(_b_kerr/8),(_b_kerr)&7
	line	478
	
l14925:	
;CheckTouchKey.c: 478: validtime = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(CheckValidTime@validtime)^0180h
	clrf	(CheckValidTime@validtime+1)^0180h
	line	486
	
l7003:	
	return
	opt stack 0
GLOBAL	__end_of_CheckValidTime
	__end_of_CheckValidTime:
;; =============== function _CheckValidTime ends ============

	signat	_CheckValidTime,88
	global	_KeyHave
psect	text1287,local,class=CODE,delta=2
global __ptext1287
__ptext1287:

;; *************** function _KeyHave *****************
;; Defined at:
;;		line 143 in file "F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;  cnt             1    wreg     unsigned char 
;;  flag            2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  cnt             1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 160/100
;;		On exit  : 160/100
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_CheckOnceResult
;; This function uses a non-reentrant model
;;
psect	text1287
	file	"F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
	line	143
	global	__size_of_KeyHave
	__size_of_KeyHave	equ	__end_of_KeyHave-_KeyHave
	
_KeyHave:	
	opt	stack 2
; Regs used in _KeyHave: [wreg+status,2+status,0]
;KeyHave@cnt stored from wreg
	movwf	(KeyHave@cnt)
	line	144
	
l14903:	
;CheckTouchKey.c: 144: KeyCounter++;
	incf	(_KeyCounter),f
	line	148
	
l14905:	
;CheckTouchKey.c: 147: {
;CheckTouchKey.c: 148: KeyData[0] = 0;
	clrf	(_KeyData)	;volatile
	line	149
	
l14907:	
;CheckTouchKey.c: 149: KeyData[1] = 0;
	clrf	0+(_KeyData)+01h	;volatile
	line	150
	
l14909:	
;CheckTouchKey.c: 150: if(cnt&0x8)
	btfss	(KeyHave@cnt),(3)&7
	goto	u9031
	goto	u9030
u9031:
	goto	l14913
u9030:
	line	152
	
l14911:	
;CheckTouchKey.c: 151: {
;CheckTouchKey.c: 152: KeyData[1] = flag;
	movf	(KeyHave@flag),w
	movwf	0+(_KeyData)+01h	;volatile
	line	153
;CheckTouchKey.c: 153: }
	goto	l6924
	line	156
	
l14913:	
;CheckTouchKey.c: 154: else
;CheckTouchKey.c: 155: {
;CheckTouchKey.c: 156: KeyData[0] = flag;
	movf	(KeyHave@flag),w
	movwf	(_KeyData)	;volatile
	line	170
	
l6924:	
	return
	opt stack 0
GLOBAL	__end_of_KeyHave
	__end_of_KeyHave:
;; =============== function _KeyHave ends ============

	signat	_KeyHave,8312
	global	_ClearResSum
psect	text1288,local,class=CODE,delta=2
global __ptext1288
__ptext1288:

;; *************** function _ClearResSum *****************
;; Defined at:
;;		line 127 in file "F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  cnt             1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 160/100
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_GetTouchKeyValue
;;		_CheckTouchKey
;; This function uses a non-reentrant model
;;
psect	text1288
	file	"F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
	line	127
	global	__size_of_ClearResSum
	__size_of_ClearResSum	equ	__end_of_ClearResSum-_ClearResSum
	
_ClearResSum:	
	opt	stack 3
; Regs used in _ClearResSum: [wreg-fsr0h+status,2+status,0]
	line	128
	
l14897:	
;CheckTouchKey.c: 128: unsigned char cnt = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(ClearResSum@cnt)
	line	131
	
l14899:	
;CheckTouchKey.c: 130: {
;CheckTouchKey.c: 131: KeyResSum[cnt] = 0;
	clrc
	rlf	(ClearResSum@cnt),w
	addlw	_KeyResSum&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	132
	
l14901:	
	movlw	(0Ch)
	incf	(ClearResSum@cnt),f
	subwf	((ClearResSum@cnt)),w
	skipc
	goto	u9021
	goto	u9020
u9021:
	goto	l14899
u9020:
	line	133
	
l6915:	
	return
	opt stack 0
GLOBAL	__end_of_ClearResSum
	__end_of_ClearResSum:
;; =============== function _ClearResSum ends ============

	signat	_ClearResSum,88
	global	_KeyClearOne
psect	text1289,local,class=CODE,delta=2
global __ptext1289
__ptext1289:

;; *************** function _KeyClearOne *****************
;; Defined at:
;;		line 81 in file "F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;  cnt             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cnt             1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/100
;;		On exit  : 160/100
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_KeyClearIn
;;		_KeyStopClear
;;		_CheckOnceResult
;; This function uses a non-reentrant model
;;
psect	text1289
	file	"F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
	line	81
	global	__size_of_KeyClearOne
	__size_of_KeyClearOne	equ	__end_of_KeyClearOne-_KeyClearOne
	
_KeyClearOne:	
	opt	stack 2
; Regs used in _KeyClearOne: [wreg-fsr0h+status,2+status,0]
;KeyClearOne@cnt stored from wreg
	movwf	(KeyClearOne@cnt)
	line	82
	
l14895:	
;CheckTouchKey.c: 82: KeyOldValue0[cnt] = 0;
	clrc
	rlf	(KeyClearOne@cnt),w
	addlw	_KeyOldValue0&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	83
;CheckTouchKey.c: 83: KeyOldValue1[cnt] = 0;
	clrc
	rlf	(KeyClearOne@cnt),w
	addlw	_KeyOldValue1&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	84
;CheckTouchKey.c: 84: KeyOldValue2[cnt] = 0;
	clrc
	rlf	(KeyClearOne@cnt),w
	addlw	_KeyOldValue2&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	85
;CheckTouchKey.c: 85: KeyReference[cnt] = 0;
	clrc
	rlf	(KeyClearOne@cnt),w
	addlw	_KeyReference&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	86
	
l6899:	
	return
	opt stack 0
GLOBAL	__end_of_KeyClearOne
	__end_of_KeyClearOne:
;; =============== function _KeyClearOne ends ============

	signat	_KeyClearOne,4216
	global	_KeyIsIn
psect	text1290,local,class=CODE,delta=2
global __ptext1290
__ptext1290:

;; *************** function _KeyIsIn *****************
;; Defined at:
;;		line 59 in file "F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
;; Parameters:    Size  Location     Type
;;  cnt             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cnt             1    1[BANK0 ] unsigned char 
;;  i               1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath
;; Tracked objects:
;;		On entry : 60/100
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_KeyClearIn
;;		_CheckOnceResult
;;		_CheckKeyOldValue
;; This function uses a non-reentrant model
;;
psect	text1290
	file	"F:\项目2016\中微\Library Source Code\TouchKey_Library_V102\CMS69F628_TK_Lib\CheckTouchKey.c"
	line	59
	global	__size_of_KeyIsIn
	__size_of_KeyIsIn	equ	__end_of_KeyIsIn-_KeyIsIn
	
_KeyIsIn:	
	opt	stack 2
; Regs used in _KeyIsIn: [wreg-fsr0h+status,2+status,0+btemp+1+pclath]
;KeyIsIn@cnt stored from wreg
	movwf	(KeyIsIn@cnt)
	line	60
	
l14883:	
;CheckTouchKey.c: 60: unsigned char i = Table_KeyFalg[cnt&0x7];
	movf	(KeyIsIn@cnt),w
	andlw	07h
	addlw	low(_Table_KeyFalg|8000h)
	movwf	fsr0
	movlw	high(_Table_KeyFalg|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(KeyIsIn@i)
	line	62
	
l14885:	
;CheckTouchKey.c: 62: if(cnt&0x8)
	btfss	(KeyIsIn@cnt),(3)&7
	goto	u9011
	goto	u9010
u9011:
	goto	l14889
u9010:
	line	64
	
l14887:	
;CheckTouchKey.c: 63: {
;CheckTouchKey.c: 64: i &= KeyFlag[1];
	movf	0+(_KeyFlag)+01h,w	;volatile
	andwf	(KeyIsIn@i),f
	line	65
;CheckTouchKey.c: 65: }
	goto	l14891
	line	68
	
l14889:	
;CheckTouchKey.c: 66: else
;CheckTouchKey.c: 67: {
;CheckTouchKey.c: 68: i &= KeyFlag[0];
	movf	(_KeyFlag),w	;volatile
	andwf	(KeyIsIn@i),f
	line	70
	
l14891:	
;CheckTouchKey.c: 69: }
;CheckTouchKey.c: 70: return i;
	movf	(KeyIsIn@i),w
	line	71
	
l6896:	
	return
	opt stack 0
GLOBAL	__end_of_KeyIsIn
	__end_of_KeyIsIn:
;; =============== function _KeyIsIn ends ============

	signat	_KeyIsIn,4217
	global	_AD_Sample
psect	text1291,local,class=CODE,delta=2
global __ptext1291
__ptext1291:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 120 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\AD.c"
;; Parameters:    Size  Location     Type
;;  adch            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  adch            1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_NtcAD_Testing
;; This function uses a non-reentrant model
;;
psect	text1291
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\AD.c"
	line	120
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg+status,2+status,0]
;AD_Sample@adch stored from wreg
	movwf	(AD_Sample@adch)
	line	121
	
l12431:	
;AD.c: 121: RC0=1;
	bsf	(56/8),(56)&7
	line	126
	
l12433:	
;AD.c: 126: ADCON1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(159)^080h	;volatile
	line	136
	
l12435:	
;AD.c: 136: ADCON0 = 0X041 | (adch << 2);
	bcf	status, 5	;RP0=0, select bank0
	movf	(AD_Sample@adch),w
	movwf	(??_AD_Sample+0)+0
	clrc
	rlf	(??_AD_Sample+0)+0,f
	clrc
	rlf	(??_AD_Sample+0)+0,w
	iorlw	041h
	movwf	(31)	;volatile
	line	146
	
l12437:	
# 146 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\AD.c"
nop ;#
psect	text1291
	line	147
	
l12439:	
# 147 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\AD.c"
nop ;#
psect	text1291
	line	149
	
l12441:	
;AD.c: 149: GODONE = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	150
	
l12443:	
;AD.c: 150: BreakTimeOut = 0xff;
	movlw	(0FFh)
	movwf	(_BreakTimeOut)
	line	151
;AD.c: 151: while(GODONE)
	goto	l6797
	
l6798:	
	line	153
;AD.c: 152: {
;AD.c: 153: if(0 == (--BreakTimeOut))
	decfsz	(_BreakTimeOut),f
	goto	u5911
	goto	u5910
u5911:
	goto	l6797
u5910:
	line	156
	
l12445:	
;AD.c: 154: {
;AD.c: 156: return 0;
	movlw	(0)
	goto	l6800
	line	158
	
l6797:	
	line	151
	btfsc	(249/8),(249)&7
	goto	u5921
	goto	u5920
u5921:
	goto	l6798
u5920:
	line	159
	
l12449:	
;AD.c: 157: }
;AD.c: 158: }
;AD.c: 159: return 1;
	movlw	(01h)
	line	160
	
l6800:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,4217
	global	_LED_Crt
psect	text1292,local,class=CODE,delta=2
global __ptext1292
__ptext1292:

;; *************** function _LED_Crt *****************
;; Defined at:
;;		line 1479 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Pattern
;; This function uses a non-reentrant model
;;
psect	text1292
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
	line	1479
	global	__size_of_LED_Crt
	__size_of_LED_Crt	equ	__end_of_LED_Crt-_LED_Crt
	
_LED_Crt:	
	opt	stack 3
; Regs used in _LED_Crt: [wreg-fsr0h+status,2+status,0]
	line	1480
	
l14697:	
;pattern_fuction.c: 1480: switch(Pattern_LED_Crt)
	goto	l14875
	line	1483
	
l14699:	
;pattern_fuction.c: 1483: BG_LED_State=2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_BG_LED_State)
	line	1484
	
l14701:	
;pattern_fuction.c: 1484: BG_LED_ON_Time=0;
	clrf	(_BG_LED_ON_Time)
	line	1486
	
l14703:	
;pattern_fuction.c: 1486: ANNULUS_LIGHT_State=2;
	movlw	(02h)
	movwf	(_ANNULUS_LIGHT_State)
	line	1487
	
l14705:	
;pattern_fuction.c: 1487: SHOW_LIGHT_State=2;
	movlw	(02h)
	movwf	(_SHOW_LIGHT_State)
	line	1488
	
l14707:	
;pattern_fuction.c: 1488: ANNULUS_LIGHT_Flash_Times=0;
	clrf	(_ANNULUS_LIGHT_Flash_Times)
	line	1489
	
l14709:	
;pattern_fuction.c: 1489: SHOW_LIGHT_Flash_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_SHOW_LIGHT_Flash_Times)^080h
	line	1491
	
l14711:	
;pattern_fuction.c: 1491: LED_Flash_HZ=0;
	clrf	(_LED_Flash_HZ)
	line	1492
	
l14713:	
;pattern_fuction.c: 1492: LED_Flash_Bool=1;
	bsf	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	line	1493
	
l14715:	
;pattern_fuction.c: 1493: LED1_Flash_Times=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_LED1_Flash_Times)
	line	1494
	
l14717:	
;pattern_fuction.c: 1494: LED1_State=2;
	movlw	(02h)
	movwf	(_LED1_State)
	line	1495
	
l14719:	
;pattern_fuction.c: 1495: LED2_State=2;
	movlw	(02h)
	movwf	(_LED2_State)
	line	1496
	
l14721:	
;pattern_fuction.c: 1496: LED3_State=2;
	movlw	(02h)
	movwf	(_LED3_State)
	line	1497
	
l14723:	
;pattern_fuction.c: 1497: LED4_State=2;
	movlw	(02h)
	movwf	(_LED4_State)
	line	1498
	
l14725:	
;pattern_fuction.c: 1498: LED5_State=2;
	movlw	(02h)
	movwf	(_LED5_State)
	line	1499
	
l14727:	
;pattern_fuction.c: 1499: LED6_State=2;
	movlw	(02h)
	movwf	(_LED6_State)
	line	1500
	
l14729:	
;pattern_fuction.c: 1500: LED7_State=2;
	movlw	(02h)
	movwf	(_LED7_State)
	line	1501
	
l14731:	
;pattern_fuction.c: 1501: LED8_State=2;
	movlw	(02h)
	movwf	(_LED8_State)
	line	1502
	
l14733:	
;pattern_fuction.c: 1502: LED9_State=2;
	movlw	(02h)
	movwf	(_LED9_State)
	line	1503
	
l14735:	
;pattern_fuction.c: 1503: LED10_State=2;
	movlw	(02h)
	movwf	(_LED10_State)
	line	1504
	
l14737:	
;pattern_fuction.c: 1504: LED11_State=2;
	movlw	(02h)
	movwf	(_LED11_State)
	line	1505
	
l14739:	
;pattern_fuction.c: 1505: LED12_State=2;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_LED12_State)^080h
	line	1506
	
l14741:	
;pattern_fuction.c: 1506: Pattern_LED_Crt=1;
	clrf	(_Pattern_LED_Crt)^080h
	incf	(_Pattern_LED_Crt)^080h,f
	clrf	(_Pattern_LED_Crt+1)^080h
	line	1507
;pattern_fuction.c: 1507: break;
	goto	l5561
	line	1510
	
l14743:	
;pattern_fuction.c: 1510: if(LED1_Flash_Times>3)
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_LED1_Flash_Times),w
	skipc
	goto	u8791
	goto	u8790
u8791:
	goto	l14751
u8790:
	line	1512
	
l14745:	
;pattern_fuction.c: 1511: {
;pattern_fuction.c: 1512: BG_LED_State=3;
	movlw	(03h)
	movwf	(_BG_LED_State)
	line	1513
	
l14747:	
;pattern_fuction.c: 1513: if(!LED_Flash_Bool)
	btfsc	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8801
	goto	u8800
u8801:
	goto	l14751
u8800:
	line	1515
	
l14749:	
;pattern_fuction.c: 1514: {
;pattern_fuction.c: 1515: LED1_State=0;
	clrf	(_LED1_State)
	line	1516
;pattern_fuction.c: 1516: LED2_State=0;
	clrf	(_LED2_State)
	line	1517
;pattern_fuction.c: 1517: LED3_State=0;
	clrf	(_LED3_State)
	line	1518
;pattern_fuction.c: 1518: LED4_State=0;
	clrf	(_LED4_State)
	line	1519
;pattern_fuction.c: 1519: LED5_State=0;
	clrf	(_LED5_State)
	line	1520
;pattern_fuction.c: 1520: LED6_State=0;
	clrf	(_LED6_State)
	line	1521
;pattern_fuction.c: 1521: LED7_State=0;
	clrf	(_LED7_State)
	line	1522
;pattern_fuction.c: 1522: LED8_State=0;
	clrf	(_LED8_State)
	line	1523
;pattern_fuction.c: 1523: LED9_State=0;
	clrf	(_LED9_State)
	line	1524
;pattern_fuction.c: 1524: LED10_State=0;
	clrf	(_LED10_State)
	line	1525
;pattern_fuction.c: 1525: LED11_State=0;
	clrf	(_LED11_State)
	line	1526
;pattern_fuction.c: 1526: LED12_State=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LED12_State)^080h
	line	1529
	
l14751:	
;pattern_fuction.c: 1527: }
;pattern_fuction.c: 1528: }
;pattern_fuction.c: 1529: if(ANNULUS_LIGHT_Flash_Times>3)
	movlw	(04h)
	subwf	(_ANNULUS_LIGHT_Flash_Times),w
	skipc
	goto	u8811
	goto	u8810
u8811:
	goto	l5561
u8810:
	line	1531
	
l14753:	
;pattern_fuction.c: 1530: {
;pattern_fuction.c: 1531: if(!LED_Flash_Bool)
	btfsc	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8821
	goto	u8820
u8821:
	goto	l5561
u8820:
	line	1533
	
l14755:	
;pattern_fuction.c: 1532: {
;pattern_fuction.c: 1533: ANNULUS_LIGHT_State=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_ANNULUS_LIGHT_State)
	line	1534
;pattern_fuction.c: 1534: SHOW_LIGHT_State=0;
	clrf	(_SHOW_LIGHT_State)
	goto	l5561
	line	1536
	
l5523:	
	line	1537
;pattern_fuction.c: 1535: }
;pattern_fuction.c: 1536: }
;pattern_fuction.c: 1537: break;
	goto	l5561
	line	1539
;pattern_fuction.c: 1539: case 2:
	
l5525:	
	line	1540
;pattern_fuction.c: 1540: BG_LED_State=1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_BG_LED_State)
	incf	(_BG_LED_State),f
	line	1541
	
l14757:	
;pattern_fuction.c: 1541: ANNULUS_LIGHT_State=0;
	clrf	(_ANNULUS_LIGHT_State)
	line	1542
;pattern_fuction.c: 1542: SHOW_LIGHT_State=0;
	clrf	(_SHOW_LIGHT_State)
	line	1543
;pattern_fuction.c: 1543: LED1_State=0;
	clrf	(_LED1_State)
	line	1544
;pattern_fuction.c: 1544: LED2_State=0;
	clrf	(_LED2_State)
	line	1545
;pattern_fuction.c: 1545: LED3_State=0;
	clrf	(_LED3_State)
	line	1546
;pattern_fuction.c: 1546: LED4_State=0;
	clrf	(_LED4_State)
	line	1547
;pattern_fuction.c: 1547: LED5_State=0;
	clrf	(_LED5_State)
	line	1548
;pattern_fuction.c: 1548: LED6_State=0;
	clrf	(_LED6_State)
	line	1549
;pattern_fuction.c: 1549: LED7_State=0;
	clrf	(_LED7_State)
	line	1550
;pattern_fuction.c: 1550: LED8_State=0;
	clrf	(_LED8_State)
	line	1551
;pattern_fuction.c: 1551: LED9_State=0;
	clrf	(_LED9_State)
	line	1552
;pattern_fuction.c: 1552: LED10_State=0;
	clrf	(_LED10_State)
	line	1553
;pattern_fuction.c: 1553: LED11_State=0;
	clrf	(_LED11_State)
	line	1554
;pattern_fuction.c: 1554: LED12_State=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LED12_State)^080h
	line	1555
	
l14759:	
;pattern_fuction.c: 1555: Pattern_LED_Crt=3;
	movlw	03h
	movwf	(_Pattern_LED_Crt)^080h
	clrf	(_Pattern_LED_Crt+1)^080h
	line	1556
;pattern_fuction.c: 1556: break;
	goto	l5561
	line	1560
	
l14761:	
;pattern_fuction.c: 1560: if(Option)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Option),w
	skipz
	goto	u8830
	goto	l14765
u8830:
	line	1562
	
l14763:	
;pattern_fuction.c: 1561: {
;pattern_fuction.c: 1562: LED11_State=1;
	clrf	(_LED11_State)
	incf	(_LED11_State),f
	line	1563
;pattern_fuction.c: 1563: }
	goto	l14767
	line	1566
	
l14765:	
;pattern_fuction.c: 1564: else
;pattern_fuction.c: 1565: {
;pattern_fuction.c: 1566: LED11_State=0;
	clrf	(_LED11_State)
	line	1568
	
l14767:	
;pattern_fuction.c: 1567: }
;pattern_fuction.c: 1568: if(Start)
	movf	(_Start),w
	skipz
	goto	u8840
	goto	l14771
u8840:
	line	1570
	
l14769:	
;pattern_fuction.c: 1569: {
;pattern_fuction.c: 1570: LED12_State=1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LED12_State)^080h
	incf	(_LED12_State)^080h,f
	line	1576
;pattern_fuction.c: 1571: }
	
l14771:	
;pattern_fuction.c: 1575: }
;pattern_fuction.c: 1576: if(Regular)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Regular),w
	skipz
	goto	u8850
	goto	l14777
u8850:
	line	1578
	
l14773:	
;pattern_fuction.c: 1577: {
;pattern_fuction.c: 1578: LED1_State=1;
	clrf	(_LED1_State)
	incf	(_LED1_State),f
	line	1579
	
l14775:	
;pattern_fuction.c: 1579: LED2_State=0;
	clrf	(_LED2_State)
	line	1580
;pattern_fuction.c: 1580: LED3_State=0;
	clrf	(_LED3_State)
	line	1581
;pattern_fuction.c: 1581: LED4_State=0;
	clrf	(_LED4_State)
	line	1582
;pattern_fuction.c: 1582: }
	goto	l14795
	line	1583
	
l14777:	
;pattern_fuction.c: 1583: else if(Bold)
	movf	(_Bold),w
	skipz
	goto	u8860
	goto	l14783
u8860:
	line	1585
	
l14779:	
;pattern_fuction.c: 1584: {
;pattern_fuction.c: 1585: LED1_State=0;
	clrf	(_LED1_State)
	line	1586
	
l14781:	
;pattern_fuction.c: 1586: LED2_State=1;
	clrf	(_LED2_State)
	incf	(_LED2_State),f
	line	1587
;pattern_fuction.c: 1587: LED3_State=0;
	clrf	(_LED3_State)
	line	1588
;pattern_fuction.c: 1588: LED4_State=0;
	clrf	(_LED4_State)
	line	1589
;pattern_fuction.c: 1589: }
	goto	l14795
	line	1590
	
l14783:	
;pattern_fuction.c: 1590: else if(Iced)
	movf	(_Iced),w
	skipz
	goto	u8870
	goto	l14789
u8870:
	line	1592
	
l14785:	
;pattern_fuction.c: 1591: {
;pattern_fuction.c: 1592: LED1_State=0;
	clrf	(_LED1_State)
	line	1593
;pattern_fuction.c: 1593: LED2_State=0;
	clrf	(_LED2_State)
	line	1594
	
l14787:	
;pattern_fuction.c: 1594: LED3_State=1;
	clrf	(_LED3_State)
	incf	(_LED3_State),f
	line	1595
;pattern_fuction.c: 1595: LED4_State=0;
	clrf	(_LED4_State)
	line	1596
;pattern_fuction.c: 1596: }
	goto	l14795
	line	1597
	
l14789:	
;pattern_fuction.c: 1597: else if(Tea)
	movf	(_Tea),w
	skipz
	goto	u8880
	goto	l5534
u8880:
	line	1599
	
l14791:	
;pattern_fuction.c: 1598: {
;pattern_fuction.c: 1599: LED1_State=0;
	clrf	(_LED1_State)
	line	1600
;pattern_fuction.c: 1600: LED2_State=0;
	clrf	(_LED2_State)
	line	1601
;pattern_fuction.c: 1601: LED3_State=0;
	clrf	(_LED3_State)
	line	1602
	
l14793:	
;pattern_fuction.c: 1602: LED4_State=1;
	clrf	(_LED4_State)
	incf	(_LED4_State),f
	goto	l14795
	line	1605
	
l5534:	
	
l14795:	
;pattern_fuction.c: 1603: }
;pattern_fuction.c: 1605: if(_80_z)
	movf	(__80_z),w
	skipz
	goto	u8890
	goto	l14801
u8890:
	line	1607
	
l14797:	
;pattern_fuction.c: 1606: {
;pattern_fuction.c: 1607: LED7_State=1;
	clrf	(_LED7_State)
	incf	(_LED7_State),f
	line	1608
	
l14799:	
;pattern_fuction.c: 1608: LED8_State=0;
	clrf	(_LED8_State)
	line	1609
;pattern_fuction.c: 1609: LED9_State=0;
	clrf	(_LED9_State)
	line	1610
;pattern_fuction.c: 1610: LED10_State=0;
	clrf	(_LED10_State)
	line	1611
;pattern_fuction.c: 1611: }
	goto	l5561
	line	1612
	
l14801:	
;pattern_fuction.c: 1612: else if(_120_z)
	movf	(__120_z),w
	skipz
	goto	u8900
	goto	l14807
u8900:
	line	1614
	
l14803:	
;pattern_fuction.c: 1613: {
;pattern_fuction.c: 1614: LED7_State=0;
	clrf	(_LED7_State)
	line	1615
	
l14805:	
;pattern_fuction.c: 1615: LED8_State=1;
	clrf	(_LED8_State)
	incf	(_LED8_State),f
	line	1616
;pattern_fuction.c: 1616: LED9_State=0;
	clrf	(_LED9_State)
	line	1617
;pattern_fuction.c: 1617: LED10_State=0;
	clrf	(_LED10_State)
	line	1618
;pattern_fuction.c: 1618: }
	goto	l5561
	line	1619
	
l14807:	
;pattern_fuction.c: 1619: else if(_210_z)
	movf	(__210_z),w
	skipz
	goto	u8910
	goto	l14813
u8910:
	line	1621
	
l14809:	
;pattern_fuction.c: 1620: {
;pattern_fuction.c: 1621: LED7_State=0;
	clrf	(_LED7_State)
	line	1622
;pattern_fuction.c: 1622: LED8_State=0;
	clrf	(_LED8_State)
	line	1623
	
l14811:	
;pattern_fuction.c: 1623: LED9_State=1;
	clrf	(_LED9_State)
	incf	(_LED9_State),f
	line	1624
;pattern_fuction.c: 1624: LED10_State=0;
	clrf	(_LED10_State)
	line	1625
;pattern_fuction.c: 1625: }
	goto	l5561
	line	1626
	
l14813:	
;pattern_fuction.c: 1626: else if(_420_z)
	movf	(__420_z),w
	skipz
	goto	u8920
	goto	l5523
u8920:
	line	1628
	
l14815:	
;pattern_fuction.c: 1627: {
;pattern_fuction.c: 1628: LED7_State=0;
	clrf	(_LED7_State)
	line	1629
;pattern_fuction.c: 1629: LED8_State=0;
	clrf	(_LED8_State)
	line	1630
;pattern_fuction.c: 1630: LED9_State=0;
	clrf	(_LED9_State)
	line	1631
	
l14817:	
;pattern_fuction.c: 1631: LED10_State=1;
	clrf	(_LED10_State)
	incf	(_LED10_State),f
	goto	l5561
	line	1635
	
l14819:	
;pattern_fuction.c: 1635: Pattern_LED_Crt=5;
	movlw	05h
	movwf	(_Pattern_LED_Crt)^080h
	clrf	(_Pattern_LED_Crt+1)^080h
	line	1636
;pattern_fuction.c: 1636: break;
	goto	l5561
	line	1638
;pattern_fuction.c: 1638: case 5:
	
l5546:	
	line	1639
;pattern_fuction.c: 1639: BG_LED_State=1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_BG_LED_State)
	incf	(_BG_LED_State),f
	line	1640
	
l14821:	
;pattern_fuction.c: 1640: LED12_State=2;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_LED12_State)^080h
	line	1641
	
l14823:	
;pattern_fuction.c: 1641: LED12_Flash_Times=0;
	clrf	(_LED12_Flash_Times)^080h
	line	1642
	
l14825:	
;pattern_fuction.c: 1642: if(Regular)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Regular),w
	skipz
	goto	u8930
	goto	l14831
u8930:
	line	1644
	
l14827:	
;pattern_fuction.c: 1643: {
;pattern_fuction.c: 1644: LED1_State=2;
	movlw	(02h)
	movwf	(_LED1_State)
	line	1645
	
l14829:	
;pattern_fuction.c: 1645: LED1_Flash_Times=0;
	clrf	(_LED1_Flash_Times)
	line	1646
;pattern_fuction.c: 1646: }
	goto	l14849
	line	1648
	
l14831:	
;pattern_fuction.c: 1647: else
;pattern_fuction.c: 1648: if(Bold)
	movf	(_Bold),w
	skipz
	goto	u8940
	goto	l14837
u8940:
	line	1650
	
l14833:	
;pattern_fuction.c: 1649: {
;pattern_fuction.c: 1650: LED2_State=2;
	movlw	(02h)
	movwf	(_LED2_State)
	line	1651
	
l14835:	
;pattern_fuction.c: 1651: LED2_Flash_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LED2_Flash_Times)^080h
	line	1652
;pattern_fuction.c: 1652: }
	goto	l14849
	line	1654
	
l14837:	
;pattern_fuction.c: 1653: else
;pattern_fuction.c: 1654: if(Iced)
	movf	(_Iced),w
	skipz
	goto	u8950
	goto	l14843
u8950:
	line	1656
	
l14839:	
;pattern_fuction.c: 1655: {
;pattern_fuction.c: 1656: LED3_State=2;
	movlw	(02h)
	movwf	(_LED3_State)
	line	1657
	
l14841:	
;pattern_fuction.c: 1657: LED3_Flash_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LED3_Flash_Times)^080h
	line	1658
;pattern_fuction.c: 1658: }
	goto	l14849
	line	1660
	
l14843:	
;pattern_fuction.c: 1659: else
;pattern_fuction.c: 1660: if(Tea)
	movf	(_Tea),w
	skipz
	goto	u8960
	goto	l5550
u8960:
	line	1662
	
l14845:	
;pattern_fuction.c: 1661: {
;pattern_fuction.c: 1662: LED4_State=2;
	movlw	(02h)
	movwf	(_LED4_State)
	line	1663
	
l14847:	
;pattern_fuction.c: 1663: LED4_Flash_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LED4_Flash_Times)^080h
	goto	l14849
	line	1665
	
l5550:	
	
l14849:	
;pattern_fuction.c: 1664: }
;pattern_fuction.c: 1665: if(_80_z)
	bcf	status, 5	;RP0=0, select bank0
	movf	(__80_z),w
	skipz
	goto	u8970
	goto	l14855
u8970:
	line	1667
	
l14851:	
;pattern_fuction.c: 1666: {
;pattern_fuction.c: 1667: LED7_State=2;
	movlw	(02h)
	movwf	(_LED7_State)
	line	1668
	
l14853:	
;pattern_fuction.c: 1668: LED7_Flash_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LED7_Flash_Times)^080h
	line	1669
;pattern_fuction.c: 1669: }
	goto	l5561
	line	1671
	
l14855:	
;pattern_fuction.c: 1670: else
;pattern_fuction.c: 1671: if(_120_z)
	movf	(__120_z),w
	skipz
	goto	u8980
	goto	l14861
u8980:
	line	1673
	
l14857:	
;pattern_fuction.c: 1672: {
;pattern_fuction.c: 1673: LED8_State=2;
	movlw	(02h)
	movwf	(_LED8_State)
	line	1674
	
l14859:	
;pattern_fuction.c: 1674: LED8_Flash_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LED8_Flash_Times)^080h
	line	1675
;pattern_fuction.c: 1675: }
	goto	l5561
	line	1677
	
l14861:	
;pattern_fuction.c: 1676: else
;pattern_fuction.c: 1677: if(_210_z)
	movf	(__210_z),w
	skipz
	goto	u8990
	goto	l14867
u8990:
	line	1679
	
l14863:	
;pattern_fuction.c: 1678: {
;pattern_fuction.c: 1679: LED9_State=2;
	movlw	(02h)
	movwf	(_LED9_State)
	line	1680
	
l14865:	
;pattern_fuction.c: 1680: LED9_Flash_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LED9_Flash_Times)^080h
	line	1681
;pattern_fuction.c: 1681: }
	goto	l5561
	line	1683
	
l14867:	
;pattern_fuction.c: 1682: else
;pattern_fuction.c: 1683: if(_420_z)
	movf	(__420_z),w
	skipz
	goto	u9000
	goto	l5523
u9000:
	line	1685
	
l14869:	
;pattern_fuction.c: 1684: {
;pattern_fuction.c: 1685: LED10_State=2;
	movlw	(02h)
	movwf	(_LED10_State)
	line	1686
	
l14871:	
;pattern_fuction.c: 1686: LED10_Flash_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LED10_Flash_Times)^080h
	goto	l5561
	line	1480
	
l14875:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	bsf	status, 5	;RP0=1, select bank1
	movf (_Pattern_LED_Crt+1)^080h,w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l16481
	goto	l5561
	opt asmopt_on
	
l16481:	
; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 5
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           19    10 (average)
; direct_byte           26     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable            10     6 (fixed)
; spacedrange           18     9 (fixed)
; locatedrange           6     3 (fixed)
;	Chosen strategy is simple_byte

	movf (_Pattern_LED_Crt)^080h,w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l14699
	xorlw	1^0	; case 1
	skipnz
	goto	l14743
	xorlw	2^1	; case 2
	skipnz
	goto	l5525
	xorlw	3^2	; case 3
	skipnz
	goto	l14761
	xorlw	4^3	; case 4
	skipnz
	goto	l14819
	xorlw	5^4	; case 5
	skipnz
	goto	l5546
	goto	l5561
	opt asmopt_on

	line	1692
	
l5561:	
	return
	opt stack 0
GLOBAL	__end_of_LED_Crt
	__end_of_LED_Crt:
;; =============== function _LED_Crt ends ============

	signat	_LED_Crt,88
	global	_HOT_MAJOR_State_F
psect	text1293,local,class=CODE,delta=2
global __ptext1293
__ptext1293:

;; *************** function _HOT_MAJOR_State_F *****************
;; Defined at:
;;		line 595 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1293
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
	line	595
	global	__size_of_HOT_MAJOR_State_F
	__size_of_HOT_MAJOR_State_F	equ	__end_of_HOT_MAJOR_State_F-_HOT_MAJOR_State_F
	
_HOT_MAJOR_State_F:	
	opt	stack 4
; Regs used in _HOT_MAJOR_State_F: [wreg-fsr0h+status,2+status,0]
	line	596
	
l14671:	
;pattern_fuction.c: 596: switch(HOT_MAJOR_State)
	goto	l14695
	line	598
;pattern_fuction.c: 597: {
;pattern_fuction.c: 598: case 0:
	
l5321:	
	line	599
;pattern_fuction.c: 599: RA6=0;
	bcf	(46/8),(46)&7
	line	600
;pattern_fuction.c: 600: break;
	goto	l5330
	line	601
;pattern_fuction.c: 601: case 1:
	
l5323:	
	line	602
;pattern_fuction.c: 602: RA6=1;
	bsf	(46/8),(46)&7
	line	603
;pattern_fuction.c: 603: break;
	goto	l5330
	line	604
;pattern_fuction.c: 604: case 2:
	
l5324:	
	line	605
;pattern_fuction.c: 605: RA6=1;
	bsf	(46/8),(46)&7
	line	606
	
l14673:	
;pattern_fuction.c: 606: if(++HOT_MAJOR_ON_Times>=250)
	bsf	status, 5	;RP0=1, select bank1
	incf	(_HOT_MAJOR_ON_Times)^080h,f
	skipnz
	incf	(_HOT_MAJOR_ON_Times+1)^080h,f
	movlw	high(0FAh)
	subwf	((_HOT_MAJOR_ON_Times+1)^080h),w
	movlw	low(0FAh)
	skipnz
	subwf	((_HOT_MAJOR_ON_Times)^080h),w
	skipc
	goto	u8751
	goto	u8750
u8751:
	goto	l14681
u8750:
	line	608
	
l14675:	
;pattern_fuction.c: 607: {
;pattern_fuction.c: 608: HOT_MAJOR_ON_Times=0;
	clrf	(_HOT_MAJOR_ON_Times)^080h
	clrf	(_HOT_MAJOR_ON_Times+1)^080h
	line	609
	
l14677:	
;pattern_fuction.c: 609: if(HOT_MAJOR_ON_Time<255)
	movlw	high(0FFh)
	subwf	(_HOT_MAJOR_ON_Time+1)^080h,w
	movlw	low(0FFh)
	skipnz
	subwf	(_HOT_MAJOR_ON_Time)^080h,w
	skipnc
	goto	u8761
	goto	u8760
u8761:
	goto	l14681
u8760:
	line	610
	
l14679:	
;pattern_fuction.c: 610: HOT_MAJOR_ON_Time++;
	incf	(_HOT_MAJOR_ON_Time)^080h,f
	skipnz
	incf	(_HOT_MAJOR_ON_Time+1)^080h,f
	line	612
	
l14681:	
;pattern_fuction.c: 611: }
;pattern_fuction.c: 612: HOT_MAJOR_OFF_Time=0;
	clrf	(_HOT_MAJOR_OFF_Time)^080h
	clrf	(_HOT_MAJOR_OFF_Time+1)^080h
	line	613
;pattern_fuction.c: 613: break;
	goto	l5330
	line	615
;pattern_fuction.c: 615: case 3:
	
l5327:	
	line	616
;pattern_fuction.c: 616: RA6=0;
	bcf	(46/8),(46)&7
	line	617
	
l14683:	
;pattern_fuction.c: 617: if(++HOT_MAJOR_OFF_Times>=250)
	bsf	status, 5	;RP0=1, select bank1
	incf	(_HOT_MAJOR_OFF_Times)^080h,f
	skipnz
	incf	(_HOT_MAJOR_OFF_Times+1)^080h,f
	movlw	high(0FAh)
	subwf	((_HOT_MAJOR_OFF_Times+1)^080h),w
	movlw	low(0FAh)
	skipnz
	subwf	((_HOT_MAJOR_OFF_Times)^080h),w
	skipc
	goto	u8771
	goto	u8770
u8771:
	goto	l14691
u8770:
	line	619
	
l14685:	
;pattern_fuction.c: 618: {
;pattern_fuction.c: 619: HOT_MAJOR_OFF_Times=0;
	clrf	(_HOT_MAJOR_OFF_Times)^080h
	clrf	(_HOT_MAJOR_OFF_Times+1)^080h
	line	620
	
l14687:	
;pattern_fuction.c: 620: if(HOT_MAJOR_OFF_Time<255)
	movlw	high(0FFh)
	subwf	(_HOT_MAJOR_OFF_Time+1)^080h,w
	movlw	low(0FFh)
	skipnz
	subwf	(_HOT_MAJOR_OFF_Time)^080h,w
	skipnc
	goto	u8781
	goto	u8780
u8781:
	goto	l14691
u8780:
	line	621
	
l14689:	
;pattern_fuction.c: 621: HOT_MAJOR_OFF_Time++;
	incf	(_HOT_MAJOR_OFF_Time)^080h,f
	skipnz
	incf	(_HOT_MAJOR_OFF_Time+1)^080h,f
	line	623
	
l14691:	
;pattern_fuction.c: 622: }
;pattern_fuction.c: 623: HOT_MAJOR_ON_Time=0;
	clrf	(_HOT_MAJOR_ON_Time)^080h
	clrf	(_HOT_MAJOR_ON_Time+1)^080h
	line	624
;pattern_fuction.c: 624: break;
	goto	l5330
	line	596
	
l14695:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_HOT_MAJOR_State),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           20     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5321
	xorlw	1^0	; case 1
	skipnz
	goto	l5323
	xorlw	2^1	; case 2
	skipnz
	goto	l5324
	xorlw	3^2	; case 3
	skipnz
	goto	l5327
	goto	l5330
	opt asmopt_on

	line	628
	
l5330:	
	return
	opt stack 0
GLOBAL	__end_of_HOT_MAJOR_State_F
	__end_of_HOT_MAJOR_State_F:
;; =============== function _HOT_MAJOR_State_F ends ============

	signat	_HOT_MAJOR_State_F,88
	global	_Solenoid_State_F
psect	text1294,local,class=CODE,delta=2
global __ptext1294
__ptext1294:

;; *************** function _Solenoid_State_F *****************
;; Defined at:
;;		line 631 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1294
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
	line	631
	global	__size_of_Solenoid_State_F
	__size_of_Solenoid_State_F	equ	__end_of_Solenoid_State_F-_Solenoid_State_F
	
_Solenoid_State_F:	
	opt	stack 4
; Regs used in _Solenoid_State_F: [wreg-fsr0h+status,2+status,0]
	line	632
	
l14645:	
;pattern_fuction.c: 632: switch(Solenoid_State)
	goto	l14669
	line	634
;pattern_fuction.c: 633: {
;pattern_fuction.c: 634: case 0:
	
l5334:	
	line	635
;pattern_fuction.c: 635: RE2=0;
	bcf	(74/8),(74)&7
	line	636
;pattern_fuction.c: 636: break;
	goto	l5343
	line	637
;pattern_fuction.c: 637: case 1:
	
l5336:	
	line	638
;pattern_fuction.c: 638: RE2=1;
	bsf	(74/8),(74)&7
	line	639
;pattern_fuction.c: 639: break;
	goto	l5343
	line	640
;pattern_fuction.c: 640: case 2:
	
l5337:	
	line	641
;pattern_fuction.c: 641: RE2=1;
	bsf	(74/8),(74)&7
	line	642
	
l14647:	
;pattern_fuction.c: 642: if(Solenoid_ON_Times++>250)
	bsf	status, 5	;RP0=1, select bank1
	incf	(_Solenoid_ON_Times)^080h,f
	skipnz
	incf	(_Solenoid_ON_Times+1)^080h,f
	movlw	high(0FCh)
	subwf	((_Solenoid_ON_Times+1)^080h),w
	movlw	low(0FCh)
	skipnz
	subwf	((_Solenoid_ON_Times)^080h),w
	skipc
	goto	u8711
	goto	u8710
u8711:
	goto	l14655
u8710:
	line	644
	
l14649:	
;pattern_fuction.c: 643: {
;pattern_fuction.c: 644: Solenoid_ON_Times=0;
	clrf	(_Solenoid_ON_Times)^080h
	clrf	(_Solenoid_ON_Times+1)^080h
	line	645
	
l14651:	
;pattern_fuction.c: 645: if(Solenoid_ON_Time<65535)
	incf	(_Solenoid_ON_Time)^080h,w
	skipnz
	incf	(_Solenoid_ON_Time+1)^080h,w

	skipnz
	goto	u8721
	goto	u8720
u8721:
	goto	l14655
u8720:
	line	646
	
l14653:	
;pattern_fuction.c: 646: Solenoid_ON_Time++;
	incf	(_Solenoid_ON_Time)^080h,f
	skipnz
	incf	(_Solenoid_ON_Time+1)^080h,f
	line	648
	
l14655:	
;pattern_fuction.c: 647: }
;pattern_fuction.c: 648: Solenoid_OFF_Time=0;
	clrf	(_Solenoid_OFF_Time)^080h
	clrf	(_Solenoid_OFF_Time+1)^080h
	line	649
;pattern_fuction.c: 649: break;
	goto	l5343
	line	650
;pattern_fuction.c: 650: case 3:
	
l5340:	
	line	651
;pattern_fuction.c: 651: RE2=0;
	bcf	(74/8),(74)&7
	line	652
	
l14657:	
;pattern_fuction.c: 652: if(++Solenoid_OFF_Times>=250)
	bsf	status, 5	;RP0=1, select bank1
	incf	(_Solenoid_OFF_Times)^080h,f
	skipnz
	incf	(_Solenoid_OFF_Times+1)^080h,f
	movlw	high(0FAh)
	subwf	((_Solenoid_OFF_Times+1)^080h),w
	movlw	low(0FAh)
	skipnz
	subwf	((_Solenoid_OFF_Times)^080h),w
	skipc
	goto	u8731
	goto	u8730
u8731:
	goto	l14665
u8730:
	line	654
	
l14659:	
;pattern_fuction.c: 653: {
;pattern_fuction.c: 654: Solenoid_OFF_Times=0;
	clrf	(_Solenoid_OFF_Times)^080h
	clrf	(_Solenoid_OFF_Times+1)^080h
	line	655
	
l14661:	
;pattern_fuction.c: 655: if(Solenoid_OFF_Time<65535)
	incf	(_Solenoid_OFF_Time)^080h,w
	skipnz
	incf	(_Solenoid_OFF_Time+1)^080h,w

	skipnz
	goto	u8741
	goto	u8740
u8741:
	goto	l14665
u8740:
	line	656
	
l14663:	
;pattern_fuction.c: 656: Solenoid_OFF_Time++;
	incf	(_Solenoid_OFF_Time)^080h,f
	skipnz
	incf	(_Solenoid_OFF_Time+1)^080h,f
	line	659
	
l14665:	
;pattern_fuction.c: 657: }
;pattern_fuction.c: 659: Solenoid_ON_Time=0;
	clrf	(_Solenoid_ON_Time)^080h
	clrf	(_Solenoid_ON_Time+1)^080h
	line	660
;pattern_fuction.c: 660: break;
	goto	l5343
	line	632
	
l14669:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Solenoid_State),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           20     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5334
	xorlw	1^0	; case 1
	skipnz
	goto	l5336
	xorlw	2^1	; case 2
	skipnz
	goto	l5337
	xorlw	3^2	; case 3
	skipnz
	goto	l5340
	goto	l5343
	opt asmopt_on

	line	662
	
l5343:	
	return
	opt stack 0
GLOBAL	__end_of_Solenoid_State_F
	__end_of_Solenoid_State_F:
;; =============== function _Solenoid_State_F ends ============

	signat	_Solenoid_State_F,88
	global	_LED_State
psect	text1295,local,class=CODE,delta=2
global __ptext1295
__ptext1295:

;; *************** function _LED_State *****************
;; Defined at:
;;		line 54 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1295
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
	line	54
	global	__size_of_LED_State
	__size_of_LED_State	equ	__end_of_LED_State-_LED_State
	
_LED_State:	
	opt	stack 4
; Regs used in _LED_State: [wreg-fsr0h+status,2+status,0]
	line	56
	
l14407:	
;pattern_fuction.c: 56: switch(BG_LED_State)
	goto	l14433
	line	58
;pattern_fuction.c: 57: {
;pattern_fuction.c: 58: case 0:
	
l5134:	
	line	59
;pattern_fuction.c: 59: Temp_595[0]&=~(1<<6);
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_Temp_595)+(6/8),(6)&7	;volatile
	line	60
;pattern_fuction.c: 60: break;
	goto	l14447
	line	61
;pattern_fuction.c: 61: case 1:
	
l5136:	
	line	62
;pattern_fuction.c: 62: Temp_595[0] |=1<<6;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_Temp_595)+(6/8),(6)&7	;volatile
	line	63
;pattern_fuction.c: 63: break;
	goto	l14447
	line	66
	
l14409:	
;pattern_fuction.c: 66: if(LED_Flash_HZ>=125)
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8201
	goto	u8200
u8201:
	goto	l14447
u8200:
	line	68
	
l14411:	
;pattern_fuction.c: 67: {
;pattern_fuction.c: 68: if(BG_LED_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_BG_LED_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8211
	goto	u8210
u8211:
	goto	l14415
u8210:
	line	69
	
l14413:	
;pattern_fuction.c: 69: BG_LED_Flash_Times++;
	incf	(_BG_LED_Flash_Times)^080h,f
	line	71
	
l14415:	
;pattern_fuction.c: 71: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8221
	goto	u8220
u8221:
	goto	l5136
u8220:
	goto	l5134
	line	82
;pattern_fuction.c: 82: case 3:
	
l5142:	
	line	83
;pattern_fuction.c: 83: Temp_595[0] |=1<<6;
	bsf	(_Temp_595)+(6/8),(6)&7	;volatile
	line	84
	
l14419:	
;pattern_fuction.c: 84: if(++BG_LED_ON_Times>=250)
	bsf	status, 5	;RP0=1, select bank1
	incf	(_BG_LED_ON_Times)^080h,f
	skipnz
	incf	(_BG_LED_ON_Times+1)^080h,f
	movlw	high(0FAh)
	subwf	((_BG_LED_ON_Times+1)^080h),w
	movlw	low(0FAh)
	skipnz
	subwf	((_BG_LED_ON_Times)^080h),w
	skipc
	goto	u8231
	goto	u8230
u8231:
	goto	l14447
u8230:
	line	86
	
l14421:	
;pattern_fuction.c: 85: {
;pattern_fuction.c: 86: BG_LED_ON_Times=0;
	clrf	(_BG_LED_ON_Times)^080h
	clrf	(_BG_LED_ON_Times+1)^080h
	line	87
	
l14423:	
;pattern_fuction.c: 87: if(BG_LED_ON_Time<255)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_BG_LED_ON_Time),w
	xorlw	0FFh
	skipnz
	goto	u8241
	goto	u8240
u8241:
	goto	l14427
u8240:
	line	88
	
l14425:	
;pattern_fuction.c: 88: BG_LED_ON_Time++;
	incf	(_BG_LED_ON_Time),f
	line	89
	
l14427:	
;pattern_fuction.c: 89: if(BG_LED_ON_Time)
	movf	(_BG_LED_ON_Time),w
	skipz
	goto	u8250
	goto	l5134
u8250:
	goto	l5136
	line	56
	
l14433:	
	movf	(_BG_LED_State),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           20     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5134
	xorlw	1^0	; case 1
	skipnz
	goto	l5136
	xorlw	2^1	; case 2
	skipnz
	goto	l14409
	xorlw	3^2	; case 3
	skipnz
	goto	l5142
	goto	l14447
	opt asmopt_on

	line	102
;pattern_fuction.c: 101: {
;pattern_fuction.c: 102: case 0: Temp_595[1]&=~(1<<6);
	
l5148:	
	bcf	0+(_Temp_595)+01h+(6/8),(6)&7	;volatile
	line	103
;pattern_fuction.c: 103: break;
	goto	l14461
	line	104
;pattern_fuction.c: 104: case 1: Temp_595[1]|=1<<6;
	
l5150:	
	bsf	0+(_Temp_595)+01h+(6/8),(6)&7	;volatile
	line	105
;pattern_fuction.c: 105: break;
	goto	l14461
	line	107
	
l14435:	
;pattern_fuction.c: 107: if(LED_Flash_HZ>=125)
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8261
	goto	u8260
u8261:
	goto	l14461
u8260:
	line	109
	
l14437:	
;pattern_fuction.c: 108: {
;pattern_fuction.c: 109: if(ANNULUS_LIGHT_Flash_Times<255)
	movf	(_ANNULUS_LIGHT_Flash_Times),w
	xorlw	0FFh
	skipnz
	goto	u8271
	goto	u8270
u8271:
	goto	l14441
u8270:
	line	110
	
l14439:	
;pattern_fuction.c: 110: ANNULUS_LIGHT_Flash_Times++;
	incf	(_ANNULUS_LIGHT_Flash_Times),f
	line	112
	
l14441:	
;pattern_fuction.c: 112: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8281
	goto	u8280
u8281:
	goto	l5150
u8280:
	goto	l5148
	line	100
	
l14447:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ANNULUS_LIGHT_State),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5148
	xorlw	1^0	; case 1
	skipnz
	goto	l5150
	xorlw	2^1	; case 2
	skipnz
	goto	l14435
	goto	l14461
	opt asmopt_on

	line	126
;pattern_fuction.c: 125: {
;pattern_fuction.c: 126: case 0: Temp_595[1]&=~(1<<7);
	
l5157:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_Temp_595)+01h+(7/8),(7)&7	;volatile
	line	127
;pattern_fuction.c: 127: break;
	goto	l14475
	line	128
;pattern_fuction.c: 128: case 1: Temp_595[1]|=1<<7;
	
l5159:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	0+(_Temp_595)+01h+(7/8),(7)&7	;volatile
	line	129
;pattern_fuction.c: 129: break;
	goto	l14475
	line	131
	
l14449:	
;pattern_fuction.c: 131: if(LED_Flash_HZ>=125)
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8291
	goto	u8290
u8291:
	goto	l14475
u8290:
	line	133
	
l14451:	
;pattern_fuction.c: 132: {
;pattern_fuction.c: 133: if(SHOW_LIGHT_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_SHOW_LIGHT_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8301
	goto	u8300
u8301:
	goto	l14455
u8300:
	line	134
	
l14453:	
;pattern_fuction.c: 134: SHOW_LIGHT_Flash_Times++;
	incf	(_SHOW_LIGHT_Flash_Times)^080h,f
	line	136
	
l14455:	
;pattern_fuction.c: 136: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8311
	goto	u8310
u8311:
	goto	l5159
u8310:
	goto	l5157
	line	124
	
l14461:	
	movf	(_SHOW_LIGHT_State),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5157
	xorlw	1^0	; case 1
	skipnz
	goto	l5159
	xorlw	2^1	; case 2
	skipnz
	goto	l14449
	goto	l14475
	opt asmopt_on

	line	150
;pattern_fuction.c: 149: {
;pattern_fuction.c: 150: case 0: Temp_595[0]|=1<<1;
	
l5166:	
	bsf	(_Temp_595)+(1/8),(1)&7	;volatile
	line	151
;pattern_fuction.c: 151: break;
	goto	l14489
	line	152
;pattern_fuction.c: 152: case 1: Temp_595[0]&=~(1<<1);
	
l5168:	
	bcf	(_Temp_595)+(1/8),(1)&7	;volatile
	line	153
;pattern_fuction.c: 153: break;
	goto	l14489
	line	155
	
l14463:	
;pattern_fuction.c: 155: if(LED_Flash_HZ>=125)
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8321
	goto	u8320
u8321:
	goto	l14489
u8320:
	line	157
	
l14465:	
;pattern_fuction.c: 156: {
;pattern_fuction.c: 157: if(LED1_Flash_Times<255)
	movf	(_LED1_Flash_Times),w
	xorlw	0FFh
	skipnz
	goto	u8331
	goto	u8330
u8331:
	goto	l14469
u8330:
	line	158
	
l14467:	
;pattern_fuction.c: 158: LED1_Flash_Times++;
	incf	(_LED1_Flash_Times),f
	line	160
	
l14469:	
;pattern_fuction.c: 160: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8341
	goto	u8340
u8341:
	goto	l5168
u8340:
	goto	l5166
	line	148
	
l14475:	
	movf	(_LED1_State),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5166
	xorlw	1^0	; case 1
	skipnz
	goto	l5168
	xorlw	2^1	; case 2
	skipnz
	goto	l14463
	goto	l14489
	opt asmopt_on

	line	174
;pattern_fuction.c: 173: {
;pattern_fuction.c: 174: case 0: Temp_595[0]|=1<<0;
	
l5175:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_Temp_595)+(0/8),(0)&7	;volatile
	line	175
;pattern_fuction.c: 175: break;
	goto	l14503
	line	176
;pattern_fuction.c: 176: case 1: Temp_595[0]&=~(1<<0);
	
l5177:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_Temp_595)+(0/8),(0)&7	;volatile
	line	177
;pattern_fuction.c: 177: break;
	goto	l14503
	line	178
	
l14477:	
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8351
	goto	u8350
u8351:
	goto	l14503
u8350:
	line	180
	
l14479:	
;pattern_fuction.c: 179: {
;pattern_fuction.c: 180: if(LED2_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LED2_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8361
	goto	u8360
u8361:
	goto	l14483
u8360:
	line	181
	
l14481:	
;pattern_fuction.c: 181: LED2_Flash_Times++;
	incf	(_LED2_Flash_Times)^080h,f
	line	183
	
l14483:	
;pattern_fuction.c: 183: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8371
	goto	u8370
u8371:
	goto	l5177
u8370:
	goto	l5175
	line	172
	
l14489:	
	movf	(_LED2_State),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5175
	xorlw	1^0	; case 1
	skipnz
	goto	l5177
	xorlw	2^1	; case 2
	skipnz
	goto	l14477
	goto	l14503
	opt asmopt_on

	line	196
;pattern_fuction.c: 195: {
;pattern_fuction.c: 196: case 0: Temp_595[0]|=1<<5;
	
l5184:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_Temp_595)+(5/8),(5)&7	;volatile
	line	197
;pattern_fuction.c: 197: break;
	goto	l14517
	line	198
;pattern_fuction.c: 198: case 1: Temp_595[0]&=~(1<<5);
	
l5186:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_Temp_595)+(5/8),(5)&7	;volatile
	line	199
;pattern_fuction.c: 199: break;
	goto	l14517
	line	200
	
l14491:	
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8381
	goto	u8380
u8381:
	goto	l14517
u8380:
	line	202
	
l14493:	
;pattern_fuction.c: 201: {
;pattern_fuction.c: 202: if(LED3_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LED3_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8391
	goto	u8390
u8391:
	goto	l14497
u8390:
	line	203
	
l14495:	
;pattern_fuction.c: 203: LED3_Flash_Times++;
	incf	(_LED3_Flash_Times)^080h,f
	line	205
	
l14497:	
;pattern_fuction.c: 205: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8401
	goto	u8400
u8401:
	goto	l5186
u8400:
	goto	l5184
	line	194
	
l14503:	
	movf	(_LED3_State),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5184
	xorlw	1^0	; case 1
	skipnz
	goto	l5186
	xorlw	2^1	; case 2
	skipnz
	goto	l14491
	goto	l14517
	opt asmopt_on

	line	218
;pattern_fuction.c: 217: {
;pattern_fuction.c: 218: case 0: Temp_595[0]|=1<<4;
	
l5193:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_Temp_595)+(4/8),(4)&7	;volatile
	line	219
;pattern_fuction.c: 219: break;
	goto	l14535
	line	220
;pattern_fuction.c: 220: case 1: Temp_595[0]&=~(1<<4);
	
l5195:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_Temp_595)+(4/8),(4)&7	;volatile
	line	221
;pattern_fuction.c: 221: break;
	goto	l14535
	line	222
	
l14505:	
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8411
	goto	u8410
u8411:
	goto	l14535
u8410:
	line	224
	
l14507:	
;pattern_fuction.c: 223: {
;pattern_fuction.c: 224: if(LED4_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LED4_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8421
	goto	u8420
u8421:
	goto	l14511
u8420:
	line	225
	
l14509:	
;pattern_fuction.c: 225: LED4_Flash_Times++;
	incf	(_LED4_Flash_Times)^080h,f
	line	227
	
l14511:	
;pattern_fuction.c: 227: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8431
	goto	u8430
u8431:
	goto	l5195
u8430:
	goto	l5193
	line	216
	
l14517:	
	movf	(_LED4_State),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5193
	xorlw	1^0	; case 1
	skipnz
	goto	l5195
	xorlw	2^1	; case 2
	skipnz
	goto	l14505
	goto	l14535
	opt asmopt_on

	line	240
;pattern_fuction.c: 239: {
;pattern_fuction.c: 240: case 0: Temp_595[0]|=1<<3;
	
l5202:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_Temp_595)+(3/8),(3)&7	;volatile
	line	241
;pattern_fuction.c: 241: break;
	goto	l14553
	line	242
;pattern_fuction.c: 242: case 1: Temp_595[0]&=~(1<<3);
	
l5204:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_Temp_595)+(3/8),(3)&7	;volatile
	line	243
;pattern_fuction.c: 243: break;
	goto	l14553
	line	244
	
l14519:	
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8441
	goto	u8440
u8441:
	goto	l14553
u8440:
	line	246
	
l14521:	
;pattern_fuction.c: 245: {
;pattern_fuction.c: 246: if(LED5_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LED5_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8451
	goto	u8450
u8451:
	goto	l14525
u8450:
	line	247
	
l14523:	
;pattern_fuction.c: 247: LED5_Flash_Times++;
	incf	(_LED5_Flash_Times)^080h,f
	line	249
	
l14525:	
;pattern_fuction.c: 249: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8461
	goto	u8460
u8461:
	goto	l5204
u8460:
	goto	l5202
	line	259
;pattern_fuction.c: 259: case 3:
	
l5210:	
	line	260
;pattern_fuction.c: 260: Temp_595[0]&=~(1<<3);
	bcf	(_Temp_595)+(3/8),(3)&7	;volatile
	line	261
	
l14529:	
;pattern_fuction.c: 261: if(LED5_On_Times<65535)
	bsf	status, 5	;RP0=1, select bank1
	incf	(_LED5_On_Times)^080h,w
	skipnz
	incf	(_LED5_On_Times+1)^080h,w

	skipnz
	goto	u8471
	goto	u8470
u8471:
	goto	l14553
u8470:
	line	262
	
l14531:	
;pattern_fuction.c: 262: LED5_On_Times++;
	incf	(_LED5_On_Times)^080h,f
	skipnz
	incf	(_LED5_On_Times+1)^080h,f
	goto	l14553
	line	238
	
l14535:	
	movf	(_LED5_State),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           20     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5202
	xorlw	1^0	; case 1
	skipnz
	goto	l5204
	xorlw	2^1	; case 2
	skipnz
	goto	l14519
	xorlw	3^2	; case 3
	skipnz
	goto	l5210
	goto	l14553
	opt asmopt_on

	line	268
;pattern_fuction.c: 267: {
;pattern_fuction.c: 268: case 0: Temp_595[0]|=1<<2;
	
l5213:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_Temp_595)+(2/8),(2)&7	;volatile
	line	269
;pattern_fuction.c: 269: break;
	goto	l14567
	line	270
;pattern_fuction.c: 270: case 1: Temp_595[0]&=~(1<<2);
	
l5215:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_Temp_595)+(2/8),(2)&7	;volatile
	line	271
;pattern_fuction.c: 271: break;
	goto	l14567
	line	272
	
l14537:	
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8481
	goto	u8480
u8481:
	goto	l14567
u8480:
	line	274
	
l14539:	
;pattern_fuction.c: 273: {
;pattern_fuction.c: 274: if(LED6_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LED6_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8491
	goto	u8490
u8491:
	goto	l14543
u8490:
	line	275
	
l14541:	
;pattern_fuction.c: 275: LED6_Flash_Times++;
	incf	(_LED6_Flash_Times)^080h,f
	line	277
	
l14543:	
;pattern_fuction.c: 277: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8501
	goto	u8500
u8501:
	goto	l5215
u8500:
	goto	l5213
	line	287
;pattern_fuction.c: 287: case 3:
	
l5221:	
	line	288
;pattern_fuction.c: 288: Temp_595[0]&=~(1<<2);
	bcf	(_Temp_595)+(2/8),(2)&7	;volatile
	line	289
	
l14547:	
;pattern_fuction.c: 289: if(LED6_On_Times<65535)
	bsf	status, 5	;RP0=1, select bank1
	incf	(_LED6_On_Times)^080h,w
	skipnz
	incf	(_LED6_On_Times+1)^080h,w

	skipnz
	goto	u8511
	goto	u8510
u8511:
	goto	l14567
u8510:
	line	291
	
l14549:	
;pattern_fuction.c: 290: {
;pattern_fuction.c: 291: LED6_On_Times++;
	incf	(_LED6_On_Times)^080h,f
	skipnz
	incf	(_LED6_On_Times+1)^080h,f
	goto	l14567
	line	266
	
l14553:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_LED6_State),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           20     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5213
	xorlw	1^0	; case 1
	skipnz
	goto	l5215
	xorlw	2^1	; case 2
	skipnz
	goto	l14537
	xorlw	3^2	; case 3
	skipnz
	goto	l5221
	goto	l14567
	opt asmopt_on

	line	298
;pattern_fuction.c: 297: {
;pattern_fuction.c: 298: case 0: Temp_595[1]|=1<<5;
	
l5224:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	0+(_Temp_595)+01h+(5/8),(5)&7	;volatile
	line	299
;pattern_fuction.c: 299: break;
	goto	l14581
	line	300
;pattern_fuction.c: 300: case 1: Temp_595[1]&=~(1<<5);
	
l5226:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_Temp_595)+01h+(5/8),(5)&7	;volatile
	line	301
;pattern_fuction.c: 301: break;
	goto	l14581
	line	302
	
l14555:	
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8521
	goto	u8520
u8521:
	goto	l14581
u8520:
	line	304
	
l14557:	
;pattern_fuction.c: 303: {
;pattern_fuction.c: 304: if(LED7_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LED7_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8531
	goto	u8530
u8531:
	goto	l14561
u8530:
	line	305
	
l14559:	
;pattern_fuction.c: 305: LED7_Flash_Times++;
	incf	(_LED7_Flash_Times)^080h,f
	line	307
	
l14561:	
;pattern_fuction.c: 307: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8541
	goto	u8540
u8541:
	goto	l5226
u8540:
	goto	l5224
	line	296
	
l14567:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_LED7_State),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5224
	xorlw	1^0	; case 1
	skipnz
	goto	l5226
	xorlw	2^1	; case 2
	skipnz
	goto	l14555
	goto	l14581
	opt asmopt_on

	line	320
;pattern_fuction.c: 319: {
;pattern_fuction.c: 320: case 0: Temp_595[1]|=1<<4;
	
l5233:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	0+(_Temp_595)+01h+(4/8),(4)&7	;volatile
	line	321
;pattern_fuction.c: 321: break;
	goto	l14595
	line	322
;pattern_fuction.c: 322: case 1: Temp_595[1]&=~(1<<4);
	
l5235:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_Temp_595)+01h+(4/8),(4)&7	;volatile
	line	323
;pattern_fuction.c: 323: break;
	goto	l14595
	line	324
	
l14569:	
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8551
	goto	u8550
u8551:
	goto	l14595
u8550:
	line	326
	
l14571:	
;pattern_fuction.c: 325: {
;pattern_fuction.c: 326: if(LED8_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LED8_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8561
	goto	u8560
u8561:
	goto	l14575
u8560:
	line	327
	
l14573:	
;pattern_fuction.c: 327: LED8_Flash_Times++;
	incf	(_LED8_Flash_Times)^080h,f
	line	329
	
l14575:	
;pattern_fuction.c: 329: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8571
	goto	u8570
u8571:
	goto	l5235
u8570:
	goto	l5233
	line	318
	
l14581:	
	movf	(_LED8_State),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5233
	xorlw	1^0	; case 1
	skipnz
	goto	l5235
	xorlw	2^1	; case 2
	skipnz
	goto	l14569
	goto	l14595
	opt asmopt_on

	line	342
;pattern_fuction.c: 341: {
;pattern_fuction.c: 342: case 0: Temp_595[1]|=1<<3;
	
l5242:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	0+(_Temp_595)+01h+(3/8),(3)&7	;volatile
	line	343
;pattern_fuction.c: 343: break;
	goto	l14609
	line	344
;pattern_fuction.c: 344: case 1: Temp_595[1]&=~(1<<3);
	
l5244:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_Temp_595)+01h+(3/8),(3)&7	;volatile
	line	345
;pattern_fuction.c: 345: break;
	goto	l14609
	line	346
	
l14583:	
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8581
	goto	u8580
u8581:
	goto	l14609
u8580:
	line	348
	
l14585:	
;pattern_fuction.c: 347: {
;pattern_fuction.c: 348: if(LED9_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LED9_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8591
	goto	u8590
u8591:
	goto	l14589
u8590:
	line	349
	
l14587:	
;pattern_fuction.c: 349: LED9_Flash_Times++;
	incf	(_LED9_Flash_Times)^080h,f
	line	351
	
l14589:	
;pattern_fuction.c: 351: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8601
	goto	u8600
u8601:
	goto	l5244
u8600:
	goto	l5242
	line	340
	
l14595:	
	movf	(_LED9_State),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5242
	xorlw	1^0	; case 1
	skipnz
	goto	l5244
	xorlw	2^1	; case 2
	skipnz
	goto	l14583
	goto	l14609
	opt asmopt_on

	line	364
;pattern_fuction.c: 363: {
;pattern_fuction.c: 364: case 0: Temp_595[1]|=1<<2;
	
l5251:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	0+(_Temp_595)+01h+(2/8),(2)&7	;volatile
	line	365
;pattern_fuction.c: 365: break;
	goto	l14623
	line	366
;pattern_fuction.c: 366: case 1: Temp_595[1]&=~(1<<2);
	
l5253:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_Temp_595)+01h+(2/8),(2)&7	;volatile
	line	367
;pattern_fuction.c: 367: break;
	goto	l14623
	line	368
	
l14597:	
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8611
	goto	u8610
u8611:
	goto	l14623
u8610:
	line	370
	
l14599:	
;pattern_fuction.c: 369: {
;pattern_fuction.c: 370: if(LED10_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LED10_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8621
	goto	u8620
u8621:
	goto	l14603
u8620:
	line	371
	
l14601:	
;pattern_fuction.c: 371: LED10_Flash_Times++;
	incf	(_LED10_Flash_Times)^080h,f
	line	373
	
l14603:	
;pattern_fuction.c: 373: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8631
	goto	u8630
u8631:
	goto	l5253
u8630:
	goto	l5251
	line	362
	
l14609:	
	movf	(_LED10_State),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5251
	xorlw	1^0	; case 1
	skipnz
	goto	l5253
	xorlw	2^1	; case 2
	skipnz
	goto	l14597
	goto	l14623
	opt asmopt_on

	line	386
;pattern_fuction.c: 385: {
;pattern_fuction.c: 386: case 0: Temp_595[1]|=1<<1;
	
l5260:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	0+(_Temp_595)+01h+(1/8),(1)&7	;volatile
	line	387
;pattern_fuction.c: 387: break;
	goto	l14637
	line	388
;pattern_fuction.c: 388: case 1: Temp_595[1]&=~(1<<1);
	
l5262:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_Temp_595)+01h+(1/8),(1)&7	;volatile
	line	389
;pattern_fuction.c: 389: break;
	goto	l14637
	line	390
	
l14611:	
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8641
	goto	u8640
u8641:
	goto	l14637
u8640:
	line	392
	
l14613:	
;pattern_fuction.c: 391: {
;pattern_fuction.c: 392: if(LED11_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LED11_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8651
	goto	u8650
u8651:
	goto	l14617
u8650:
	line	393
	
l14615:	
;pattern_fuction.c: 393: LED11_Flash_Times++;
	incf	(_LED11_Flash_Times)^080h,f
	line	395
	
l14617:	
;pattern_fuction.c: 395: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8661
	goto	u8660
u8661:
	goto	l5262
u8660:
	goto	l5260
	line	384
	
l14623:	
	movf	(_LED11_State),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5260
	xorlw	1^0	; case 1
	skipnz
	goto	l5262
	xorlw	2^1	; case 2
	skipnz
	goto	l14611
	goto	l14637
	opt asmopt_on

	line	408
;pattern_fuction.c: 407: {
;pattern_fuction.c: 408: case 0: Temp_595[1]|=1<<0;
	
l5269:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	0+(_Temp_595)+01h+(0/8),(0)&7	;volatile
	line	409
;pattern_fuction.c: 409: break;
	goto	l14639
	line	410
;pattern_fuction.c: 410: case 1: Temp_595[1]&=~(1<<0);
	
l5271:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_Temp_595)+01h+(0/8),(0)&7	;volatile
	line	411
;pattern_fuction.c: 411: break;
	goto	l14639
	line	412
	
l14625:	
	movlw	(07Dh)
	subwf	(_LED_Flash_HZ),w
	skipc
	goto	u8671
	goto	u8670
u8671:
	goto	l14639
u8670:
	line	414
	
l14627:	
;pattern_fuction.c: 413: {
;pattern_fuction.c: 414: if(LED12_Flash_Times<255)
	movf	(_LED12_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8681
	goto	u8680
u8681:
	goto	l14631
u8680:
	line	415
	
l14629:	
;pattern_fuction.c: 415: LED12_Flash_Times++;
	incf	(_LED12_Flash_Times)^080h,f
	line	417
	
l14631:	
;pattern_fuction.c: 417: if(LED_Flash_Bool)
	btfss	(_LED_Flash_Bool/8),(_LED_Flash_Bool)&7
	goto	u8691
	goto	u8690
u8691:
	goto	l5271
u8690:
	goto	l5269
	line	406
	
l14637:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LED12_State)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           17     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l5269
	xorlw	1^0	; case 1
	skipnz
	goto	l5271
	xorlw	2^1	; case 2
	skipnz
	goto	l14625
	goto	l14639
	opt asmopt_on

	line	428
	
l14639:	
;pattern_fuction.c: 428: if(LED_Flash_HZ++>=125)
	movlw	(07Eh)
	incf	(_LED_Flash_HZ),f
	subwf	((_LED_Flash_HZ)),w
	skipc
	goto	u8701
	goto	u8700
u8701:
	goto	l5278
u8700:
	line	430
	
l14641:	
;pattern_fuction.c: 429: {
;pattern_fuction.c: 430: LED_Flash_HZ=0;
	clrf	(_LED_Flash_HZ)
	line	431
	
l14643:	
;pattern_fuction.c: 431: LED_Flash_Bool=!LED_Flash_Bool;
	movlw	1<<((_LED_Flash_Bool)&7)
	xorwf	((_LED_Flash_Bool)/8),f
	line	434
	
l5278:	
	return
	opt stack 0
GLOBAL	__end_of_LED_State
	__end_of_LED_State:
;; =============== function _LED_State ends ============

	signat	_LED_State,88
	global	_CheckBuzzer
psect	text1296,local,class=CODE,delta=2
global __ptext1296
__ptext1296:

;; *************** function _CheckBuzzer *****************
;; Defined at:
;;		line 11 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1296
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
	line	11
	global	__size_of_CheckBuzzer
	__size_of_CheckBuzzer	equ	__end_of_CheckBuzzer-_CheckBuzzer
	
_CheckBuzzer:	
	opt	stack 4
; Regs used in _CheckBuzzer: [wreg+status,2+status,0]
	line	12
	
l14389:	
;pattern_fuction.c: 12: if(Rbeep>0)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_Rbeep),w
	xorlw	80h
	addlw	-((01h)^80h)
	skipc
	goto	u8161
	goto	u8160
u8161:
	goto	l5120
u8160:
	line	14
	
l14391:	
;pattern_fuction.c: 13: {
;pattern_fuction.c: 14: if(--BuzzerTime<1)
	decfsz	(_BuzzerTime),f
	goto	u8171
	goto	u8170
u8171:
	goto	l5127
u8170:
	line	16
	
l14393:	
;pattern_fuction.c: 15: {
;pattern_fuction.c: 16: Buzzer_CFlag=!Buzzer_CFlag;
	movlw	1<<((_Buzzer_CFlag)&7)
	xorwf	((_Buzzer_CFlag)/8),f
	line	17
	
l14395:	
;pattern_fuction.c: 17: if(Buzzer_CFlag)
	btfss	(_Buzzer_CFlag/8),(_Buzzer_CFlag)&7
	goto	u8181
	goto	u8180
u8181:
	goto	l5122
u8180:
	line	19
	
l14397:	
;pattern_fuction.c: 18: {
;pattern_fuction.c: 19: Temp_595[0]|=1<<7;
	bsf	(_Temp_595)+(7/8),(7)&7	;volatile
	line	20
;pattern_fuction.c: 20: if(Rbeep&0x01)
	btfss	(_Rbeep),(0)&7
	goto	u8191
	goto	u8190
u8191:
	goto	l14401
u8190:
	line	22
	
l14399:	
;pattern_fuction.c: 21: {
;pattern_fuction.c: 22: BuzzerTime = 40;
	movlw	(028h)
	movwf	(_BuzzerTime)
	line	23
;pattern_fuction.c: 23: }
	goto	l5127
	line	26
	
l14401:	
;pattern_fuction.c: 24: else
;pattern_fuction.c: 25: {
;pattern_fuction.c: 26: BuzzerTime = 100;
	movlw	(064h)
	movwf	(_BuzzerTime)
	goto	l5127
	line	29
	
l5122:	
	line	31
;pattern_fuction.c: 29: else
;pattern_fuction.c: 30: {
;pattern_fuction.c: 31: Temp_595[0]&=~(1<<7);
	bcf	(_Temp_595)+(7/8),(7)&7	;volatile
	line	32
	
l14403:	
;pattern_fuction.c: 32: BuzzerTime = 25;
	movlw	(019h)
	movwf	(_BuzzerTime)
	line	33
	
l14405:	
;pattern_fuction.c: 33: Rbeep-=2;
	movlw	(-2)
	addwf	(_Rbeep),f
	goto	l5127
	line	37
	
l5120:	
	line	39
;pattern_fuction.c: 37: else
;pattern_fuction.c: 38: {
;pattern_fuction.c: 39: Temp_595[0]&=~(1<<7);
	bcf	(_Temp_595)+(7/8),(7)&7	;volatile
	line	41
	
l5127:	
	return
	opt stack 0
GLOBAL	__end_of_CheckBuzzer
	__end_of_CheckBuzzer:
;; =============== function _CheckBuzzer ends ============

	signat	_CheckBuzzer,88
	global	_LCD_FState
psect	text1297,local,class=CODE,delta=2
global __ptext1297
__ptext1297:

;; *************** function _LCD_FState *****************
;; Defined at:
;;		line 438 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1297
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
	line	438
	global	__size_of_LCD_FState
	__size_of_LCD_FState	equ	__end_of_LCD_FState-_LCD_FState
	
_LCD_FState:	
	opt	stack 4
; Regs used in _LCD_FState: [wreg-fsr0h+status,2+status,0]
	line	439
	
l14329:	
;pattern_fuction.c: 439: switch(LCD_State)
	goto	l14387
	line	460
	
l14331:	
;pattern_fuction.c: 460: if(++LCD_Flash_HZ>=125)
	movlw	(07Dh)
	incf	(_LCD_Flash_HZ)^080h,f
	subwf	((_LCD_Flash_HZ)^080h),w
	skipc
	goto	u8031
	goto	u8030
u8031:
	goto	l5304
u8030:
	line	462
	
l14333:	
;pattern_fuction.c: 461: {
;pattern_fuction.c: 462: LCD_Flash_HZ=0;
	clrf	(_LCD_Flash_HZ)^080h
	line	463
	
l14335:	
;pattern_fuction.c: 463: if(LCD_HOUR_Flash_Times<255)
	movf	(_LCD_HOUR_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8041
	goto	u8040
u8041:
	goto	l5286
u8040:
	line	465
	
l14337:	
;pattern_fuction.c: 464: {
;pattern_fuction.c: 465: LCD_HOUR_Flash_Times++;
	incf	(_LCD_HOUR_Flash_Times)^080h,f
	line	467
	
l14339:	
;pattern_fuction.c: 467: if(LCD_Flash_Bool)
	btfss	(_LCD_Flash_Bool/8),(_LCD_Flash_Bool)&7
	goto	u8051
	goto	u8050
u8051:
	goto	l14343
u8050:
	line	469
	
l14341:	
;pattern_fuction.c: 468: {
;pattern_fuction.c: 469: display[0]=0X00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_display)	;volatile
	line	470
;pattern_fuction.c: 470: display[1]=0X00;
	clrf	0+(_display)+01h	;volatile
	line	471
;pattern_fuction.c: 471: }
	goto	l5286
	line	474
	
l14343:	
;pattern_fuction.c: 472: else
;pattern_fuction.c: 473: {
;pattern_fuction.c: 474: display[0]=Display_Temp[0];
	movf	(_Display_Temp)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_display)	;volatile
	line	475
;pattern_fuction.c: 475: display[1]=Display_Temp[1];
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_Display_Temp)^080h+01h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_display)+01h	;volatile
	line	477
	
l5286:	
	line	479
;pattern_fuction.c: 476: }
;pattern_fuction.c: 477: }
;pattern_fuction.c: 479: if(LCD_MINUTE_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LCD_MINUTE_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8061
	goto	u8060
u8061:
	goto	l5289
u8060:
	line	481
	
l14345:	
;pattern_fuction.c: 480: {
;pattern_fuction.c: 481: LCD_MINUTE_Flash_Times++;
	incf	(_LCD_MINUTE_Flash_Times)^080h,f
	line	483
	
l14347:	
;pattern_fuction.c: 483: if(LCD_Flash_Bool)
	btfss	(_LCD_Flash_Bool/8),(_LCD_Flash_Bool)&7
	goto	u8071
	goto	u8070
u8071:
	goto	l14351
u8070:
	line	485
	
l14349:	
;pattern_fuction.c: 484: {
;pattern_fuction.c: 485: display[2]=0X00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	0+(_display)+02h	;volatile
	line	486
;pattern_fuction.c: 486: display[3]=0X00;
	clrf	0+(_display)+03h	;volatile
	line	488
;pattern_fuction.c: 488: }
	goto	l5289
	line	491
	
l14351:	
;pattern_fuction.c: 489: else
;pattern_fuction.c: 490: {
;pattern_fuction.c: 491: display[2]=Display_Temp[2];
	movf	0+(_Display_Temp)^080h+02h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_display)+02h	;volatile
	line	492
;pattern_fuction.c: 492: display[3]=Display_Temp[3];
	bsf	status, 5	;RP0=1, select bank1
	movf	0+(_Display_Temp)^080h+03h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_display)+03h	;volatile
	line	494
	
l5289:	
	line	496
;pattern_fuction.c: 493: }
;pattern_fuction.c: 494: }
;pattern_fuction.c: 496: if(LCD_COL_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LCD_COL_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8081
	goto	u8080
u8081:
	goto	l14359
u8080:
	line	498
	
l14353:	
;pattern_fuction.c: 497: {
;pattern_fuction.c: 498: LCD_COL_Flash_Times++;
	incf	(_LCD_COL_Flash_Times)^080h,f
	line	499
	
l14355:	
;pattern_fuction.c: 499: if(LCD_Flash_Bool)
	btfss	(_LCD_Flash_Bool/8),(_LCD_Flash_Bool)&7
	goto	u8091
	goto	u8090
u8091:
	goto	l5293
u8090:
	line	501
	
l14357:	
;pattern_fuction.c: 500: {
;pattern_fuction.c: 501: display[4]&=~(1<<3);
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_display)+04h+(3/8),(3)&7	;volatile
	line	502
;pattern_fuction.c: 502: }
	goto	l14359
	line	503
	
l5293:	
	line	505
;pattern_fuction.c: 503: else
;pattern_fuction.c: 504: {
;pattern_fuction.c: 505: display[4]|=1<<3;
	bcf	status, 5	;RP0=0, select bank0
	bsf	0+(_display)+04h+(3/8),(3)&7	;volatile
	line	509
	
l14359:	
;pattern_fuction.c: 506: }
;pattern_fuction.c: 507: }
;pattern_fuction.c: 509: if(LCD_TEMP_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LCD_TEMP_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8101
	goto	u8100
u8101:
	goto	l14367
u8100:
	line	511
	
l14361:	
;pattern_fuction.c: 510: {
;pattern_fuction.c: 511: LCD_TEMP_Flash_Times++;
	incf	(_LCD_TEMP_Flash_Times)^080h,f
	line	513
	
l14363:	
;pattern_fuction.c: 513: if(LCD_Flash_Bool)
	btfss	(_LCD_Flash_Bool/8),(_LCD_Flash_Bool)&7
	goto	u8111
	goto	u8110
u8111:
	goto	l5296
u8110:
	line	515
	
l14365:	
;pattern_fuction.c: 514: {
;pattern_fuction.c: 515: display[4]&=~(1<<0);
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_display)+04h+(0/8),(0)&7	;volatile
	line	517
;pattern_fuction.c: 517: }
	goto	l14367
	line	518
	
l5296:	
	line	520
;pattern_fuction.c: 518: else
;pattern_fuction.c: 519: {
;pattern_fuction.c: 520: display[4]|=1<<0;
	bcf	status, 5	;RP0=0, select bank0
	bsf	0+(_display)+04h+(0/8),(0)&7	;volatile
	line	524
	
l14367:	
;pattern_fuction.c: 521: }
;pattern_fuction.c: 522: }
;pattern_fuction.c: 524: if(LCD_TIMER_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LCD_TIMER_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8121
	goto	u8120
u8121:
	goto	l14375
u8120:
	line	526
	
l14369:	
;pattern_fuction.c: 525: {
;pattern_fuction.c: 526: LCD_TIMER_Flash_Times++;
	incf	(_LCD_TIMER_Flash_Times)^080h,f
	line	528
	
l14371:	
;pattern_fuction.c: 528: if(LCD_Flash_Bool)
	btfss	(_LCD_Flash_Bool/8),(_LCD_Flash_Bool)&7
	goto	u8131
	goto	u8130
u8131:
	goto	l5299
u8130:
	line	530
	
l14373:	
;pattern_fuction.c: 529: {
;pattern_fuction.c: 530: display[4]&=~(1<<1);
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_display)+04h+(1/8),(1)&7	;volatile
	line	532
;pattern_fuction.c: 532: }
	goto	l14375
	line	533
	
l5299:	
	line	535
;pattern_fuction.c: 533: else
;pattern_fuction.c: 534: {
;pattern_fuction.c: 535: display[4]|=1<<1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	0+(_display)+04h+(1/8),(1)&7	;volatile
	line	539
	
l14375:	
;pattern_fuction.c: 536: }
;pattern_fuction.c: 537: }
;pattern_fuction.c: 539: if(LCD_AUTO_Flash_Times<255)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LCD_AUTO_Flash_Times)^080h,w
	xorlw	0FFh
	skipnz
	goto	u8141
	goto	u8140
u8141:
	goto	l14383
u8140:
	line	541
	
l14377:	
;pattern_fuction.c: 540: {
;pattern_fuction.c: 541: LCD_AUTO_Flash_Times++;
	incf	(_LCD_AUTO_Flash_Times)^080h,f
	line	543
	
l14379:	
;pattern_fuction.c: 543: if(LCD_Flash_Bool)
	btfss	(_LCD_Flash_Bool/8),(_LCD_Flash_Bool)&7
	goto	u8151
	goto	u8150
u8151:
	goto	l5302
u8150:
	line	545
	
l14381:	
;pattern_fuction.c: 544: {
;pattern_fuction.c: 545: display[4]&=~(1<<2);
	bcf	status, 5	;RP0=0, select bank0
	bcf	0+(_display)+04h+(2/8),(2)&7	;volatile
	line	546
;pattern_fuction.c: 546: }
	goto	l14383
	line	547
	
l5302:	
	line	549
;pattern_fuction.c: 547: else
;pattern_fuction.c: 548: {
;pattern_fuction.c: 549: display[4]|=1<<2;
	bcf	status, 5	;RP0=0, select bank0
	bsf	0+(_display)+04h+(2/8),(2)&7	;volatile
	line	553
	
l14383:	
;pattern_fuction.c: 550: }
;pattern_fuction.c: 551: }
;pattern_fuction.c: 553: LCD_Flash_Bool=!LCD_Flash_Bool;
	movlw	1<<((_LCD_Flash_Bool)&7)
	xorwf	((_LCD_Flash_Bool)/8),f
	goto	l5304
	line	439
	
l14387:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(_LCD_State)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 2 to 5
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte           23    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	2^0	; case 2
	skipnz
	goto	l5304
	xorlw	5^2	; case 5
	skipnz
	goto	l14331
	goto	l5304
	opt asmopt_on

	line	557
	
l5304:	
	return
	opt stack 0
GLOBAL	__end_of_LCD_FState
	__end_of_LCD_FState:
;; =============== function _LCD_FState ends ============

	signat	_LCD_FState,88
	global	_AcTestZero
psect	text1298,local,class=CODE,delta=2
global __ptext1298
__ptext1298:

;; *************** function _AcTestZero *****************
;; Defined at:
;;		line 1695 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/60
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1298
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\pattern_fuction.c"
	line	1695
	global	__size_of_AcTestZero
	__size_of_AcTestZero	equ	__end_of_AcTestZero-_AcTestZero
	
_AcTestZero:	
	opt	stack 4
; Regs used in _AcTestZero: [wreg+status,2+status,0]
	line	1696
	
l11865:	
;pattern_fuction.c: 1696: if(RB1!=old_LHResult)
	btfsc	(_old_LHResult/8),(_old_LHResult)&7
	goto	u4881
	goto	u4880
u4881:
	movlw	1
	goto	u4882
u4880:
	movlw	0
u4882:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_AcTestZero+0)+0
	btfsc	(49/8),(49)&7
	goto	u4891
	goto	u4890
u4891:
	movlw	1
	goto	u4892
u4890:
	movlw	0
u4892:
	xorwf	(??_AcTestZero+0)+0,w
	skipnz
	goto	u4901
	goto	u4900
u4901:
	goto	l11871
u4900:
	line	1698
	
l11867:	
;pattern_fuction.c: 1697: {
;pattern_fuction.c: 1698: old_LHResult=RB1;
	bcf	(_old_LHResult/8),(_old_LHResult)&7
	btfss	(49/8),(49)&7
	goto	u4915
	bsf	(_old_LHResult/8),(_old_LHResult)&7
u4915:

	line	1700
;pattern_fuction.c: 1700: No_AC=0;
	bcf	(_No_AC/8),(_No_AC)&7
	line	1701
	
l11869:	
;pattern_fuction.c: 1701: LH_Count=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_LH_Count)^080h
	clrf	(_LH_Count+1)^080h
	line	1702
;pattern_fuction.c: 1702: }
	goto	l11873
	line	1705
	
l11871:	
;pattern_fuction.c: 1703: else
;pattern_fuction.c: 1704: {
;pattern_fuction.c: 1705: LH_Count++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_LH_Count)^080h,f
	skipnz
	incf	(_LH_Count+1)^080h,f
	line	1708
	
l11873:	
;pattern_fuction.c: 1706: }
;pattern_fuction.c: 1708: if(LH_Count>=4)
	movlw	high(04h)
	subwf	(_LH_Count+1)^080h,w
	movlw	low(04h)
	skipnz
	subwf	(_LH_Count)^080h,w
	skipc
	goto	u4921
	goto	u4920
u4921:
	goto	l5567
u4920:
	line	1709
	
l11875:	
;pattern_fuction.c: 1709: No_AC=1;
	bsf	(_No_AC/8),(_No_AC)&7
	line	1712
	
l5567:	
	return
	opt stack 0
GLOBAL	__end_of_AcTestZero
	__end_of_AcTestZero:
;; =============== function _AcTestZero ends ============

	signat	_AcTestZero,88
	global	_KeyServer
psect	text1299,local,class=CODE,delta=2
global __ptext1299
__ptext1299:

;; *************** function _KeyServer *****************
;; Defined at:
;;		line 71 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    0[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/60
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1299
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\main.c"
	line	71
	global	__size_of_KeyServer
	__size_of_KeyServer	equ	__end_of_KeyServer-_KeyServer
	
_KeyServer:	
	opt	stack 4
; Regs used in _KeyServer: [wreg-fsr0h+status,2+status,0]
	line	73
	
l14167:	
;main.c: 72: static unsigned int KeyOldFlag = 0;
;main.c: 73: unsigned int i = (KeyFlag[1]<<8) | KeyFlag[0];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_KeyFlag)+01h,w	;volatile
	movwf	(KeyServer@i+1)
	movf	(_KeyFlag),w	;volatile
	movwf	(KeyServer@i)
	line	74
	
l14169:	
;main.c: 74: Add=0;
	clrf	(_Add)
	line	75
	
l14171:	
;main.c: 75: Reduce=0;
	clrf	(_Reduce)
	line	76
;main.c: 76: if(LED6_On_Times>=80) LED6_State=0;
	movlw	high(050h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_LED6_On_Times+1)^080h,w
	movlw	low(050h)
	skipnz
	subwf	(_LED6_On_Times)^080h,w
	skipc
	goto	u7821
	goto	u7820
u7821:
	goto	l14175
u7820:
	
l14173:	
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_LED6_State)
	line	78
	
l14175:	
;main.c: 78: if(LED5_On_Times>=80) LED5_State=0;
	movlw	high(050h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_LED5_On_Times+1)^080h,w
	movlw	low(050h)
	skipnz
	subwf	(_LED5_On_Times)^080h,w
	skipc
	goto	u7831
	goto	u7830
u7831:
	goto	l14179
u7830:
	
l14177:	
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_LED5_State)
	line	81
	
l14179:	
;main.c: 81: if(i)
	bcf	status, 5	;RP0=0, select bank0
	movf	(KeyServer@i+1),w
	iorwf	(KeyServer@i),w
	skipnz
	goto	u7841
	goto	u7840
u7841:
	goto	l14297
u7840:
	line	83
	
l14181:	
;main.c: 82: {
;main.c: 83: if(i==16)
		movf	(KeyServer@i),w
	xorlw	16
	iorwf	(KeyServer@i+1),w

	skipz
	goto	u7851
	goto	u7850
u7851:
	goto	l14189
u7850:
	line	85
	
l14183:	
;main.c: 84: {
;main.c: 85: if(Key_ON_Times++>750)
	bsf	status, 5	;RP0=1, select bank1
	incf	(_Key_ON_Times)^080h,f
	skipnz
	incf	(_Key_ON_Times+1)^080h,f
	movlw	high(02F0h)
	subwf	((_Key_ON_Times+1)^080h),w
	movlw	low(02F0h)
	skipnz
	subwf	((_Key_ON_Times)^080h),w
	skipc
	goto	u7861
	goto	u7860
u7861:
	goto	l14199
u7860:
	line	87
	
l14185:	
;main.c: 86: {
;main.c: 87: Key_Add_3S_ON=1;
	bsf	(_Key_Add_3S_ON/8),(_Key_Add_3S_ON)&7
	line	89
	
l14187:	
;main.c: 89: Key_ON_Times=750;
	movlw	low(02EEh)
	movwf	(_Key_ON_Times)^080h
	movlw	high(02EEh)
	movwf	((_Key_ON_Times)^080h)+1
	goto	l14199
	line	93
	
l14189:	
;main.c: 92: else
;main.c: 93: if(i==32)
		movf	(KeyServer@i),w
	xorlw	32
	iorwf	(KeyServer@i+1),w

	skipz
	goto	u7871
	goto	u7870
u7871:
	goto	l14197
u7870:
	line	95
	
l14191:	
;main.c: 94: {
;main.c: 95: if(Key_ON_Times++>750)
	bsf	status, 5	;RP0=1, select bank1
	incf	(_Key_ON_Times)^080h,f
	skipnz
	incf	(_Key_ON_Times+1)^080h,f
	movlw	high(02F0h)
	subwf	((_Key_ON_Times+1)^080h),w
	movlw	low(02F0h)
	skipnz
	subwf	((_Key_ON_Times)^080h),w
	skipc
	goto	u7881
	goto	u7880
u7881:
	goto	l14199
u7880:
	line	97
	
l14193:	
;main.c: 96: {
;main.c: 97: Key_Reduce_3S_ON=1;
	bsf	(_Key_Reduce_3S_ON/8),(_Key_Reduce_3S_ON)&7
	goto	l14187
	line	103
	
l14197:	
;main.c: 102: else
;main.c: 103: Key_ON_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_Key_ON_Times)^080h
	clrf	(_Key_ON_Times+1)^080h
	line	105
	
l14199:	
;main.c: 105: if(i != KeyOldFlag)
	bsf	status, 6	;RP1=1, select bank3
	movf	(KeyServer@KeyOldFlag+1)^0180h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(KeyServer@i+1),w
	skipz
	goto	u7895
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	(KeyServer@KeyOldFlag)^0180h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(KeyServer@i),w
u7895:

	skipnz
	goto	u7891
	goto	u7890
u7891:
	goto	l1308
u7890:
	line	107
	
l14201:	
;main.c: 106: {
;main.c: 107: KeyOldFlag = i;
	movf	(KeyServer@i+1),w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(KeyServer@KeyOldFlag+1)^0180h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(KeyServer@i),w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(KeyServer@KeyOldFlag)^0180h
	line	109
;main.c: 109: switch(i)
	goto	l14295
	line	111
;main.c: 110: {
;main.c: 111: case 1:
	
l1281:	
	line	112
;main.c: 112: if(Key_Regular_Lock) break;
	btfss	(_Key_Regular_Lock/8),(_Key_Regular_Lock)&7
	goto	u7901
	goto	u7900
u7901:
	goto	l1282
u7900:
	goto	l1308
	
l1282:	
	line	113
;main.c: 113: Regular=1;
	clrf	(_Regular)
	incf	(_Regular),f
	line	114
	
l14205:	
;main.c: 114: Bold=0;
	clrf	(_Bold)
	line	115
;main.c: 115: Iced=0;
	clrf	(_Iced)
	line	116
;main.c: 116: Tea=0;
	clrf	(_Tea)
	line	118
	
l14207:	
;main.c: 118: Rbeep=1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_Rbeep)
	incf	(_Rbeep),f
	line	119
;main.c: 119: break;
	goto	l1308
	line	121
;main.c: 121: case 2:
	
l1284:	
	line	122
;main.c: 122: if(Key_Bold_Lock) break;
	btfss	(_Key_Bold_Lock/8),(_Key_Bold_Lock)&7
	goto	u7911
	goto	u7910
u7911:
	goto	l14211
u7910:
	goto	l1308
	line	123
	
l14211:	
;main.c: 123: Regular=0;
	clrf	(_Regular)
	line	124
	
l14213:	
;main.c: 124: Bold=1;
	clrf	(_Bold)
	incf	(_Bold),f
	line	125
;main.c: 125: Iced=0;
	clrf	(_Iced)
	line	126
;main.c: 126: Tea=0;
	clrf	(_Tea)
	goto	l14207
	line	131
;main.c: 131: case 4:
	
l1286:	
	line	132
;main.c: 132: if(Key_Iced_Lock) break;
	btfss	(_Key_Iced_Lock/8),(_Key_Iced_Lock)&7
	goto	u7921
	goto	u7920
u7921:
	goto	l14219
u7920:
	goto	l1308
	line	133
	
l14219:	
;main.c: 133: Regular=0;
	clrf	(_Regular)
	line	134
;main.c: 134: Bold=0;
	clrf	(_Bold)
	line	135
	
l14221:	
;main.c: 135: Iced=1;
	clrf	(_Iced)
	incf	(_Iced),f
	line	136
;main.c: 136: Tea=0;
	clrf	(_Tea)
	goto	l14207
	line	141
;main.c: 141: case 8:
	
l1288:	
	line	142
;main.c: 142: if(Key_Tea_Lock) break;
	btfss	(_Key_Tea_Lock/8),(_Key_Tea_Lock)&7
	goto	u7931
	goto	u7930
u7931:
	goto	l14227
u7930:
	goto	l1308
	line	143
	
l14227:	
;main.c: 143: Regular=0;
	clrf	(_Regular)
	line	144
;main.c: 144: Bold=0;
	clrf	(_Bold)
	line	145
;main.c: 145: Iced=0;
	clrf	(_Iced)
	line	146
	
l14229:	
;main.c: 146: Tea=1;
	clrf	(_Tea)
	incf	(_Tea),f
	goto	l14207
	line	151
;main.c: 151: case 16:
	
l1290:	
	line	152
;main.c: 152: if(Key_Add_Lock) break;
	btfss	(_Key_Add_Lock/8),(_Key_Add_Lock)&7
	goto	u7941
	goto	u7940
u7941:
	goto	l1291
u7940:
	goto	l1308
	
l1291:	
	line	153
;main.c: 153: Add=1;
	clrf	(_Add)
	incf	(_Add),f
	line	154
	
l14235:	
;main.c: 154: LED5_State=3;
	movlw	(03h)
	movwf	(_LED5_State)
	line	155
	
l14237:	
;main.c: 155: LED5_On_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LED5_On_Times)^080h
	clrf	(_LED5_On_Times+1)^080h
	line	156
	
l14239:	
;main.c: 156: LED6_State=0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_LED6_State)
	goto	l14207
	line	161
;main.c: 161: case 32:
	
l1292:	
	line	162
;main.c: 162: if(Key_Reduce_Lock) break;
	btfss	(_Key_Reduce_Lock/8),(_Key_Reduce_Lock)&7
	goto	u7951
	goto	u7950
u7951:
	goto	l1293
u7950:
	goto	l1308
	
l1293:	
	line	163
;main.c: 163: Reduce=1;
	clrf	(_Reduce)
	incf	(_Reduce),f
	line	164
	
l14245:	
;main.c: 164: LED5_State=0;
	clrf	(_LED5_State)
	line	165
	
l14247:	
;main.c: 165: LED6_State=3;
	movlw	(03h)
	movwf	(_LED6_State)
	line	166
	
l14249:	
;main.c: 166: LED6_On_Times=0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_LED6_On_Times)^080h
	clrf	(_LED6_On_Times+1)^080h
	goto	l14207
	line	170
;main.c: 170: case 64:
	
l1294:	
	line	171
;main.c: 171: if(Key_80_Z_Lock) break;
	btfss	(_Key_80_Z_Lock/8),(_Key_80_Z_Lock)&7
	goto	u7961
	goto	u7960
u7961:
	goto	l1295
u7960:
	goto	l1308
	
l1295:	
	line	172
;main.c: 172: _80_z=1;
	clrf	(__80_z)
	incf	(__80_z),f
	line	173
	
l14255:	
;main.c: 173: _120_z=0;
	clrf	(__120_z)
	line	174
;main.c: 174: _210_z=0;
	clrf	(__210_z)
	line	175
;main.c: 175: _420_z=0;
	clrf	(__420_z)
	goto	l14207
	line	181
;main.c: 181: case 128:
	
l1296:	
	line	182
;main.c: 182: if(Key_120_Z_Lock) break;
	btfss	(_Key_120_Z_Lock/8),(_Key_120_Z_Lock)&7
	goto	u7971
	goto	u7970
u7971:
	goto	l14261
u7970:
	goto	l1308
	line	183
	
l14261:	
;main.c: 183: _80_z=0;
	clrf	(__80_z)
	line	184
	
l14263:	
;main.c: 184: _120_z=1;
	clrf	(__120_z)
	incf	(__120_z),f
	line	185
;main.c: 185: _210_z=0;
	clrf	(__210_z)
	line	186
;main.c: 186: _420_z=0;
	clrf	(__420_z)
	goto	l14207
	line	191
;main.c: 191: case 256:
	
l1298:	
	line	192
;main.c: 192: if(Key_210_Z_Lock) break;
	btfss	(_Key_210_Z_Lock/8),(_Key_210_Z_Lock)&7
	goto	u7981
	goto	u7980
u7981:
	goto	l14269
u7980:
	goto	l1308
	line	193
	
l14269:	
;main.c: 193: _80_z=0;
	clrf	(__80_z)
	line	194
;main.c: 194: _120_z=0;
	clrf	(__120_z)
	line	195
	
l14271:	
;main.c: 195: _210_z=1;
	clrf	(__210_z)
	incf	(__210_z),f
	line	196
;main.c: 196: _420_z=0;
	clrf	(__420_z)
	goto	l14207
	line	201
;main.c: 201: case 512:
	
l1300:	
	line	202
;main.c: 202: if(Key_420_Z_Lock) break;
	btfss	(_Key_420_Z_Lock/8),(_Key_420_Z_Lock)&7
	goto	u7991
	goto	u7990
u7991:
	goto	l14277
u7990:
	goto	l1308
	line	203
	
l14277:	
;main.c: 203: _80_z=0;
	clrf	(__80_z)
	line	204
;main.c: 204: _120_z=0;
	clrf	(__120_z)
	line	205
;main.c: 205: _210_z=0;
	clrf	(__210_z)
	line	206
	
l14279:	
;main.c: 206: _420_z=1;
	clrf	(__420_z)
	incf	(__420_z),f
	goto	l14207
	line	211
;main.c: 211: case 1024:
	
l1302:	
	line	212
;main.c: 212: if(Key_Option_Lock) break;
	btfss	(_Key_Option_Lock/8),(_Key_Option_Lock)&7
	goto	u8001
	goto	u8000
u8001:
	goto	l14285
u8000:
	goto	l1308
	line	213
	
l14285:	
;main.c: 213: Option++;
	incf	(_Option),f
	line	214
	
l14287:	
;main.c: 214: if(Option>=4) Option=1;
	movlw	(04h)
	subwf	(_Option),w
	skipc
	goto	u8011
	goto	u8010
u8011:
	goto	l14207
u8010:
	
l14289:	
	clrf	(_Option)
	incf	(_Option),f
	goto	l14207
	line	219
;main.c: 219: case 2048:
	
l1305:	
	line	220
;main.c: 220: if(Key_Start_Lock) break;
	btfss	(_Key_Start_Lock/8),(_Key_Start_Lock)&7
	goto	u8021
	goto	u8020
u8021:
	goto	l1306
u8020:
	goto	l1308
	
l1306:	
	line	222
;main.c: 222: Start=1;
	clrf	(_Start)
	incf	(_Start),f
	line	224
;main.c: 224: Rbeep=1;
	clrf	(_Rbeep)
	incf	(_Rbeep),f
	line	225
;main.c: 225: break;
	goto	l1308
	line	109
	
l14295:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 5 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 8
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; direct_byte           35     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable            13     6 (fixed)
; spacedrange           24     9 (fixed)
; locatedrange           9     3 (fixed)
;	Chosen strategy is simple_byte

	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf (KeyServer@i+1),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l16483
	xorlw	1^0	; case 1
	skipnz
	goto	l16485
	xorlw	2^1	; case 2
	skipnz
	goto	l16487
	xorlw	4^2	; case 4
	skipnz
	goto	l16489
	xorlw	8^4	; case 8
	skipnz
	goto	l16491
	goto	l1308
	opt asmopt_on
	
l16483:	
; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 1 to 128
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           25    13 (average)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	movf (KeyServer@i),w
	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l1281
	xorlw	2^1	; case 2
	skipnz
	goto	l1284
	xorlw	4^2	; case 4
	skipnz
	goto	l1286
	xorlw	8^4	; case 8
	skipnz
	goto	l1288
	xorlw	16^8	; case 16
	skipnz
	goto	l1290
	xorlw	32^16	; case 32
	skipnz
	goto	l1292
	xorlw	64^32	; case 64
	skipnz
	goto	l1294
	xorlw	128^64	; case 128
	skipnz
	goto	l1296
	goto	l1308
	opt asmopt_on
	
l16485:	
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf (KeyServer@i),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l1298
	goto	l1308
	opt asmopt_on
	
l16487:	
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf (KeyServer@i),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l1300
	goto	l1308
	opt asmopt_on
	
l16489:	
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf (KeyServer@i),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l1302
	goto	l1308
	opt asmopt_on
	
l16491:	
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 0 to 0
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           11     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable             5     6 (fixed)
; spacedrange            8     9 (fixed)
; locatedrange           1     3 (fixed)
;	Chosen strategy is simple_byte

	movf (KeyServer@i),w
	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l1305
	goto	l1308
	opt asmopt_on

	line	232
	
l14297:	
;main.c: 230: else
;main.c: 231: {
;main.c: 232: KeyOldFlag = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(KeyServer@KeyOldFlag)^0180h
	clrf	(KeyServer@KeyOldFlag+1)^0180h
	line	233
;main.c: 233: Key_ON_Times=0;
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_Key_ON_Times)^080h
	clrf	(_Key_ON_Times+1)^080h
	line	235
	
l1308:	
	return
	opt stack 0
GLOBAL	__end_of_KeyServer
	__end_of_KeyServer:
;; =============== function _KeyServer ends ============

	signat	_KeyServer,88
	global	__74HC595_SET
psect	text1300,local,class=CODE,delta=2
global __ptext1300
__ptext1300:

;; *************** function __74HC595_SET *****************
;; Defined at:
;;		line 6 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\74HC595.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1    2[BANK0 ] char 
;;  i               1    1[BANK0 ] char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 20/40
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Init_System
;;		_main
;;		_ShutDowm_Device
;; This function uses a non-reentrant model
;;
psect	text1300
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\74HC595.c"
	line	6
	global	__size_of__74HC595_SET
	__size_of__74HC595_SET	equ	__end_of__74HC595_SET-__74HC595_SET
	
__74HC595_SET:	
	opt	stack 3
; Regs used in __74HC595_SET: [wreg-fsr0h+status,2+status,0]
	line	8
	
l11435:	
;74HC595.c: 7: signed char i,j;
;74HC595.c: 8: for(i=0;i<3;i++)
	bcf	status, 6	;RP1=0, select bank0
	clrf	(__74HC595_SET@i)
	line	9
	
l11441:	
;74HC595.c: 9: for(j=0;j<8;j++)
	clrf	(__74HC595_SET@j)
	line	11
	
l11447:	
;74HC595.c: 10: {
;74HC595.c: 11: if(Temp_595[i]&(1<<j))
	movf	(__74HC595_SET@i),w
	addlw	_Temp_595&0ffh
	movwf	fsr0
	movlw	(01h)
	movwf	(??__74HC595_SET+0)+0
	incf	(__74HC595_SET@j),w
	goto	u3944
u3945:
	clrc
	rlf	(??__74HC595_SET+0)+0,f
u3944:
	addlw	-1
	skipz
	goto	u3945
	movf	0+(??__74HC595_SET+0)+0,w
	bcf	status, 7	;select IRP bank0
	andwf	indf,w
	btfsc	status,2
	goto	u3951
	goto	u3950
u3951:
	goto	l2552
u3950:
	line	13
	
l11449:	
;74HC595.c: 12: {
;74HC595.c: 13: RE3=1;
	bsf	(75/8),(75)&7
	line	14
;74HC595.c: 14: }
	goto	l2553
	line	15
	
l2552:	
	line	17
;74HC595.c: 15: else
;74HC595.c: 16: {
;74HC595.c: 17: RE3=0;
	bcf	(75/8),(75)&7
	line	18
	
l2553:	
	line	19
;74HC595.c: 18: }
;74HC595.c: 19: RC1=1;
	bsf	(57/8),(57)&7
	line	20
;74HC595.c: 20: RC1=0;
	bcf	(57/8),(57)&7
	line	9
	
l11451:	
	incf	(__74HC595_SET@j),f
	
l11453:	
	movf	(__74HC595_SET@j),w
	xorlw	80h
	addlw	-((08h)^80h)
	skipc
	goto	u3961
	goto	u3960
u3961:
	goto	l11447
u3960:
	line	8
	
l11455:	
	incf	(__74HC595_SET@i),f
	
l11457:	
	movf	(__74HC595_SET@i),w
	xorlw	80h
	addlw	-((03h)^80h)
	skipc
	goto	u3971
	goto	u3970
u3971:
	goto	l11441
u3970:
	
l2549:	
	line	23
;74HC595.c: 21: }
;74HC595.c: 23: RC6=1;
	bsf	(62/8),(62)&7
	line	24
;74HC595.c: 24: RC6=0;
	bcf	(62/8),(62)&7
	line	25
	
l2554:	
	return
	opt stack 0
GLOBAL	__end_of__74HC595_SET
	__end_of__74HC595_SET:
;; =============== function __74HC595_SET ends ============

	signat	__74HC595_SET,88
	global	_DelayX
psect	text1301,local,class=CODE,delta=2
global __ptext1301
__ptext1301:

;; *************** function _DelayX *****************
;; Defined at:
;;		line 11 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\main.c"
;; Parameters:    Size  Location     Type
;;  i               2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Init_System
;; This function uses a non-reentrant model
;;
psect	text1301
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\main.c"
	line	11
	global	__size_of_DelayX
	__size_of_DelayX	equ	__end_of_DelayX-_DelayX
	
_DelayX:	
	opt	stack 3
; Regs used in _DelayX: [wreg]
	line	13
	
l14163:	
;main.c: 13: while(i--) {asm("nop");}
	goto	l14165
	
l1260:	
# 13 "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\main.c"
nop ;#
psect	text1301
	
l14165:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(DelayX@i),f
	movlw	high(01h)
	skipc
	decf	(DelayX@i+1),f
	subwf	(DelayX@i+1),f
	incf	((DelayX@i)),w
	skipnz
	incf	((DelayX@i+1)),w

	skipz
	goto	u7811
	goto	u7810
u7811:
	goto	l1260
u7810:
	line	14
	
l1262:	
	return
	opt stack 0
GLOBAL	__end_of_DelayX
	__end_of_DelayX:
;; =============== function _DelayX ends ============

	signat	_DelayX,4216
	global	_Isr_Timer
psect	text1302,local,class=CODE,delta=2
global __ptext1302
__ptext1302:

;; *************** function _Isr_Timer *****************
;; Defined at:
;;		line 241 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_Set_Disp
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text1302
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\main.c"
	line	241
	global	__size_of_Isr_Timer
	__size_of_Isr_Timer	equ	__end_of_Isr_Timer-_Isr_Timer
	
_Isr_Timer:	
	opt	stack 1
; Regs used in _Isr_Timer: [wreg-fsr0h+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_Isr_Timer+0)
	movf	fsr0,w
	movwf	(??_Isr_Timer+1)
	movf	pclath,w
	movwf	(??_Isr_Timer+2)
	ljmp	_Isr_Timer
psect	text1302
	line	242
	
i1l11621:	
;main.c: 242: if(TMR2IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(97/8),(97)&7
	goto	u419_21
	goto	u419_20
u419_21:
	goto	i1l11633
u419_20:
	line	244
	
i1l11623:	
;main.c: 243: {
;main.c: 244: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	247
	
i1l11625:	
;main.c: 246: {
;main.c: 247: Set_Disp();
	fcall	_Set_Disp
	line	250
	
i1l11627:	
;main.c: 248: }
;main.c: 250: if(++MainTime>=2)
	movlw	(02h)
	incf	(_MainTime),f	;volatile
	subwf	((_MainTime)),w	;volatile
	skipc
	goto	u420_21
	goto	u420_20
u420_21:
	goto	i1l11635
u420_20:
	line	252
	
i1l11629:	
;main.c: 251: {
;main.c: 252: MainTime=0;
	clrf	(_MainTime)	;volatile
	line	253
	
i1l11631:	
;main.c: 253: B_MainLoop = 1;
	bsf	(_B_MainLoop/8),(_B_MainLoop)&7
	goto	i1l11635
	line	259
	
i1l11633:	
;main.c: 257: else
;main.c: 258: {
;main.c: 259: PIR1 = 0;
	clrf	(12)	;volatile
	line	262
	
i1l11635:	
;main.c: 261: }
;main.c: 262: if(RBIF)
	btfss	(88/8),(88)&7
	goto	u421_21
	goto	u421_20
u421_21:
	goto	i1l1315
u421_20:
	line	265
	
i1l11637:	
;main.c: 263: {
;main.c: 265: RBIF=0;
	bcf	(88/8),(88)&7
	line	267
	
i1l1315:	
	movf	(??_Isr_Timer+2),w
	movwf	pclath
	movf	(??_Isr_Timer+1),w
	movwf	fsr0
	swapf	(??_Isr_Timer+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_Isr_Timer
	__end_of_Isr_Timer:
;; =============== function _Isr_Timer ends ============

	signat	_Isr_Timer,88
	global	_Set_Disp
psect	text1303,local,class=CODE,delta=2
global __ptext1303
__ptext1303:

;; *************** function _Set_Disp *****************
;; Defined at:
;;		line 113 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\LCD.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1__74HC595_SET
;; This function is called by:
;;		_Isr_Timer
;; This function uses a non-reentrant model
;;
psect	text1303
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\LCD.c"
	line	113
	global	__size_of_Set_Disp
	__size_of_Set_Disp	equ	__end_of_Set_Disp-_Set_Disp
	
_Set_Disp:	
	opt	stack 1
; Regs used in _Set_Disp: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	116
	
i1l11639:	
;LCD.c: 116: TRISC = 0B10111100;
	movlw	(0BCh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	119
	
i1l11641:	
;LCD.c: 119: if(com_count&0x01)
	btfss	(_com_count),(0)&7
	goto	u422_21
	goto	u422_20
u422_21:
	goto	i1l11645
u422_20:
	line	121
	
i1l11643:	
;LCD.c: 120: {
;LCD.c: 121: Temp_595[2]=0XFF;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	0+(_Temp_595)+02h	;volatile
	line	122
;LCD.c: 122: }
	goto	i1l11857
	line	125
	
i1l11645:	
;LCD.c: 123: else
;LCD.c: 124: {
;LCD.c: 125: Temp_595[2]=0X00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	0+(_Temp_595)+02h	;volatile
	goto	i1l11857
	line	130
;LCD.c: 129: {
;LCD.c: 130: case 0:
	
i1l3811:	
	line	132
;LCD.c: 132: if(display[0] & 0B00000010) {Temp_595[2]|=1<<7;}
	btfss	(_display),(1)&7
	goto	u423_21
	goto	u423_20
u423_21:
	goto	i1l3812
u423_20:
	
i1l11647:	
	bsf	0+(_Temp_595)+02h+(7/8),(7)&7	;volatile
	
i1l3812:	
	line	133
;LCD.c: 133: if(display[0] & 0B00000001) {Temp_595[2]|=1<<6;}
	btfss	(_display),(0)&7
	goto	u424_21
	goto	u424_20
u424_21:
	goto	i1l3813
u424_20:
	
i1l11649:	
	bsf	0+(_Temp_595)+02h+(6/8),(6)&7	;volatile
	
i1l3813:	
	line	134
;LCD.c: 134: if(display[3] & 0B00000010) {Temp_595[2]|=1<<0;}
	btfss	0+(_display)+03h,(1)&7	;volatile
	goto	u425_21
	goto	u425_20
u425_21:
	goto	i1l3814
u425_20:
	
i1l11651:	
	bsf	0+(_Temp_595)+02h+(0/8),(0)&7	;volatile
	
i1l3814:	
	line	135
;LCD.c: 135: if(display[3] & 0B00000001) {Temp_595[2]|=1<<1;}
	btfss	0+(_display)+03h,(0)&7	;volatile
	goto	u426_21
	goto	u426_20
u426_21:
	goto	i1l3815
u426_20:
	
i1l11653:	
	bsf	0+(_Temp_595)+02h+(1/8),(1)&7	;volatile
	
i1l3815:	
	line	136
;LCD.c: 136: if(display[2] & 0B00000010) {Temp_595[2]|=1<<2;}
	btfss	0+(_display)+02h,(1)&7	;volatile
	goto	u427_21
	goto	u427_20
u427_21:
	goto	i1l3816
u427_20:
	
i1l11655:	
	bsf	0+(_Temp_595)+02h+(2/8),(2)&7	;volatile
	
i1l3816:	
	line	137
;LCD.c: 137: if(display[2] & 0B00000001) {Temp_595[2]|=1<<5;}
	btfss	0+(_display)+02h,(0)&7	;volatile
	goto	u428_21
	goto	u428_20
u428_21:
	goto	i1l3817
u428_20:
	
i1l11657:	
	bsf	0+(_Temp_595)+02h+(5/8),(5)&7	;volatile
	
i1l3817:	
	line	138
;LCD.c: 138: if(display[1] & 0B00000010) {Temp_595[2]|=1<<4;}
	btfss	0+(_display)+01h,(1)&7	;volatile
	goto	u429_21
	goto	u429_20
u429_21:
	goto	i1l3818
u429_20:
	
i1l11659:	
	bsf	0+(_Temp_595)+02h+(4/8),(4)&7	;volatile
	
i1l3818:	
	line	139
;LCD.c: 139: if(display[1] & 0B00000001) {Temp_595[2]|=1<<3;}
	btfss	0+(_display)+01h,(0)&7	;volatile
	goto	u430_21
	goto	u430_20
u430_21:
	goto	i1l11663
u430_20:
	
i1l11661:	
	bsf	0+(_Temp_595)+02h+(3/8),(3)&7	;volatile
	line	141
	
i1l11663:	
;LCD.c: 141: _74HC595_SET();
	fcall	i1__74HC595_SET
	line	143
	
i1l11665:	
;LCD.c: 143: COMEN =0B00111000;
	movlw	(038h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	144
	
i1l11667:	
;LCD.c: 144: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	145
	
i1l11669:	
;LCD.c: 145: TRISC = 0B10111000;
	movlw	(0B8h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	146
	
i1l11671:	
;LCD.c: 146: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(58/8),(58)&7
	line	148
;LCD.c: 148: break;
	goto	i1l11859
	line	149
;LCD.c: 149: case 1:
	
i1l3821:	
	line	151
;LCD.c: 151: if(display[0] & 0B00000010) {Temp_595[2] &=~(1<<7);}
	btfss	(_display),(1)&7
	goto	u431_21
	goto	u431_20
u431_21:
	goto	i1l3822
u431_20:
	
i1l11673:	
	bcf	0+(_Temp_595)+02h+(7/8),(7)&7	;volatile
	
i1l3822:	
	line	152
;LCD.c: 152: if(display[0] & 0B00000001) {Temp_595[2] &=~(1<<6);}
	btfss	(_display),(0)&7
	goto	u432_21
	goto	u432_20
u432_21:
	goto	i1l3823
u432_20:
	
i1l11675:	
	bcf	0+(_Temp_595)+02h+(6/8),(6)&7	;volatile
	
i1l3823:	
	line	153
;LCD.c: 153: if(display[3] & 0B00000010) {Temp_595[2] &=~(1<<0);}
	btfss	0+(_display)+03h,(1)&7	;volatile
	goto	u433_21
	goto	u433_20
u433_21:
	goto	i1l3824
u433_20:
	
i1l11677:	
	bcf	0+(_Temp_595)+02h+(0/8),(0)&7	;volatile
	
i1l3824:	
	line	154
;LCD.c: 154: if(display[3] & 0B00000001) {Temp_595[2] &=~(1<<1);}
	btfss	0+(_display)+03h,(0)&7	;volatile
	goto	u434_21
	goto	u434_20
u434_21:
	goto	i1l3825
u434_20:
	
i1l11679:	
	bcf	0+(_Temp_595)+02h+(1/8),(1)&7	;volatile
	
i1l3825:	
	line	155
;LCD.c: 155: if(display[2] & 0B00000010) {Temp_595[2] &=~(1<<2);}
	btfss	0+(_display)+02h,(1)&7	;volatile
	goto	u435_21
	goto	u435_20
u435_21:
	goto	i1l3826
u435_20:
	
i1l11681:	
	bcf	0+(_Temp_595)+02h+(2/8),(2)&7	;volatile
	
i1l3826:	
	line	156
;LCD.c: 156: if(display[2] & 0B00000001) {Temp_595[2] &=~(1<<5);}
	btfss	0+(_display)+02h,(0)&7	;volatile
	goto	u436_21
	goto	u436_20
u436_21:
	goto	i1l3827
u436_20:
	
i1l11683:	
	bcf	0+(_Temp_595)+02h+(5/8),(5)&7	;volatile
	
i1l3827:	
	line	157
;LCD.c: 157: if(display[1] & 0B00000010) {Temp_595[2] &=~(1<<4);}
	btfss	0+(_display)+01h,(1)&7	;volatile
	goto	u437_21
	goto	u437_20
u437_21:
	goto	i1l3828
u437_20:
	
i1l11685:	
	bcf	0+(_Temp_595)+02h+(4/8),(4)&7	;volatile
	
i1l3828:	
	line	158
;LCD.c: 158: if(display[1] & 0B00000001) {Temp_595[2] &=~(1<<3);}
	btfss	0+(_display)+01h,(0)&7	;volatile
	goto	u438_21
	goto	u438_20
u438_21:
	goto	i1l11689
u438_20:
	
i1l11687:	
	bcf	0+(_Temp_595)+02h+(3/8),(3)&7	;volatile
	line	160
	
i1l11689:	
;LCD.c: 160: _74HC595_SET();
	fcall	i1__74HC595_SET
	line	162
	
i1l11691:	
;LCD.c: 162: COMEN =0B00111000;
	movlw	(038h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	163
	
i1l11693:	
;LCD.c: 163: RC2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	164
	
i1l11695:	
;LCD.c: 164: TRISC = 0B10111000;
	movlw	(0B8h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	165
	
i1l11697:	
;LCD.c: 165: RC2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(58/8),(58)&7
	line	166
;LCD.c: 166: break;
	goto	i1l11859
	line	168
;LCD.c: 168: case 2:
	
i1l3830:	
	line	170
;LCD.c: 170: if(display[0] & 0B01000000) {Temp_595[2]|=1<<7;}
	btfss	(_display),(6)&7
	goto	u439_21
	goto	u439_20
u439_21:
	goto	i1l3831
u439_20:
	
i1l11699:	
	bsf	0+(_Temp_595)+02h+(7/8),(7)&7	;volatile
	
i1l3831:	
	line	171
;LCD.c: 171: if(display[0] & 0B00100000) {Temp_595[2]|=1<<6;}
	btfss	(_display),(5)&7
	goto	u440_21
	goto	u440_20
u440_21:
	goto	i1l3832
u440_20:
	
i1l11701:	
	bsf	0+(_Temp_595)+02h+(6/8),(6)&7	;volatile
	
i1l3832:	
	line	172
;LCD.c: 172: if(display[3] & 0B01000000) {Temp_595[2]|=1<<0;}
	btfss	0+(_display)+03h,(6)&7	;volatile
	goto	u441_21
	goto	u441_20
u441_21:
	goto	i1l3833
u441_20:
	
i1l11703:	
	bsf	0+(_Temp_595)+02h+(0/8),(0)&7	;volatile
	
i1l3833:	
	line	173
;LCD.c: 173: if(display[3] & 0B00100000) {Temp_595[2]|=1<<1;}
	btfss	0+(_display)+03h,(5)&7	;volatile
	goto	u442_21
	goto	u442_20
u442_21:
	goto	i1l3834
u442_20:
	
i1l11705:	
	bsf	0+(_Temp_595)+02h+(1/8),(1)&7	;volatile
	
i1l3834:	
	line	174
;LCD.c: 174: if(display[2] & 0B01000000) {Temp_595[2]|=1<<2;}
	btfss	0+(_display)+02h,(6)&7	;volatile
	goto	u443_21
	goto	u443_20
u443_21:
	goto	i1l3835
u443_20:
	
i1l11707:	
	bsf	0+(_Temp_595)+02h+(2/8),(2)&7	;volatile
	
i1l3835:	
	line	175
;LCD.c: 175: if(display[2] & 0B00100000) {Temp_595[2]|=1<<5;}
	btfss	0+(_display)+02h,(5)&7	;volatile
	goto	u444_21
	goto	u444_20
u444_21:
	goto	i1l3836
u444_20:
	
i1l11709:	
	bsf	0+(_Temp_595)+02h+(5/8),(5)&7	;volatile
	
i1l3836:	
	line	176
;LCD.c: 176: if(display[1] & 0B01000000) {Temp_595[2]|=1<<4;}
	btfss	0+(_display)+01h,(6)&7	;volatile
	goto	u445_21
	goto	u445_20
u445_21:
	goto	i1l3837
u445_20:
	
i1l11711:	
	bsf	0+(_Temp_595)+02h+(4/8),(4)&7	;volatile
	
i1l3837:	
	line	177
;LCD.c: 177: if(display[1] & 0B00100000) {Temp_595[2]|=1<<3;}
	btfss	0+(_display)+01h,(5)&7	;volatile
	goto	u446_21
	goto	u446_20
u446_21:
	goto	i1l11715
u446_20:
	
i1l11713:	
	bsf	0+(_Temp_595)+02h+(3/8),(3)&7	;volatile
	line	179
	
i1l11715:	
;LCD.c: 179: _74HC595_SET();
	fcall	i1__74HC595_SET
	line	181
	
i1l11717:	
;LCD.c: 181: COMEN =0B00110100;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	182
	
i1l11719:	
;LCD.c: 182: RC3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	183
	
i1l11721:	
;LCD.c: 183: TRISC = 0B10110100;
	movlw	(0B4h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	184
	
i1l11723:	
;LCD.c: 184: RC3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(59/8),(59)&7
	line	186
;LCD.c: 186: break;
	goto	i1l11859
	line	187
;LCD.c: 187: case 3:
	
i1l3839:	
	line	189
;LCD.c: 189: if(display[0] & 0B01000000) {Temp_595[2] &=~(1<<7);}
	btfss	(_display),(6)&7
	goto	u447_21
	goto	u447_20
u447_21:
	goto	i1l3840
u447_20:
	
i1l11725:	
	bcf	0+(_Temp_595)+02h+(7/8),(7)&7	;volatile
	
i1l3840:	
	line	190
;LCD.c: 190: if(display[0] & 0B00100000) {Temp_595[2] &=~(1<<6);}
	btfss	(_display),(5)&7
	goto	u448_21
	goto	u448_20
u448_21:
	goto	i1l3841
u448_20:
	
i1l11727:	
	bcf	0+(_Temp_595)+02h+(6/8),(6)&7	;volatile
	
i1l3841:	
	line	191
;LCD.c: 191: if(display[3] & 0B01000000) {Temp_595[2] &=~(1<<0);}
	btfss	0+(_display)+03h,(6)&7	;volatile
	goto	u449_21
	goto	u449_20
u449_21:
	goto	i1l3842
u449_20:
	
i1l11729:	
	bcf	0+(_Temp_595)+02h+(0/8),(0)&7	;volatile
	
i1l3842:	
	line	192
;LCD.c: 192: if(display[3] & 0B00100000) {Temp_595[2] &=~(1<<1);}
	btfss	0+(_display)+03h,(5)&7	;volatile
	goto	u450_21
	goto	u450_20
u450_21:
	goto	i1l3843
u450_20:
	
i1l11731:	
	bcf	0+(_Temp_595)+02h+(1/8),(1)&7	;volatile
	
i1l3843:	
	line	193
;LCD.c: 193: if(display[2] & 0B01000000) {Temp_595[2] &=~(1<<2);}
	btfss	0+(_display)+02h,(6)&7	;volatile
	goto	u451_21
	goto	u451_20
u451_21:
	goto	i1l3844
u451_20:
	
i1l11733:	
	bcf	0+(_Temp_595)+02h+(2/8),(2)&7	;volatile
	
i1l3844:	
	line	194
;LCD.c: 194: if(display[2] & 0B00100000) {Temp_595[2] &=~(1<<5);}
	btfss	0+(_display)+02h,(5)&7	;volatile
	goto	u452_21
	goto	u452_20
u452_21:
	goto	i1l3845
u452_20:
	
i1l11735:	
	bcf	0+(_Temp_595)+02h+(5/8),(5)&7	;volatile
	
i1l3845:	
	line	195
;LCD.c: 195: if(display[1] & 0B01000000) {Temp_595[2] &=~(1<<4);}
	btfss	0+(_display)+01h,(6)&7	;volatile
	goto	u453_21
	goto	u453_20
u453_21:
	goto	i1l3846
u453_20:
	
i1l11737:	
	bcf	0+(_Temp_595)+02h+(4/8),(4)&7	;volatile
	
i1l3846:	
	line	196
;LCD.c: 196: if(display[1] & 0B00100000) {Temp_595[2] &=~(1<<3);}
	btfss	0+(_display)+01h,(5)&7	;volatile
	goto	u454_21
	goto	u454_20
u454_21:
	goto	i1l11741
u454_20:
	
i1l11739:	
	bcf	0+(_Temp_595)+02h+(3/8),(3)&7	;volatile
	line	198
	
i1l11741:	
;LCD.c: 198: _74HC595_SET();
	fcall	i1__74HC595_SET
	line	200
	
i1l11743:	
;LCD.c: 200: COMEN =0B00110100;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	201
	
i1l11745:	
;LCD.c: 201: RC3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	202
	
i1l11747:	
;LCD.c: 202: TRISC = 0B10110100;
	movlw	(0B4h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	203
	
i1l11749:	
;LCD.c: 203: RC3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(59/8),(59)&7
	line	204
;LCD.c: 204: break;
	goto	i1l11859
	line	206
;LCD.c: 206: case 4:
	
i1l3848:	
	line	208
;LCD.c: 208: if(display[0] & 0B00000100) {Temp_595[2]|=1<<7;}
	btfss	(_display),(2)&7
	goto	u455_21
	goto	u455_20
u455_21:
	goto	i1l3849
u455_20:
	
i1l11751:	
	bsf	0+(_Temp_595)+02h+(7/8),(7)&7	;volatile
	
i1l3849:	
	line	209
;LCD.c: 209: if(display[0] & 0B00010000) {Temp_595[2]|=1<<6;}
	btfss	(_display),(4)&7
	goto	u456_21
	goto	u456_20
u456_21:
	goto	i1l3850
u456_20:
	
i1l11753:	
	bsf	0+(_Temp_595)+02h+(6/8),(6)&7	;volatile
	
i1l3850:	
	line	210
;LCD.c: 210: if(display[3] & 0B00000100) {Temp_595[2]|=1<<0;}
	btfss	0+(_display)+03h,(2)&7	;volatile
	goto	u457_21
	goto	u457_20
u457_21:
	goto	i1l3851
u457_20:
	
i1l11755:	
	bsf	0+(_Temp_595)+02h+(0/8),(0)&7	;volatile
	
i1l3851:	
	line	211
;LCD.c: 211: if(display[3] & 0B00010000) {Temp_595[2]|=1<<1;}
	btfss	0+(_display)+03h,(4)&7	;volatile
	goto	u458_21
	goto	u458_20
u458_21:
	goto	i1l3852
u458_20:
	
i1l11757:	
	bsf	0+(_Temp_595)+02h+(1/8),(1)&7	;volatile
	
i1l3852:	
	line	212
;LCD.c: 212: if(display[2] & 0B00000100) {Temp_595[2]|=1<<2;}
	btfss	0+(_display)+02h,(2)&7	;volatile
	goto	u459_21
	goto	u459_20
u459_21:
	goto	i1l3853
u459_20:
	
i1l11759:	
	bsf	0+(_Temp_595)+02h+(2/8),(2)&7	;volatile
	
i1l3853:	
	line	213
;LCD.c: 213: if(display[2] & 0B00010000) {Temp_595[2]|=1<<5;}
	btfss	0+(_display)+02h,(4)&7	;volatile
	goto	u460_21
	goto	u460_20
u460_21:
	goto	i1l3854
u460_20:
	
i1l11761:	
	bsf	0+(_Temp_595)+02h+(5/8),(5)&7	;volatile
	
i1l3854:	
	line	214
;LCD.c: 214: if(display[1] & 0B00000100) {Temp_595[2]|=1<<4;}
	btfss	0+(_display)+01h,(2)&7	;volatile
	goto	u461_21
	goto	u461_20
u461_21:
	goto	i1l3855
u461_20:
	
i1l11763:	
	bsf	0+(_Temp_595)+02h+(4/8),(4)&7	;volatile
	
i1l3855:	
	line	215
;LCD.c: 215: if(display[1] & 0B00010000) {Temp_595[2]|=1<<3;}
	btfss	0+(_display)+01h,(4)&7	;volatile
	goto	u462_21
	goto	u462_20
u462_21:
	goto	i1l11767
u462_20:
	
i1l11765:	
	bsf	0+(_Temp_595)+02h+(3/8),(3)&7	;volatile
	line	217
	
i1l11767:	
;LCD.c: 217: _74HC595_SET();
	fcall	i1__74HC595_SET
	line	219
	
i1l11769:	
;LCD.c: 219: COMEN =0B00101100;
	movlw	(02Ch)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	220
	
i1l11771:	
;LCD.c: 220: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	221
	
i1l11773:	
;LCD.c: 221: TRISC = 0B10101100;
	movlw	(0ACh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	222
	
i1l11775:	
;LCD.c: 222: RC4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(60/8),(60)&7
	line	223
;LCD.c: 223: break;
	goto	i1l11859
	line	224
;LCD.c: 224: case 5:
	
i1l3857:	
	line	226
;LCD.c: 226: if(display[0] & 0B00000100) {Temp_595[2] &=~(1<<7);}
	btfss	(_display),(2)&7
	goto	u463_21
	goto	u463_20
u463_21:
	goto	i1l3858
u463_20:
	
i1l11777:	
	bcf	0+(_Temp_595)+02h+(7/8),(7)&7	;volatile
	
i1l3858:	
	line	227
;LCD.c: 227: if(display[0] & 0B00010000) {Temp_595[2] &=~(1<<6);}
	btfss	(_display),(4)&7
	goto	u464_21
	goto	u464_20
u464_21:
	goto	i1l3859
u464_20:
	
i1l11779:	
	bcf	0+(_Temp_595)+02h+(6/8),(6)&7	;volatile
	
i1l3859:	
	line	228
;LCD.c: 228: if(display[3] & 0B00000100) {Temp_595[2] &=~(1<<0);}
	btfss	0+(_display)+03h,(2)&7	;volatile
	goto	u465_21
	goto	u465_20
u465_21:
	goto	i1l3860
u465_20:
	
i1l11781:	
	bcf	0+(_Temp_595)+02h+(0/8),(0)&7	;volatile
	
i1l3860:	
	line	229
;LCD.c: 229: if(display[3] & 0B00010000) {Temp_595[2] &=~(1<<1);}
	btfss	0+(_display)+03h,(4)&7	;volatile
	goto	u466_21
	goto	u466_20
u466_21:
	goto	i1l3861
u466_20:
	
i1l11783:	
	bcf	0+(_Temp_595)+02h+(1/8),(1)&7	;volatile
	
i1l3861:	
	line	230
;LCD.c: 230: if(display[2] & 0B00000100) {Temp_595[2] &=~(1<<2);}
	btfss	0+(_display)+02h,(2)&7	;volatile
	goto	u467_21
	goto	u467_20
u467_21:
	goto	i1l3862
u467_20:
	
i1l11785:	
	bcf	0+(_Temp_595)+02h+(2/8),(2)&7	;volatile
	
i1l3862:	
	line	231
;LCD.c: 231: if(display[2] & 0B00010000) {Temp_595[2] &=~(1<<5);}
	btfss	0+(_display)+02h,(4)&7	;volatile
	goto	u468_21
	goto	u468_20
u468_21:
	goto	i1l3863
u468_20:
	
i1l11787:	
	bcf	0+(_Temp_595)+02h+(5/8),(5)&7	;volatile
	
i1l3863:	
	line	232
;LCD.c: 232: if(display[1] & 0B00000100) {Temp_595[2] &=~(1<<4);}
	btfss	0+(_display)+01h,(2)&7	;volatile
	goto	u469_21
	goto	u469_20
u469_21:
	goto	i1l3864
u469_20:
	
i1l11789:	
	bcf	0+(_Temp_595)+02h+(4/8),(4)&7	;volatile
	
i1l3864:	
	line	233
;LCD.c: 233: if(display[1] & 0B00010000) {Temp_595[2] &=~(1<<3);}
	btfss	0+(_display)+01h,(4)&7	;volatile
	goto	u470_21
	goto	u470_20
u470_21:
	goto	i1l11793
u470_20:
	
i1l11791:	
	bcf	0+(_Temp_595)+02h+(3/8),(3)&7	;volatile
	line	235
	
i1l11793:	
;LCD.c: 235: _74HC595_SET();
	fcall	i1__74HC595_SET
	line	237
	
i1l11795:	
;LCD.c: 237: COMEN =0B00101100;
	movlw	(02Ch)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	238
	
i1l11797:	
;LCD.c: 238: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	line	239
	
i1l11799:	
;LCD.c: 239: TRISC = 0B10101100;
	movlw	(0ACh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	240
	
i1l11801:	
;LCD.c: 240: RC4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(60/8),(60)&7
	line	241
;LCD.c: 241: break;
	goto	i1l11859
	line	243
;LCD.c: 243: case 6:
	
i1l3866:	
	line	245
;LCD.c: 245: if(display[0] & 0B00001000) {Temp_595[2]|=1<<6;}
	btfss	(_display),(3)&7
	goto	u471_21
	goto	u471_20
u471_21:
	goto	i1l3867
u471_20:
	
i1l11803:	
	bsf	0+(_Temp_595)+02h+(6/8),(6)&7	;volatile
	
i1l3867:	
	line	246
;LCD.c: 246: if(display[1] & 0B00001000) {Temp_595[2]|=1<<3;}
	btfss	0+(_display)+01h,(3)&7	;volatile
	goto	u472_21
	goto	u472_20
u472_21:
	goto	i1l3868
u472_20:
	
i1l11805:	
	bsf	0+(_Temp_595)+02h+(3/8),(3)&7	;volatile
	
i1l3868:	
	line	247
;LCD.c: 247: if(display[2] & 0B00001000) {Temp_595[2]|=1<<5;}
	btfss	0+(_display)+02h,(3)&7	;volatile
	goto	u473_21
	goto	u473_20
u473_21:
	goto	i1l3869
u473_20:
	
i1l11807:	
	bsf	0+(_Temp_595)+02h+(5/8),(5)&7	;volatile
	
i1l3869:	
	line	248
;LCD.c: 248: if(display[3] & 0B00001000) {Temp_595[2]|=1<<1;}
	btfss	0+(_display)+03h,(3)&7	;volatile
	goto	u474_21
	goto	u474_20
u474_21:
	goto	i1l3870
u474_20:
	
i1l11809:	
	bsf	0+(_Temp_595)+02h+(1/8),(1)&7	;volatile
	
i1l3870:	
	line	250
;LCD.c: 250: if(display[4] & 0X01) {Temp_595[2]|=1<<7;}
	btfss	0+(_display)+04h,(0)&7	;volatile
	goto	u475_21
	goto	u475_20
u475_21:
	goto	i1l3871
u475_20:
	
i1l11811:	
	bsf	0+(_Temp_595)+02h+(7/8),(7)&7	;volatile
	
i1l3871:	
	line	251
;LCD.c: 251: if(display[4] & 0X02) {Temp_595[2]|=1<<0;}
	btfss	0+(_display)+04h,(1)&7	;volatile
	goto	u476_21
	goto	u476_20
u476_21:
	goto	i1l3872
u476_20:
	
i1l11813:	
	bsf	0+(_Temp_595)+02h+(0/8),(0)&7	;volatile
	
i1l3872:	
	line	252
;LCD.c: 252: if(display[4] & 0X04) {Temp_595[2]|=1<<2;;}
	btfss	0+(_display)+04h,(2)&7	;volatile
	goto	u477_21
	goto	u477_20
u477_21:
	goto	i1l3873
u477_20:
	
i1l11815:	
	bsf	0+(_Temp_595)+02h+(2/8),(2)&7	;volatile
	
i1l3873:	
	line	253
;LCD.c: 253: if(display[4] & 0X08) {Temp_595[2]|=1<<4;}
	btfss	0+(_display)+04h,(3)&7	;volatile
	goto	u478_21
	goto	u478_20
u478_21:
	goto	i1l11819
u478_20:
	
i1l11817:	
	bsf	0+(_Temp_595)+02h+(4/8),(4)&7	;volatile
	line	255
	
i1l11819:	
;LCD.c: 255: _74HC595_SET();
	fcall	i1__74HC595_SET
	line	257
	
i1l11821:	
;LCD.c: 257: COMEN =0B00011100;
	movlw	(01Ch)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	258
	
i1l11823:	
;LCD.c: 258: RC5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(61/8),(61)&7
	line	259
	
i1l11825:	
;LCD.c: 259: TRISC = 0B10011100;
	movlw	(09Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	260
	
i1l11827:	
;LCD.c: 260: RC5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(61/8),(61)&7
	line	261
;LCD.c: 261: break;
	goto	i1l11859
	line	262
;LCD.c: 262: case 7:
	
i1l3875:	
	line	264
;LCD.c: 264: if(display[0] & 0B00001000) {Temp_595[2] &=~(1<<6);}
	btfss	(_display),(3)&7
	goto	u479_21
	goto	u479_20
u479_21:
	goto	i1l3876
u479_20:
	
i1l11829:	
	bcf	0+(_Temp_595)+02h+(6/8),(6)&7	;volatile
	
i1l3876:	
	line	265
;LCD.c: 265: if(display[1] & 0B00001000) {Temp_595[2] &=~(1<<3);}
	btfss	0+(_display)+01h,(3)&7	;volatile
	goto	u480_21
	goto	u480_20
u480_21:
	goto	i1l3877
u480_20:
	
i1l11831:	
	bcf	0+(_Temp_595)+02h+(3/8),(3)&7	;volatile
	
i1l3877:	
	line	266
;LCD.c: 266: if(display[2] & 0B00001000) {Temp_595[2] &=~(1<<5);}
	btfss	0+(_display)+02h,(3)&7	;volatile
	goto	u481_21
	goto	u481_20
u481_21:
	goto	i1l3878
u481_20:
	
i1l11833:	
	bcf	0+(_Temp_595)+02h+(5/8),(5)&7	;volatile
	
i1l3878:	
	line	267
;LCD.c: 267: if(display[3] & 0B00001000) {Temp_595[2] &=~(1<<1);}
	btfss	0+(_display)+03h,(3)&7	;volatile
	goto	u482_21
	goto	u482_20
u482_21:
	goto	i1l3879
u482_20:
	
i1l11835:	
	bcf	0+(_Temp_595)+02h+(1/8),(1)&7	;volatile
	
i1l3879:	
	line	269
;LCD.c: 269: if(display[4] & 0X01) {Temp_595[2] &=~(1<<7);}
	btfss	0+(_display)+04h,(0)&7	;volatile
	goto	u483_21
	goto	u483_20
u483_21:
	goto	i1l3880
u483_20:
	
i1l11837:	
	bcf	0+(_Temp_595)+02h+(7/8),(7)&7	;volatile
	
i1l3880:	
	line	270
;LCD.c: 270: if(display[4] & 0X02) {Temp_595[2] &=~(1<<0);}
	btfss	0+(_display)+04h,(1)&7	;volatile
	goto	u484_21
	goto	u484_20
u484_21:
	goto	i1l3881
u484_20:
	
i1l11839:	
	bcf	0+(_Temp_595)+02h+(0/8),(0)&7	;volatile
	
i1l3881:	
	line	271
;LCD.c: 271: if(display[4] & 0X04) {Temp_595[2] &=~(1<<2);}
	btfss	0+(_display)+04h,(2)&7	;volatile
	goto	u485_21
	goto	u485_20
u485_21:
	goto	i1l3882
u485_20:
	
i1l11841:	
	bcf	0+(_Temp_595)+02h+(2/8),(2)&7	;volatile
	
i1l3882:	
	line	272
;LCD.c: 272: if(display[4] & 0X08) {Temp_595[2] &=~(1<<4);}
	btfss	0+(_display)+04h,(3)&7	;volatile
	goto	u486_21
	goto	u486_20
u486_21:
	goto	i1l11845
u486_20:
	
i1l11843:	
	bcf	0+(_Temp_595)+02h+(4/8),(4)&7	;volatile
	line	274
	
i1l11845:	
;LCD.c: 274: _74HC595_SET();
	fcall	i1__74HC595_SET
	line	276
	
i1l11847:	
;LCD.c: 276: COMEN =0B00011100;
	movlw	(01Ch)
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movwf	(407)^0180h	;volatile
	line	277
	
i1l11849:	
;LCD.c: 277: RC5 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(61/8),(61)&7
	line	278
	
i1l11851:	
;LCD.c: 278: TRISC = 0B10011100;
	movlw	(09Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	279
	
i1l11853:	
;LCD.c: 279: RC5 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(61/8),(61)&7
	line	280
;LCD.c: 280: break;
	goto	i1l11859
	line	128
	
i1l11857:	
	movf	(_com_count),w	;volatile
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 0 to 7
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           25    13 (average)
; direct_byte           32     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable            12     6 (fixed)
; spacedrange           22     9 (fixed)
; locatedrange           8     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	i1l3811
	xorlw	1^0	; case 1
	skipnz
	goto	i1l3821
	xorlw	2^1	; case 2
	skipnz
	goto	i1l3830
	xorlw	3^2	; case 3
	skipnz
	goto	i1l3839
	xorlw	4^3	; case 4
	skipnz
	goto	i1l3848
	xorlw	5^4	; case 5
	skipnz
	goto	i1l3857
	xorlw	6^5	; case 6
	skipnz
	goto	i1l3866
	xorlw	7^6	; case 7
	skipnz
	goto	i1l3875
	goto	i1l11859
	opt asmopt_on

	line	283
	
i1l11859:	
;LCD.c: 283: com_count++;
	incf	(_com_count),f	;volatile
	line	284
	
i1l11861:	
;LCD.c: 284: if( com_count>=8)
	movlw	(08h)
	subwf	(_com_count),w	;volatile
	skipc
	goto	u487_21
	goto	u487_20
u487_21:
	goto	i1l3885
u487_20:
	line	286
	
i1l11863:	
;LCD.c: 285: {
;LCD.c: 286: com_count = 0;
	clrf	(_com_count)	;volatile
	line	288
	
i1l3885:	
	return
	opt stack 0
GLOBAL	__end_of_Set_Disp
	__end_of_Set_Disp:
;; =============== function _Set_Disp ends ============

	signat	_Set_Disp,88
	global	i1__74HC595_SET
psect	text1304,local,class=CODE,delta=2
global __ptext1304
__ptext1304:

;; *************** function i1__74HC595_SET *****************
;; Defined at:
;;		line 6 in file "E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\74HC595.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  _74HC595_SET    1    2[COMMON] char 
;;  _74HC595_SET    1    1[COMMON] char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Set_Disp
;; This function uses a non-reentrant model
;;
psect	text1304
	file	"E:\BBA'DATA\美芯电子产品程序\咖啡机\V4.7\74HC595.c"
	line	6
	global	__size_ofi1__74HC595_SET
	__size_ofi1__74HC595_SET	equ	__end_ofi1__74HC595_SET-i1__74HC595_SET
	
i1__74HC595_SET:	
	opt	stack 1
; Regs used in i1__74HC595_SET: [wreg-fsr0h+status,2+status,0]
	line	8
	
i1l12647:	
;74HC595.c: 7: signed char i,j;
;74HC595.c: 8: for(i=0;i<3;i++)
	clrf	(i1__74HC595_SET@i)
	line	9
	
i1l12653:	
;74HC595.c: 9: for(j=0;j<8;j++)
	clrf	(i1__74HC595_SET@j)
	line	11
	
i1l12659:	
;74HC595.c: 10: {
;74HC595.c: 11: if(Temp_595[i]&(1<<j))
	movf	(i1__74HC595_SET@i),w
	addlw	_Temp_595&0ffh
	movwf	fsr0
	movlw	(01h)
	movwf	(??i1__74HC595_SET+0)+0
	incf	(i1__74HC595_SET@j),w
	goto	u623_24
u623_25:
	clrc
	rlf	(??i1__74HC595_SET+0)+0,f
u623_24:
	addlw	-1
	skipz
	goto	u623_25
	movf	0+(??i1__74HC595_SET+0)+0,w
	bcf	status, 7	;select IRP bank0
	andwf	indf,w
	btfsc	status,2
	goto	u624_21
	goto	u624_20
u624_21:
	goto	i1l2552
u624_20:
	line	13
	
i1l12661:	
;74HC595.c: 12: {
;74HC595.c: 13: RE3=1;
	bsf	(75/8),(75)&7
	line	14
;74HC595.c: 14: }
	goto	i1l2553
	line	15
	
i1l2552:	
	line	17
;74HC595.c: 15: else
;74HC595.c: 16: {
;74HC595.c: 17: RE3=0;
	bcf	(75/8),(75)&7
	line	18
	
i1l2553:	
	line	19
;74HC595.c: 18: }
;74HC595.c: 19: RC1=1;
	bsf	(57/8),(57)&7
	line	20
;74HC595.c: 20: RC1=0;
	bcf	(57/8),(57)&7
	line	9
	
i1l12663:	
	incf	(i1__74HC595_SET@j),f
	
i1l12665:	
	movf	(i1__74HC595_SET@j),w
	xorlw	80h
	addlw	-((08h)^80h)
	skipc
	goto	u625_21
	goto	u625_20
u625_21:
	goto	i1l12659
u625_20:
	line	8
	
i1l12667:	
	incf	(i1__74HC595_SET@i),f
	
i1l12669:	
	movf	(i1__74HC595_SET@i),w
	xorlw	80h
	addlw	-((03h)^80h)
	skipc
	goto	u626_21
	goto	u626_20
u626_21:
	goto	i1l12653
u626_20:
	
i1l2549:	
	line	23
;74HC595.c: 21: }
;74HC595.c: 23: RC6=1;
	bsf	(62/8),(62)&7
	line	24
;74HC595.c: 24: RC6=0;
	bcf	(62/8),(62)&7
	line	25
	
i1l2554:	
	return
	opt stack 0
GLOBAL	__end_ofi1__74HC595_SET
	__end_ofi1__74HC595_SET:
;; =============== function i1__74HC595_SET ends ============

	signat	i1__74HC595_SET,88
psect	text1305,local,class=CODE,delta=2
global __ptext1305
__ptext1305:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
