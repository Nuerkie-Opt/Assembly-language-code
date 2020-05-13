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
    write_string MP3OptMsg, MP3OptMsgLen
    write_string USBOptMsg, USBOptMsgLen
    write_string CDROMOptMsg, CDROMOptMsgLen
    write_string bluetoothOptMsg, bluetoothOptMsgLen
    write_string offOptMsg, offOptMsgLen

    read_input num
    
    mov dl, [num]
	cmp dl,[MP3Opt]
	JE n1

    mov dl, [num]
	cmp dl,[USBOpt]
	JE n2

    mov dl, [num]
	cmp dl,[CDROMOpt]
	JE n3

    mov dl, [num]
	cmp dl,[bluetoothOpt]
	JE n4

    mov dl, [num]
	cmp dl,[offOpt]
	JE n5

n1: write_string MP3Msg, MP3MsgLen
    write_string DoneMsg, DoneMsgLen
    JE n6

n2: write_string USBMsg, USBMsgLen
    write_string DoneMsg, DoneMsgLen
    JE n6

n3: write_string CDROMMsg, CDROMMsgLen
    write_string DoneMsg, DoneMsgLen
    JE n6

n4: write_string bluetoothMsg, bluetoothMsgLen
    JE n6

n5: write_string stopMsg, stopMsgLen
    JE exit

n6: write_string PlayOptMsg, PlayOptMsgLen
    write_string PauseOptMsg, PauseOptMsgLen
    write_string StopOptMsg, StopOptMsgLen

    read_input num

    mov dl, [num]
	cmp dl,[PlayOpt]
	JE n7
    
    mov dl, [num]
	cmp dl,[PauseOpt]
	JE n8

    mov dl, [num]
	cmp dl,[StopOpt]
	JE n9

n7: write_string PlayMsg, PlayMsgLen
    JE n10

n8: write_string PauseMsg, PauseMsgLen
    JE n11

n9: write_string stopMsg, stopMsgLen
    JE _start

n10: write_string PauseOptMsg, PauseOptMsgLen
     write_string StopOptMsg, StopOptMsgLen

    read_input num
    mov dl, [num]
	cmp dl,[PauseOpt]
	JE n8

    mov dl, [num]
	cmp dl,[StopOpt]
	JE n9

n11: write_string PlayOptMsg, PlayOptMsgLen
     write_string StopOptMsg, StopOptMsgLen
    
     read_input num

     mov dl, [num]
	 cmp dl,[PlayOpt]
	 JE n7
     
    mov dl, [num]
	cmp dl,[StopOpt]
	JE n9
    

    

exit:   ;System Exit
		mov eax,1
		int 0x80

segment .bss
    num resb 5

segment .data
    ;Initail message
	MenuMsg: db "Select a number from the menu below",0xA
	MenuMsgLen: equ $-MenuMsg

    ;Mp3 Option
    MP3OptMsg: db "1. MP3", 0xA
    MP3OptMsgLen: equ $ - MP3OptMsg


    ;USB Option
    USBOptMsg: db "2. USB", 0xA
    USBOptMsgLen: equ $ - USBOptMsg


    ;CD-ROM Option
    CDROMOptMsg: db "3. CD-ROM", 0xA
    CDROMOptMsgLen: equ $ - CDROMOptMsg

    ;Bluetooth Option
    bluetoothOptMsg: db "4. Bluetooth", 0xA
    bluetoothOptMsgLen: equ $ - bluetoothOptMsg

    ;Off Option
    offOptMsg: db "5. Turn Off", 0xA
    offOptMsgLen: equ $ - offOptMsg

    ;Play Option
    PlayOptMsg: db "1. Play", 0xA
    PlayOptMsgLen: equ $ - PlayOptMsg

    ;Pause Option
    PauseOptMsg: db "2. Pause", 0xA
    PauseOptMsgLen: equ $ - PauseOptMsg

    ;Stop Option
    StopOptMsg: db "3. Stop", 0xA
    StopOptMsgLen: equ $ - StopOptMsg



    ;Option Messages
    ;Mp3 Message
    MP3Msg: db "MP3 ready... Music Loading..", 0xA
    MP3MsgLen: equ $ - MP3Msg

    ;USB  Message
    USBMsg: db "USB ready... Music Loading ...", 0xA
    USBMsgLen: equ $ - USBMsg


    ;CD-ROM Message
    CDROMMsg: db "CD-ROM... Music loading...", 0xA
    CDROMMsgLen: equ $ - CDROMMsg


    ;Bluetooth Message
    bluetoothMsg: db "Bluetooth On", 0xA
    bluetoothMsgLen: equ $ - bluetoothMsg


    ;Off Message
    offMsg: db "Off in progress...", 0xA
    offMsgLen: equ $ - offMsg


    ;Play Message
    PlayMsg: db "Playing...", 0xA
    PlayMsgLen: equ $ - PlayMsg


    ;Pause Message
    PauseMsg: db "Paused...", 0xA
    PauseMsgLen: equ $ - PauseMsg


    ;Stop Message
    stopMsg: db "Stopping... Done", 0xA
    stopMsgLen: equ $ - stopMsg

    ;Done Message
    DoneMsg: db 'Done loading...', 0xA
    DoneMsgLen: equ $ - DoneMsg


    ;Option Value
    MP3Opt dd '1'
    USBOpt dd '2'
    CDROMOpt dd '3'
    bluetoothOpt dd '4'
    offOpt dd '5'

    PlayOpt dd '1'
    PauseOpt dd '2'
    StopOpt dd '3'
    




