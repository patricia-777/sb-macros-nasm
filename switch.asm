%include "asm_io.inc"

;
; inicializando os textos para printar na tela
;
segment .data

case0 db    "Numeros iguais", 0
case1 db    "Numeros com diferença de 1", 0


; area de codigo
segment .text
        global  asm_main
asm_main:
        enter   0,0
        pusha
	
    ;
    ;
    ;AREA DAS MACROS
    ;
    ;    


    ;macro que faz a funçao so switch
    ;guarda o valor da variavel em bx
	%macro switch 1

		%push switch
		mov bx,%1

	%endmacro


	;essa macro faz a funcao do case
	;compara o valor da variavel com o valor guardado em bx
	%macro case 1
	
		%push case
		cmp bx,%1
	
	%endmacro


	;essa macro termina o switch
	;ela popa os contextos switch ou case que estiverem na pilha
	;se nao ele deeflagra o erro
	%macro endswitch 0
		%ifctx switch
			%pop
		%elifctx case
			%pop
		%else
			%error "expected ‘switch’ or ‘case’ before ‘endswitch’"
		%endif
		
	%endmacro


	;macro que faz a função if
	;usado dentro do case
	%macro if 0
		%push if
		jne %$ifnot
	%endmacro


	;macro que faz a funcao do else
	%macro else 0
		%ifctx if
			%repl else
			jmp %$ifend
			%$ifnot:
		%else
			%error "expected ‘if’ before ‘else’"
		%endif
	%endmacro


	;terminar o if
	;popa o contexto do if ou do else
	%macro endif 0
		%ifctx if
			%$ifnot:
				%pop
		%elifctx else
			%$ifend:
				%pop
		%else
			%error "expected ‘if’ or ‘else’ before ‘endif’"
		%endif
	%endmacro


	;
	;
	;FIM DA AREA DE MACROS
	;
	;	


	mov ax,5
	mov cx,4
	
	sub ax,cx

	switch ax
		case 0
			if 
			 	mov	eax, case0	
				call	print_string
				call    print_nl
			endif

		case 1
			if 
				mov  	eax, case1
				call	print_string
				call    print_nl
			endif
			
	endswitch
        

	;retornando para o C
    popa
    mov	eax, 0           
    leave                     
    ret

