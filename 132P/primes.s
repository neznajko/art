/* P1. [Start table]     *
 * P2. [N is prime]      *
 * P3. [500 found?]      *
 * P4. [Advance N]       *
 * P5. [K <- 2]          *
 * P6. [PRIME[K]\N?]     *
 * P7. [PRIME[K] large?] *
 * P8. [Advance K]       */
////////********========________^^^^^^^^,,,,,,,,````````>>>>>>>>
        .att_syntax noprefix
        .global main
////////--------````````........########////////========________
        .data
        .equ    L, 500
        .lcomm  prime, 4*L   /* 32-bit integers */
        .equ    LINEZ, 50    /* number of output lines */
        .lcomm  buf, LINEZ+1 /* output buffer */
fmt:    .asciz  " %04d"
////////,,,,,,,,%%%%%%%%========::::::::        ||||||||>>>>>>>>
        .text
.macro  pushq
        push    rax
        push    rbx
        push    rcx
        push    rdx
        push    rsi
        push    rdi
        push    r8
        push    r9
        push    r10
        push    r11
        push    r12
        push    r13
        push    r14
        push    r15
.endm
.macro  popq
        pop     r15
        pop     r14
        pop     r13
        pop     r12
        pop     r11
        pop     r10
        pop     r9
        pop     r8
        pop     rdi
        pop     rsi
        pop     rdx
        pop     rcx
        pop     rbx
        pop     rax
.endm
main:   enter   $0, $0
        lea     prime(rip), r8  /* .data relative addressing  */
        mov     $0, rcx
P1:     movl    $2, (r8,rcx,4)
        inc     rcx             /* J - number of primes found */
        mov     $3, rbx         /* N - prime candidate        */
P2:     mov     ebx, (r8,rcx,4) /* PRIME[J] <- N              */
        inc     rcx
P3:     cmp     $L, rcx         /* are ve done?               */
        jz      Spit
P4:     add     $2, rbx         /* advance N                  */
P5:     mov     $1, rsi         /* K                          */
P6:     xor     rdx, rdx        /* prepare to divide          */
        mov     rbx, rax
        mov     (r8,rsi,4), edi 
        div     rdi
        cmp     $0, rdx         /* is it composite?           */
        jz      P4              /* yeah try next              */
P7:     cmp     rdi, rax        /* prime[k] <= q?             */
        jng     P2
P8:     inc     rsi             /* K++                        */
        jmp     P6
Spit:
// (s)printf(rdi,rsi,rdx,rcx,..)
        lea     fmt(rip), rsi   /* second                */
        xor     r9, r9          /* what is this?         */
1:      mov     r9, rbx
        lea     buf(rip), rdi   /* first                 */
2:      mov     (r8,rbx,4), edx /* third                 */
        pushq
        mov     $0, rax
        and     $-16, rsp       /* align the stack       */
        call    sprintf         /* this is trashing      *
                                 * a,c,d,si,di,8,9,10,11 */
        popq
        add     $5, rdi         /* moo to next colmn     */
        add     $LINEZ, rbx     /* skip 50 primes        */
        cmp     $L, rbx         /* done with the line?   */
        jb      2b              /* nope                  */
        pushq                   /* dmp buf               */
        and     $-16, rsp
        lea     buf(rip), rdi
        call    puts
        popq
        inc     r9              /* next line             */
        cmp     $LINEZ, r9
        jb      1b
        leave
        ret
// log: gcc primes.s && ./a.out
