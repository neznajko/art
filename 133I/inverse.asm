;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .bss
;;;;,,,,;;;;,,,,;;;;,,,,;;m;,i,,j;;X[m],;;;;
SECTION .data   ;;;;      6  3 -1  3 -> -1
;;;;          1 2 3 4 5 6 
X       db  0,6,2,1,5,4,3 
;;;;                   -1 
N       equ $-X-1
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .text
GLOBAL main
%include "nasm.asm"; clear
;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rax - general purpose register
;; rcx - m
;; r12 - X's address
;;  dl - i
;;  bl - j 
main:   nop;
        clear;               clear after gcc
        lea rcx, [ N ];               m <- N
        lea r12, [ rel X ]; prmutatn bas adr
        mov bl, -1;                  j <- -1
.0      mov dl, [ r12 + rcx ];     i <- X[m]
        cmp dl, 0;                    i > 0?
        jl .1;                           nop
.2      mov [ r12 + rcx ], bl;     X[m] <- j
        mov bl, cl;                  j <- -m
        neg bl;
        mov cl, dl;                   m <- i
        mov dl, [ r12 + rcx ];     i <- X[m]
        cmp dl, 0;                    i < 0?
        jg .2;                           nop
        mov dl, bl;                   i <- j
.1      neg dl;                      i <= -i
        mov [ r12 + rcx ], dl;     X[m] <- i
        loop .0;                  let's jump
;; geraut ;;;;;;;;;;;;;;;;;;;_;;;;;;;;;;;;;;
;; (gdb) x/7db $r12
;; 0x5555555558010 <X>:  0  3  2  6  5  4  1
        mov rax, 0; exit code
        ret;
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;; Q: What is God's gender?
;; A: a) male
;;    b) female
;;    c) other
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;

