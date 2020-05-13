segment .text
	global _start
_start:
	;Display Options

	mov eax,4
	mov ebx,1
	mov ecx,mainMsg
	mov edx,mainMsgLen
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx,OnOpt
	mov edx,OnOptLen
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx,OffOpt
	mov edx,OffOptLen
	int 0x80


	mov eax,4
	mov ebx,1
	mov ecx,CoolOpt
	mov edx,CoolOptLen
	int 0x80


	mov eax,4
	mov ebx,1
	mov ecx,TempOpt1
	mov edx,TempOpt1Len
	int 0x80


	mov eax,4
	mov ebx,1
	mov ecx,TempOpt2
	mov edx,TempOpt2Len
	int 0x80



	mov eax,4
	mov ebx,1
	mov ecx,AutoOpt
	mov edx,AutoOptLen
	int 0x80


	mov eax,4
	mov ebx,1
	mov ecx,HeatOpt
	mov edx,HeatOptLen
	int 0x80


	mov eax,4
	mov ebx,1
	mov ecx,DryOpt
	mov edx,DryOptLen
	int 0x80

;Read Option Entered by user
	mov eax,3
	mov ebx,0
	mov ecx,num
	mov edx,5
	int 0x80
	

    mov dl,[num]
	cmp dl,[on]
	JE n1


	mov dl,[num]
	cmp dl,[off]
	JE n2
	
	mov dl,[num]
	cmp dl,[cool]
	JE n3
	
	mov dl,[num]
	cmp dl,[incr]
	JE n4
	
	mov dl,[num]
	cmp dl,[decr]
	JE n5

	mov dl,[num]
	cmp dl,[auto]
	JE n6

	mov dl,[num]
	cmp dl,[heat]
	JE n7
	
	mov dl,[num]
	cmp dl,[dry]
	JE n8

n1:
	mov eax,4
	mov ebx,1
	mov ecx,OnMsg 
	mov edx,OnMsgLen
	int 0x80

    mov eax,4
	mov ebx,1
	mov ecx,TurnOffYESMsg 
	mov edx,TurnOffYESMsgLen
	int 0x80

    mov eax,3
	mov ebx,2
	mov ecx,num1
	mov edx,5
	int 0x80

    mov dl, [num1]
	cmp dl,[TurnOffYES]
	JE n2

n2:	
	mov eax,4
	mov ebx,1
	mov ecx,OffMsg
	mov edx,OffMsgLen
	int 0x80

       ;System Exit
		mov eax,1
		int 0x80

	

n3:	mov eax,4
	mov ebx,1
	mov ecx,CoolMsg
	mov edx,CoolMsgLen
	int 0x80


    mov eax,4
	mov ebx,1
	mov ecx,TurnOffYESMsg 
	mov edx,TurnOffYESMsgLen
	int 0x80

    mov eax,3
	mov ebx,2
	mov ecx,num1
	mov edx,5
	int 0x80

    mov dl, [num1]
	cmp dl,[TurnOffYES]
	JE n2



n4:	mov eax,4
	mov ebx,1
	mov ecx,IncreaseMsg
	mov edx,IncreaseMsgLen
	int 0x80


    mov eax,4
	mov ebx,1
	mov ecx,TurnOffYESMsg 
	mov edx,TurnOffYESMsgLen
	int 0x80

     mov eax,3
	mov ebx,2
	mov ecx,num1
	mov edx,5
	int 0x80

    mov dl, [num1]
	cmp dl,[TurnOffYES]
	JE n2


n5:
	mov eax,4
	mov ebx,1
	mov ecx,DecreaseMsg
	mov edx,DecreaseMsgLen
	int 0x80


    mov eax,4
	mov ebx,1
	mov ecx,TurnOffYESMsg 
	mov edx,TurnOffYESMsgLen
	int 0x80

    mov eax,3
	mov ebx,2
	mov ecx,num1
	mov edx,5
	int 0x80

    mov dl, [num1]
	cmp dl,[TurnOffYES]
	JE n2


	
