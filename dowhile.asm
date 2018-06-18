%include "asm_io.inc"

%macro du 0
	%push du
	%$begin:
%endmacro

%macro while 1
	j%+1 %$begin
    %pop
%endmacro

segment .data
	msg db 'Hello World', 0Ah

segment .text
	global main

	main:
	    enter 0,0
	    pusha

	    mov di, 5

	    du
	        mov edx, 13
	    	mov ecx, msg
	    	mov ebx, 1
	    	mov eax, 4
	    	int 80h
	        dec di
	    while ne
	    
	    popa
	    mov eax, 0
	    leave
	    ret