


segment .bss
	num resb 5
	num1 resb 5
    num2 resb 5

segment .text
	global _start
_start:

	;Display Options 
	mov eax,4
	mov ebx,1
	mov ecx,MenuMsg
	mov edx,MenuMsgLen
	int 0x80
	
	mov eax,4
	mov ebx,1
	mov ecx,OptOn
	mov edx,OptOnLen
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx,OptOff
	mov edx,OptOffLen
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx,OptHibernate 
	mov edx,OptHibernateLen
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx,OptSource
	mov edx,OptSourceLen
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx,OptExit
	mov edx,OptExitLen
	int 0x80

	mov eax,4
	mov ebx,1
	mov ecx,OptHelp
	mov edx,OptHelpLen
	int 0x80
	
	;Read Option Entered by user
	mov eax,3
	mov ebx,0
	mov ecx,num
	mov edx,5
	int 0x80
	
	;compare number to options

	mov dl, [num]
	cmp dl,[On]
	JE n1
	
	mov dl, [num]
	cmp dl,[Off]
	JE n2
	
	mov dl, [num]
	cmp dl,[Hibernate]
	JE n3
	
	mov dl, [num]
	cmp dl,[Source]
	JE n4

	mov dl, [num]
	cmp dl,[EXITmode]
	JE n5
	
	mov dl, [num]
	cmp dl,[Help]
	JE n6
	
	;If true then jump to the appropriate option

n1:	mov eax,4
		mov ebx,1
		mov ecx,onmessage
		mov edx,onmessage_L
		int 0x80
		
		;System Exit
		mov eax,1
		int 0x80

	
n2:	mov eax,4
		mov ebx,1
		mov ecx,offmessage
		mov edx,offmessage_L
		int 0x80
		
		;System Exit
		mov eax,1
		int 0x80


n3:	mov eax,4
			mov ebx,1
			mov ecx,hibernatemessage
			mov edx,hibernatemessage_L
			int 0x80
			
			;System Exit
			mov eax,1
			int 0x80


n4:	mov eax,4
	mov ebx,1
	mov ecx,SourceMessage0
	mov edx,SourceMessage_L0
	int 0x80


	mov eax,4
	mov ebx,1
	mov ecx,SourceMessage1
	mov edx,SourceMessage_L1
	int 0x80
	
	mov eax,4
	mov ebx,1
	mov ecx,SourceMessage2
	mov edx,SourceMessage_L2
	int 0x80	
	
	mov eax,4
	mov ebx,1
	mov ecx,SourceMessage3
	mov edx,SourceMessage_L3
	int 0x80	
	

	mov eax,4
	mov ebx,1
	mov ecx,SourceMessage4
	mov edx,SourceMessage_L4
	int 0x80	

	;Read Option Entered by user
	mov eax,3
	mov ebx,2
	mov ecx,num1
	mov edx,5
	int 0x80


	mov dl, [num1]
	cmp dl,[HDMI]
	JE n7
	
	mov dl, [num1]
	cmp dl,[USB]
	JE n8
	
	mov dl, [num1]
	cmp dl,[LAN]
	JE n9
	
	mov dl, [num1]
	cmp dl,[Computer]
	JE n10

n7:	
	;Valdate input
	mov dh, [num1]
	cmp dh,[HDMI]
	mov eax,4
	mov ebx,1
	mov ecx,HDMImessage
	mov edx,HDMImessageLen
	int 0x80

    mov eax,4
    mov ebx,1
	mov ecx,ExitMessage2
	mov edx,ExitMessage_L2
	int 0x80

    ;Read Option Entered by user
	mov eax,3
	mov ebx,2
	mov ecx,num2
	mov edx,5
	int 0x80

    mov dl, [num2]
	cmp dl,[ExitYES]
	JE n5
	

n8:
	mov dh, [num1]
	cmp dh,[USB]
	mov eax,4
	mov ebx,1
	mov ecx,USBmessage
	mov edx,USBmessageLen
	int 0x80

    mov eax,4
    mov ebx,1
	mov ecx,ExitMessage2
	mov edx,ExitMessage_L2
	int 0x80
	
	;Read Option Entered by user
	mov eax,3
	mov ebx,2
	mov ecx,num2
	mov edx,5
	int 0x80

    mov dl, [num2]
	cmp dl,[ExitYES]
	JE n5
