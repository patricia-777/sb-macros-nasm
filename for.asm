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

		push eax
		push ebx
		push ecx
		cmp eax, ebx			; Compara o valor inicial com o final
		je %$exitForLoop		; Se forem iguais, sai do for

		%$startForLoop:
	%endmacro

	%macro endfor 0
		pop ecx
		pop ebx
		pop eax
		add eax, ecx			; Antes da comparação o valor é incrementado
		cmp eax, ebx			; Compara o valor inicial com o final
		push eax
		push ebx
		push ecx

		jne %$startForLoop	; Se não forem iguais, o for continua
		%$exitForLoop:
		pop ecx
		pop ebx
		pop eax
		%pop for
	%endmacro

section .data
	msg: db "Cruzeiroooo!",0							; Mensagem que será repetida

section .text
global main
main:
    
	enter 0,0
	pusha

	for 0,8,2 	; Inicia com 0, incrementa de 2 em 2 e termina quando alcancar o valor 8
		mov eax, msg
		call print_string
		call print_nl
	endfor
						
	popa
	mov eax,0
	leave
	ret
