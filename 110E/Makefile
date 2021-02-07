PRO = Euclid
OBJ = ${PRO}.o
LNK = gcc -gdwarf

.PHONY: nasm clean

nasm: ${OBJ}
	${LNK} $^

${OBJ}: ${PRO}.asm
	nasm -f elf64 -g -F dwarf $<

gas: ${PRO}.s
	${LNK} $<

clean:
	$(RM) ${OBJ} a.out
