PRO = primes
OBJ = ${PRO}.o
LNK = gcc -gdwarf
.PHONY: nasm clean
nasm: ${PRO}.asm
	nasm -f elf64 -g -F dwarf $^
	${LNK} ${OBJ} -o $@
clean:
	${RM} ${OBJ} nasm
