%macro write_string 2
    mov eax,4
	mov ebx,1
	mov ecx, %1
	mov edx, %2
	int 0x80
%endmacro

%macro read_input 1
    ;Read Option Entered by user
	mov eax,3
	mov ebx,2
	mov ecx, %1
	mov edx,5
	int 0x80
%endmacro

segment .text
    global _start
_start:
    write_string MenuMsg, MenuMsgLen
    write_string washOptMsg, washOptMsgLen
    write_string rinseOptMsg, rinseOptMsgLen
    write_string spinOptMsg, spinOptMsgLen
    write_string offOptMsg, offOptMsgLen

    read_input num

    mov dl, [num]
	cmp dl,[washOpt]
	JE n1

    mov dl, [num]
	cmp dl,[rinseOpt]
	JE n2

    mov dl, [num]
	cmp dl,[spinOpt]
	JE n3

    mov dl, [num]
	cmp dl,[offOpt]
	JE n4

n1: write_string washMsg, washMsgLen
    write_string stopOptMsg, stopOptMsgLen

    read_input num

    mov dl, [num]
	cmp dl,[stopOpt]
	JE n5

n2: write_string rinseMsg, rinseMsgLen
    read_input num

    mov dl, [num]
	cmp dl,[stopOpt]
	JE n5

n3: write_string spinMsg, spinMsgLen
    read_input num

    mov dl, [num]
	cmp dl,[stopOpt]
	JE n5

n4: write_string offMsg, offMsgLen
    JE exit

n5: write_string stopMsg, stopMsgLen
    JE _start
    
exit:   ;System Exit
		mov eax,1
		int 0x80

segment .bss
    num resb 5

segment .data
    ;Initail message
	MenuMsg: db "Select a number from the menu below",0xA
	MenuMsgLen: equ $-MenuMsg

    ;Wash Option
    washOptMsg: db "1. Wash", 0xA
    washOptMsgLen: equ $ - washOptMsg

    ;Rinse Option
    rinseOptMsg: db "2. Rinse", 0xA
    rinseOptMsgLen: equ $ - rinseOptMsg

    ;Spin Option
    spinOptMsg: db "3. Spin", 0xA
    spinOptMsgLen: equ $ - spinOptMsg

    ;Off Option
    offOptMsg: db "4. Off", 0xA
    offOptMsgLen: equ $ - offOptMsg

    ;Stop Option
    stopOptMsg: db "Press 1 to stop", 0xA
    stopOptMsgLen: equ $ - stopOptMsg
    
    ;Wash Message
    washMsg: db "Washing in progress...",0xA
    washMsgLen: equ $ - washMsg

    ;Rinse Message
    rinseMsg: db "Rinse in progress...", 0xA
    rinseMsgLen: equ $ - rinseMsg

    ;Spin Message
    spinMsg: db "Spin in progress...", 0xA
    spinMsgLen: equ $ - spinMsg

    ;Off Message
    offMsg: db "Off in progress...", 0xA
    offMsgLen: equ $ - offMsg

    ;Stop Message
    stopMsg: db "Stopping... Done", 0xA
    stopMsgLen: equ $ - stopMsg
    

    ;Option Value
    washOpt dd '1'
    rinseOpt dd '2'
    spinOpt dd '3'
    offOpt dd '4'

    stopOpt dd '1'

    


    




