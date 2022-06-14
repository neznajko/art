////////--------,,,,,,,,````````........::::::::''''''''________
        .globl main
/*------,,,,,,,,````````________========;;;;;;;;'''''''',,,,,,*/
/* Input: r12 - array of 32-bit( 4 bytes ) numbers.
 *        r13 - its size
 * Output: None
 * Description: Prints the array on stdout.
 */
        .text
dmpArr: nop
        push %r12
        push %r13
        lea buf(%rip), %rdi# sprintf fst arg
        xor %rdx, %rdx# clear trd arg
        # copy oppening [
        movb $'[, (%rdi)
        inc %rdi
        # loop over the array and chill
1:      lea fomt(%rip), %rsi# se'cond
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
        lea buf(%rip), %rdi #
        and $-16, %rsp      #
        call puts@plt       #
        pop %r13
        pop %r12
        ret
main:   nop
        lea mixBas(%rip), %r15
        lea tuple(%rip), %r12
        mov $mixSiz, %r13
1:      call dmpArr      
        mov $(mixSiz-1), %r14# check this out
        xor %rax,%rax
2:      mov (%r12,%r14,4), %eax
        inc %rax
        cmp %eax, (%r15,%r14,4)
        jnz 2f
        movw $0, (%r12,%r14,4)
        dec %r14
        jmp 2b
2:      cmp $0, %r14
        jz 1f
        incw (%r12,%r14,4)
        jmp 1b
1:      mov $0, %rax /* e x i t  c o d e */
        ret
////////````````,,,,,,,,;;;;;;;;--------\\\\\\\\>>>>>>>>********
        .data
mixBas: .int 0,4,2,3
        .equ mixSiz, (.-mixBas)/4
tuple:  .int 0,0,0,0
        .equ bufSiz, 32
fomt:   .asciz "%d,"
        .lcomm buf, bufSiz
////////________,,,,,,,,********--------%%%%%%%%========________
# log: -It is not progressive to be gay, nor it's progressive to
# be LGTBQ whatever, it's progressive not to hate everything but
# yourself!
