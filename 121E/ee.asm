%include "nasm.asm"
GLOBAL  main
SECTION .bss
c       resd 1
d       resd 1
SECTION .data
m:      dd 2166 ;; 32-bit
n:      dd 6099
A:      dd 1
B:      dd 0
a:      dd 0
b:      dd 1
;; Am + Bn = c
;; am + bn = d
SECTION .text
;; %1( register ) <- %2
%macro load 2
        lea rax, [rel %2]
        mov %1, [rax]
%endmacro
;; %1 <- %2( register )
%macro store 2
        lea rax, [rel %1]
        mov [rax], %2
%endmacro
;; %1 <- %2
%macro assign 2
        load ebx, %2
        store %1, ebx
%endmacro
;; t <- A
;; A <- a
;; a <- t - qa
;; A = %1, a = %2
%macro reduce 2
        load ecx, %1; t <- A
        assign %1, %2
        mov rax, r8; rax <- q
        mul DWORD [rel %2]; rax <- qa
        sub rcx, rax; t <- t - qa
        store %2, ecx; a <- t - qa
%endmacro
;; PRO=ee make -f ../nasm.mk
main:   clear
        ;; [1] initialize
        ;;;; c <- m
        assign c, m
        ;;;; d <- n
        assign d, n
        ;; we'll have a loop here
do:     ;; pervorm division, c = qd + r
        ;; load c to rdx:rax
        xor rax, rax
        xor rdx, rdx
        load eax, c
        ;; now divide
        div DWORD [rel d]
        ;; now q is in rax, r in rdx
        mov r8, rax; backup q to r8
        ;; check vhether done
        cmp rdx, 0
        jz done
        ;; ok
        ;; c <- d
        assign c, d
        ;; d <- r
        store d, rdx
        ;; t <- A
        ;; A <- a
        ;; a <- t - qa
        reduce A, a
        ;;
        ;; t <- B
        ;; B <- b
        ;; b <- t - qb
        reduce B, b
        ;;
        jmp do
done:   nop  
        ;; io sucks, check the results in gdb
        clear
        load ebx, b
        load edx, d
        load esi, m
        load edi, n
        load eax, a
        ;; setup exit code and get out
        mov rax, 0
        ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; log: 
;;
