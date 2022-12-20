;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .bss;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,, 
MAXEL:  equ 26;;,,,,;; noof maximum elements
T:      resb MAXEL;;,,,,;;;;,,,, the T table
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .data;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,
f1:     db "(acfg)(bcd)(aed)(fade)(bgfae)",0
siz:    equ $-f1-1;;,,,,;;;;, formula's size
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;; PRO=machine make -f ../nasm.mk && ./a.out
SECTION .text;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,
%include "nasm.asm";,,,,;;;;,,,,;;;;,,,,;;;;
GLOBAL main;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
EXTERN puts;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
%macro off 1;;;;,, 1-based offset from ascii
        lea rcx,[ %1-'a'+1 ];;;;,,,,;;;;,,,,
%endmacro;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
%macro ascii 1;;;;,,,,;;;; ascii from offset
        lea rcx,[ %1+'a'-1 ];;;;,,,,;;;;,,,,
%endmacro;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;; Here figure the largest offset not coming
;; from '(' or ')', that's the noof elements
;; involved in f1: n, put it in rax register.
fstpas: nop;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
        ;;;;,,, load formula's address to r8
        lea r8,[ rel f1 ];;;,,,,;;;;,,,,;;;;
.1:     inc r8;;,,,,;;;;,,,,;;;;, click next
        mov cl,[ r8 ];; load character to cl
        cmp cl, 0;; check vhether it's zero?
        jz .2;;;,,,,;;;;,,, if so ve're done
        cmp cl, '(';,,,,;;; skip parenthesis
        jz .1;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,
        cmp cl, ')';,,,,;;;;,,,,;;;;,,,,;;;;
        jz .1;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,
        off rcx;,,,,;;;;,,,,;;; some comment
        cmp rcx, rax;;;;, compare rcx vith n
        jle .1;;,,,,;;;;,,,,;;;;,,,,;;;;, Ok
        mov rax, rcx;;;;,,,,;;;;,,,,; update
        jmp .1;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,
.2:     ret;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;;;;,,,,;;;;,,,,;;;;,,,, pick some registers
; r8  - ;;;;,,,,;;;;,,,,;;;;,,,, T's address
; r9  - ;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;; n
; r10 - ;;;;,,,,;;;;,,,,;;;;,,, f1's address
; r11 - ;;;;,,,,;;;;,,,,; f1's back iterator
; r12 - ;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;; j
; rbx - ;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;; Z
main:   nop;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
        clear;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,
        call fstpas;,,,,;;;;,,,,;;;;,,,,;;;;
;;;;,,, B1.[ Initialize ] Set T[k] <- k, for
;;;;, 1 <= k <= n. Prepare to scan the input
;;;;,,,,;;;;,,,,;;;;,,,,; from right to left.
        lea r8,[ rel T ];;;;,,,,;;;;,,,,; Ok
        mov r9, rax;,,,,;;;;,,,,;;;;, That's
        lea r10,[ rel f1 ];;,,,,;;;;,,,,; Ok
        mov r11, siz ;;;,,,,;;;;,,,, Checked
.0:     mov [ r8 + rax ], al;;;;,, T[k] <- k
        dec rax;,,,,;;;;,,,,;;;;,,,,;;;;,,,,
        cmp rax, 0;;,,,,;;;;,,,,;;;;,,,,;;;;
        jnz .0;;,,,,;;;;,,,,;;;;,,,,;;;;,,,, 
;;; B2.[ Next element ] Get next element, if 
;;;;,,,,;; input is exhausted, terminate the 
;;;;,, algorithm. If the character is ), set 
; Z <- 0, and repeat B2, if it is ( go to B4,
; otherwise it's X[i] for some i. Move to B3.
.1:     dec r11;,,,,;;;;,,,,;;;;, click prev
        cmp r11, 0;;,,,,;;;;,,,, are ve don?
        jl .2;;;,,,,;;;;,,,,;;;;,,,,;;;; yep
        mov cl,[ r10 + r11 ];;; get the char
        cmp cl, ')';,,,,;;;;,,,,;;; is it )?
        jnz .3;;,,,,;;;;,,,,;;;;,,,,;;;; nop
        xor rbx, rbx;;;;,,,,;;;;,,,,; Z <- 0
        jmp .1;;,,,,;;;;, continue repeating
.3:     cmp cl, '(';,,,,;;;;, check this out
        jz .4;;;,,,,;;;;,,,,;;;;,,, go to B4
; B3.[ Change T[i] ] Exchange T[i] and Z, if
;; this makes T[i] nil, set j <- i. Go to B2.
        off rcx;,,,,;;;;,,,,;;;;,,, rcx <- i 
        mov al,[ r8 + rcx ]; copy al <- T[i]
        mov [ r8 + rcx ], bl; copy T[i] <- Z
        mov bl, al; The circle is now cmplte
        cmp byte[r8 + rcx], 0; e cross g fai
        jnz .1;;,,,,;;;;, everybody go to B2
        mov r12, rcx;;;;,,,,;;;;,,,,; j <- i
        jmp .1;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,
; B4.[ Change T[j] ] Set T[j] <- Z. Go to B2.
.4:     mov [ r8 + r12 ], bl;;;;,,,,;;;;, ys
        jmp .1;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,
.2:     nop;,,,,;;;;,,,, convyort T to ascii
        mov cl,[ r8 + r9 ];;,,,,, cl <- T[i]
        ascii rcx;; rcx <- T[i]'s ascii code
        mov [ r8 + r9 ], cl; cp back to T[i]
        dec r9;;,,,,;;;;,,,,;;;;, click prev
        cmp r9, 0;;;,,,,;;;;,,,, are ve don?
        jnz .2;;,,,,;;;;,,,,;;;;,,,,;;;; nop
;;;;,,,,;;;;,,,,;;;;,,,,;;;; dunf the output
        lea rdi,[ r8 + 1 ];;,,,,; skip dzero
        call puts wrt ..plt;,,,,; plt ..wtf?
        ret;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;;;;,,,,;;;;,,,,;;;;,,,,;;;; output: dcegbfa
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,::::
; log: -I'd a good bye speech couple of days
; before the elections, but had decided just
; to leave. A month has pased since then and
; I kind of feel better didn't watch no news
; from America, and I think'll stop watching
; anything, but have to keep pushing somehow,
; so I'll continue posting here but I really
; have nofing to say although if I got covid
; I might share that, I don't know, good bye
; and Happy Christmas:)

