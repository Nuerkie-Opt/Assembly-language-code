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
    write_string timeMsg, timeMsgLen
    read_input num

    write_string stopMsg, stopMsgLen
    read_input num
    
    mov dl, [num]
	cmp dl,[stopOpt]
	JE n1

n1: write_string offMsg, offMsgLen
    JE exit

exit:   ;System Exit
		mov eax,1
		int 0x80


segment .bss
    num resb 5

segment .data
    ;Enter time
    timeMsg: db "Enter Time and press enter to start", 0xA
    timeMsgLen: equ $ - timeMsg

    ;Stop
    stopMsg: db "Press 1 to stop", 0xA
    stopMsgLen: equ $ - stopMsg

    ;Off message
    offMsg: db "Microwave is off", 0xA
    offMsgLen: equ $ - offMsg

    ;Exit message
    exitMsg: db "Exiting...", 0xA
    exitMsgLen: equ - exitMsg
    
    ;Option value
    stopOpt dd '1'
    

