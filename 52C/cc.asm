;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .bss
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .data
;;;;        0  1  2  3  4  5  6
K:      db  0, 6, 2, 1, 5, 4, 3; keys
N:      equ ($-K)-1; numbr of keys
COUNT:	times N+1 db 0; the counter 
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .text
GLOBAL main
%include "nasm.asm"
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;;;; rsi - K
;;;; rdi - COUNT
;;;; rbx - i
;;;; rcx - j
main:   nop;
        clear;
        lea rsi, [rel K]; load K's adr 2 rsi
        lea rdi, [rel COUNT]; ld COUNT 2 rdi
	mov rbx, N;                   i <- N
.1:	cmp rbx, 1;                   i > 1?
	jle .exit;                      nope
	lea rcx, [rbx-1];         j <- i - 1
.3:	cmp rcx, 0;                   j > 0?
	jle .2;                         nope
	mov al, [rsi + rbx];      al <- K[i]
	mov dl, [rsi + rcx];      dl <- K[j]
	cmp al, dl;             K[i] < K[j]?
	jge .4;                         nope
	inc byte [ rdi + rcx ];   ++COUNT[j]
	jmp .5;                        e-fai
.4:	inc byte [ rdi + rbx ];   ++COUNT[i]
.5:	dec rcx;                  j <- j - 1
	jmp .3;                          yea
.2:	dec rbx;                  i <- i - 1
	jmp .1;                   let's jump
.exit:  nop;                      x/7db $rdi
        ret;   
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;  
;; PRO=cc make -f ../nasm.mk && gdb ./a.out
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;  
;;;; Ok you've all know the famous phrase of
;;;; Hegel «Quantity changes lead to quality
;;;; changes», or something like this. I was
;;;; never thinking seriously about this and
;;;; it somehow looks quite obvious isn't it
;;;; When you read more books, you'll become
;;;; more clever ryte? But it turns out this
;;;; is not what is meant. A more convenient
;;;; example is with boiling water, when you
;;;; increase the temperature, at some point
;;;; phase transition happens, which changes
;;;; the quality of the water it becomes air
;;;; I don't know very much about Hegel, and
;;;; I'm not planning to read his books, but
;;;; what I know is that his theory is based
;;;; on Heraclitus teaching, back in ancient
;;;; Greece, which understands everything as 
;;;; due to conflicts between opposite sides
;;;; It seems what this thought is trying to
;;;; justify is the constant change based on
;;;; this perception. Assuming conflicts are 
;;;; fundamental, the increasing of quantity
;;;; will increase the conflicts, until some
;;;; critical value is reached, that current
;;;; quality of the state can't handle, that
;;;; resolves to completely new quality etc.
;;;; The world exists because of the harmony
;;;; between opposite things, not because of 
;;;; conflicts. The driver of the change are
;;;; not conflicts, they are not fundamental
;;;; enough conflicts are result of the will
;;;; 4 f     r     e     e     d     o     m
