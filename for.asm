%include "asm_io.inc"

; Simulação de for com macros ==> for(i = a, i != b, i += c)
; Programa recebe 3 valores:
; eax = valor inicial de i
; ebx = valor final de i
; ecx = valor que será somado a i ao final de cada iteração
; Será mostrada uma mensagem a cada iteração e o valor de i

	%macro for 3				; for com 3 argumentos
		%push for
		mov eax, %1				; Valor de inicialização
		mov ebx, %2				; Valor final da variável de iteração
		mov ecx, %3				; Valor que será somado a cada iteração

		cmp eax, ebx			; Compara o valor inicial com o final
		je %$exitForLoop		; Se forem iguais, sai do for

		%$startForLoop:
	%endmacro

	%macro endFor 0
		%$endForLoop:
		add eax, ecx			; Antes da comparação o valor é incrementado
		cmp eax, ebx			; Compara o valor inicial com o final
		jne %$startForLoop	; Se não forem iguais, o for continua
		%$exitForLoop:
		%pop for
	%endmacro


section .data
	msg: db "Iteração #",0		; Mensagem que será repetida
	tamanho_msg: equ $-msg		; Tamanho da mensagem

section .text
global main
main:
    
	enter 0,0
	pusha

	xor edx, edx

	for 3,5,1 	; Inicia com 0, incrementa 1 e termina quando alcancar o valor 5
	 	mov  eax, msg
		call print_string
		inc  edx
	 	mov  eax, edx
		call print_int
		call print_nl
	endFor
						
	popa
	mov eax,0
	leave
	ret
