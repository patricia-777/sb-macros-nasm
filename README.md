# Macro do comando switch
(manter sempre os arquivos asm_io.inc, asm_io.asm, cdecl.h e asm_io.o) 

Comandos para compilar e rodar:
  
  nasm -f elf switch.asm
  
  gcc -o switch switch.o asm.c asm_io.o
  
  ./switch

# Macro do comando do while
Comando para montar o código assembly em um arquivo objeto ELF no formato dowhile.o (Unix)

nasm -f elf dowhile.asm
  
Comando para compilar o objeto da arquitetura i386 num ambiente i386:x86-64.
Necessário incluir asm_io.o para utilização das rotinas de output
  
gcc -m32 dowhile.o asm_io.o -o dowhile