n9:
	mov dh, [num1]
	cmp dh,[LAN]
	mov eax,4
	mov ebx,1
	mov ecx,LANmessage
	mov edx,LANmessageLen
	int 0x80

    mov eax,4
    mov ebx,1
	mov ecx,ExitMessage2
	mov edx,ExitMessage_L2
	int 0x80

    ;Read Option Entered by user
	mov eax,3
	mov ebx,2
	mov ecx,num2
	mov edx,5
	int 0x80
	
    mov dl, [num2]
	cmp dl,[ExitYES]
	JE n5
	
n10:
	mov dh, [num1]
	cmp dh,[Computer]
	mov eax,4
	mov ebx,1
	mov ecx,Computermessage
	mov edx,ComputermessageLen
	int 0x80

    mov eax,4
    mov ebx,1
	mov ecx,ExitMessage2
	mov edx,ExitMessage_L2
	int 0x80

    ;Read Option Entered by user
	mov eax,3
	mov ebx,2
	mov ecx,num2
	mov edx,5
	int 0x80

    mov dl, [num2]
	cmp dl,[ExitYES]
	JE n5
	
	
	

n5:	mov eax,4
		mov ebx,1
		mov ecx,ExitMessage
		mov edx,ExitMessage_L
		int 0x80
	
		;System Exit
		mov eax,1
		int 0x80

n6:	mov eax,4
	mov ebx,1
	mov ecx,HelpMessage
	mov edx,HelpMessageLen
	int 0x80
	;System Exit
	mov eax,1
	int 0x80




segment .data

	;Initail message
	MenuMsg: db "Select a number from the menu below",0xA
	MenuMsgLen: equ $-MenuMsg

	;On option
	OptOn: db "1. Turn on the projector",0xA
	OptOnLen: equ $-OptOn

	;Off option
	OptOff: db "2. Turn off the projector",0xA
	OptOffLen: equ $-OptOff

	;Hibernate option
	OptHibernate: db "3. Change mode to hibernation",0xA
	OptHibernateLen: equ $-OptHibernate 

	;Source option
	OptSource: db "4. Source",0xA 
	OptSourceLen: equ $-OptSource

	;Exit option
	OptExit: db "5. Exit",0xA
	OptExitLen: equ $-OptExit
	
	;Help option 
	OptHelp: db "6. Help",0xA
	OptHelpLen: equ $-OptHelp

	;Output messages

	onmessage: db "Projector is On",0xA
	onmessage_L: equ $- onmessage

	
	hibernatemessage: db "The system is now hibernating",0xA
	hibernatemessage_L: equ $-hibernatemessage

	
	offmessage: db "The projector is off",0xA
	offmessage_L: equ $- offmessage

	SourceMessage0: db "Choose one of the options below:",0xA
	SourceMessage_L0: equ $-SourceMessage0

	SourceMessage1: db "1. HDMI",0xA
	SourceMessage_L1: equ $-SourceMessage1
	
	SourceMessage2: db "2. USB",0xA
	SourceMessage_L2: equ $-SourceMessage2
    
    SourceMessage3: db "3. LAN",0xA
    SourceMessage_L3: equ $-SourceMessage3

    SourceMessage4: db "4. Computer",0xA
    SourceMessage_L4: equ $-SourceMessage4

	HDMImessage: db " HDMI source is now in use ",10
	HDMImessageLen: equ $-HDMImessage

	USBmessage: db " USB source is now in use ",10
	USBmessageLen: equ $-USBmessage

    LANmessage: db " LAN source is now in use ",10
	LANmessageLen: equ $-LANmessage

    Computermessage: db " Computer source is now in use ",10
	ComputermessageLen: equ $-Computermessage
	
	ExitMessage: db "Exiting",0xA,0xD
	ExitMessage_L: equ $-ExitMessage

    ExitMessage2: db "Do you want to exit? PRESS 1 for YES",0xA,0xD
	ExitMessage_L2: equ $-ExitMessage2
	
	HelpMessage: db " Welcome to our help page",0xA
	HelpMessageLen: equ $-HelpMessage
	
	;Assigning options values
	On dd '1'
	
	Off dd '2'
	
	Hibernate dd '3'
	
	Source dd '4'
	HDMI dd '1'
	USB dd '2'
    LAN dd '3'
    Computer dd '4'	
    
	ExitYES dd '1'
	EXITmode dd '5'

	Help dd '6'

