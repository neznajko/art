/*      ,       ;       `       =       :       >       */
        .att_syntax noprefix
        .global main
        .include "gas.s"
        .data
        .equ bufsize, 5          # a,m,b,n,d
        .lcomm outbuf, bufsize*4 # am + bn = d
        .text
# The actors
# r8 : m
# r9 : n        
# r10: a
# r11: b
# r12: a1
# r13: b1
# r14: c
# r15: d
# rax: q
# rbx: t
# rdx: r
# PRO=ee make -f ../gas.mk
########_#######################################================
main:   clear # set all general registers to nil
E1:     # [Initialize]
        mov $1,  r11 #  b <- 1
        mov r11, r12 # a1 <- b
        # a, b1 are already 0
        # set input here:
        mov $119, r8 # m
        mov $544, r9 # n
        mov r8, r14 # c <- m
        mov r9, r15 # d <- n
E2:     # [Divide]
        mov r14, rax # c/d
        xor rdx, rdx # rdx:rax is the divident( c )
        div r15 # c = qd + r, q = rax, r = rdx
E3:     # [Remainder zero?]
        cmp $0, rdx # r = 0?
        jz SPIT     # y e p
################################################################
E4:     # [Recycle]
        # this is weird, normaly it should be recursive function
        mov r15, r14 #  c <- d 
        mov rdx, r15 #  d <- r
        mov r12, rbx #  t <- a1
        mov r10, r12 # a1 <- a
        # a <- t - qa
        mov rax, rcx  # backup rax to rcx
        mul r10      # q <- qa
        sub rax, rbx # t <- t - qa
        mov rbx, r10 # a <- t:)
        #
        mov r13, rbx # t <- b1
        mov r11, r13 # b1 <- b
        # b <- t - qb
        mov rcx, rax  # restore q
        mul r11      # q <- qb
        sub rax, rbx # t <- t - qb
        mov rbx, r11 # b <- t - qb
        #
        jmp E2
SPIT:   lea outbuf(rip), r12
        mov $5, r13
        xor rax, rax
        mov r10, rax
        mov eax, (r12)
        mov r8, rax
        mov eax, 4(r12)
        mov r11, rax
        mov rax, 8(r12)
        mov r9, rax
        mov rax, 12(r12)
        mov r15, rax
        mov rax, 16(r12)
        call dmpArr
        mov $0, rax # exit code
        ret
////////////////////////////////////////////////////////////////
// log: haha
// [-9,119,2,544,17] -9*119 + 2*544 = 17
