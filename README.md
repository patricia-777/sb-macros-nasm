# Macro da função switch
(manter sempre os arquivos asm_io.inc, asm_io.asm, cdecl.h e asm_io.o) 

Comandos para compilar e rodar:
  
  nasm -f elf switch.asm
  
  gcc -o switch switch.o asm.c asm_io.o
  
  ./switch
