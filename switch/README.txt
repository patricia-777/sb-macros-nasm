nasm -f elf switch.asm

gcc -o switch switch.o asm.c asm_io.o

./switch
