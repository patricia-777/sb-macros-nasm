%include "asm_io.inc"		; inclui biblioteca que auxilia no output

%macro du 0					; macro equivalente ao 'do', com grafia diferente para evitar conflito com palavra reservada
	%push du 				; empilha o contexto
	%$begin:				; define a label 'begin'
%endmacro

%macro while 1
	j%+1 %$begin			; volta para a label begin, dando continuidade ao loop, se o condition code for atendido
    %pop 					; desempilha o contexto
%endmacro

segment .text
	global main

	main:
	    enter 0,0			; setup routine
	    pusha

	    mov edi, 10

	    du
	    	mov eax, edi	; prepara o numero do loop para ser impresso na tela
	        call print_int	; imprime o numero
	        call print_nl	; imprime uma nova linha
	        dec edi			; decrementa o numero do loop
	    while ne
	    
	    popa
	    mov eax, 0			; retorna
	    leave
	    ret