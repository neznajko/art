        .data
        .equ _bufSiz, 80 
_fomt:  .asciz "%d,"
        .lcomm _buf, _bufSiz
        .text
.macro  pushq
        push rax
        push rbx
        push rcx
        push rdx
        push rsi
        push rdi
        push r8
        push r9
        push r10
        push r11
        push r12
        push r13
        push r14
        push r15
.endm
.macro  popq
        pop r15
        pop r14
        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rdi
        pop rsi
        pop rdx
        pop rcx
        pop rbx
        pop rax
.endm
.macro  clear
        xor rax, rax
        xor rbx, rbx
        xor rcx, rcx
        xor rdx, rdx
        xor rsi, rsi
        xor rdi, rdi
        xor  r8,  r8
        xor  r9,  r9
        xor r10, r10
        xor r11, r11
        xor r12, r12
        xor r13, r13
        xor r14, r14
        xor r15, r15
.endm
/*------,,,,,,,,````````________========;;;;;;;;'''''''',,,,,,*/
/* Input: r12 - array of 32-bit( 4 bytes )numbers.
 *        r13 - its size
 * Output: None
 * Description: Prints the array on stdout.
 */
dmpArr: nop
        push %r12
        push %r13
        lea _buf(%rip), %rdi# sprintf fst arg
        xor %rdx, %rdx# clear trd arg
        # copy oppening [
        movb $'[, (%rdi)
        inc %rdi
        # loop over the array and chill
1:      lea _fomt(%rip), %rsi# se'cond
        mov (%r12), %edx# Lupin the third
        xor %rax, %rax# no vector args( whateva )
        and $-16, %rsp# (yeeaaahhhh)
        call sprintf@plt# ha-ha
        add $4, %r12
        dec %r13
        cmp $0, %r13
        jnz 1b
        # set closing ], and the null byte( word )
        movb $'], -1(%rdi)
        movw $0, (%rdi)
        # dump with puts
        lea _buf(%rip), %rdi #
        and $-16, %rsp       #
        call puts@plt        #
        pop %r13
        pop %r12
        ret
////////========,,,,,,,,````````########--------________********

