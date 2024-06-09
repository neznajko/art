OBJ = ${PRO}.o
SRC = ${PRO}.asm
LNK = gcc -gdwarf -Wl,-z,execstack

a.out: ${OBJ} 
	${LNK} $^
${OBJ}: ${SRC}
	nasm -i ../lib/ -f elf64 -g -F dwarf $<

.PHONY: clean
clean:
	$(RM) ${OBJ} a.out
