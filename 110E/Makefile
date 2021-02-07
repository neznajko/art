PRO = Euclid
OBJ = ${PRO}.o
LNK = gcc -gdwarf
.PHONY: nasm gas cpp clean
nasm: 
	nasm -f elf64 -g -F dwarf ${PRO}.asm
	${LNK} ${OBJ}
gas: 
	${LNK} ${PRO}.s
cpp: 
	${LNK} ${PRO}.cpp
clean:
	$(RM) ${OBJ} a.out