n6:
	mov eax,4
	mov ebx,1
	mov ecx,AutoMsg
	mov edx,AutoMsgLen
	int 0x80


    mov eax,4
	mov ebx,1
	mov ecx,TurnOffYESMsg 
	mov edx,TurnOffYESMsgLen
	int 0x80

    mov eax,3
	mov ebx,2
	mov ecx,num1
	mov edx,5
	int 0x80

    mov dl, [num1]
	cmp dl,[TurnOffYES]
	JE n2


n7:
	mov eax,4
	mov ebx,1
	mov ecx,HeatMsg
	mov edx,HeatMsgLen
	int 0x80


    mov eax,4
	mov ebx,1
	mov ecx,TurnOffYESMsg 
	mov edx,TurnOffYESMsgLen
	int 0x80

     mov eax,3
	mov ebx,2
	mov ecx,num1
	mov edx,5
	int 0x80

    mov dl, [num1]
	cmp dl,[TurnOffYES]
	JE n2




n8: 
	mov eax,4
	mov ebx,1
	mov ecx,DryMsg
	mov edx,DryMsgLen
	int 0x80


    mov eax,4
	mov ebx,1
	mov ecx,TurnOffYESMsg 
	mov edx,TurnOffYESMsgLen
	int 0x80

     mov eax,3
	mov ebx,2
	mov ecx,num1
	mov edx,5
	int 0x80

    mov dl, [num1]
	cmp dl,[TurnOffYES]
	JE n2




segment .data

;Display options
mainMsg: db "Choose an option from the list below",0xa,0xd
mainMsgLen: equ $-mainMsg

OnOpt: db "1. On",0xA
OnOptLen: equ $-OnOpt

OffOpt: db "2. Off",0xA
OffOptLen: equ $-OffOpt

CoolOpt: db "3. Cool",0xA
CoolOptLen: equ $-CoolOpt 

TempOpt1: db "4. Increase Temperature",0xA
TempOpt1Len: equ $-TempOpt1

TempOpt2: db "5. Decrease Temperature",0xA
TempOpt2Len: equ $-TempOpt2


AutoOpt: db "6. Auto",0xA
AutoOptLen: equ $-AutoOpt

HeatOpt: db "7. Heat",0xA
HeatOptLen: equ $-HeatOpt

DryOpt: db "8. Dry",0xA
DryOptLen: equ $-DryOpt 

;Assigning corresponding values of options to variable evaluation 
on dd '1'
off dd '2'
cool dd '3'
incr dd '4'
decr dd '5'
auto dd '6'
heat dd '7'
dry dd '8'
TurnOffYES dd '1'


;Display Message for selected option
OnMsg: db " Air condition is ON ",0xA
OnMsgLen: equ $-OnMsg

OffMsg: db " Air condition is Going OFF",0xA
OffMsgLen: equ $-OffMsg

CoolMsg: db " AC on cooling MODE",0xA
CoolMsgLen: equ $-CoolMsg

IncreaseMsg: db "New Temperature(Celsius) is ",0xA
IncreaseMsgLen: equ $-IncreaseMsg

DecreaseMsg: db "New Temperature(Celsius) is ",0xA
DecreaseMsgLen: equ $-DecreaseMsg

AutoMsg: db " AC on Auto MODE",0xA
AutoMsgLen: equ $-AutoMsg

HeatMsg: db " AC on Heat MODE" ,0xA
HeatMsgLen: equ $-HeatMsg

DryMsg: db  " AC on Dry MODE" ,0xA
DryMsgLen: equ $-DryMsg

TurnOffYESMsg: db "Press 1 To Turn The AC Off", 0xA
TurnOffYESMsgLen: equ $-TurnOffYES
segment .bss
	num resb 1
    num1 resb 1
