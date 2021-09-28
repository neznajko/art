;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .bss
buflen: equ 1024
outbuf: resb buflen
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .data
arr:    db "(acfg)(bcd)(aed)(fade)(bgfae)",0
n:      equ $-arr-1
tag:    times n db '0'
        db 0
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .text
GLOBAL main
EXTERN puts
%include "nasm.asm"
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;; You shall not pass!
;; r15 = arr
;; r14 = tag
;; r8  = iterator
fstpass:nop;
        mov r8, 0; j <- 0
.1:     mov al, [r15+r8]; al <- arr[j]
        cmp al, '('; arr[j] = '(' ?
        jnz .2; nop
        mov BYTE [r14+r8], '1'; tag[j] = 1
        mov bl, [r15+r8+1]; bl <- arr[j + 1]
.2:     cmp al, ')'; arr[j] = ')' ?
        jnz .3; nop
        mov [r15+r8], bl; arr[j] <- ah
        mov BYTE [r14+r8], '1'; tag[j] = 1
.3:     inc r8; ++j
        cmp r8, n; j < n ?
        jl .1; yep
        ret; bye
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;; r15 - arr (a)
;; r14 - tag
;; r13 - outbuf
;; r10 - scanning index (j)
;;  r9 - output buffer position (k)
;;  r8 - opening statement (i)
;;  bh - staat
;;  bl - curre
main:   nop;
        clear;
        lea r15, [rel arr];
        lea r14, [rel tag];
        lea r13, [rel outbuf];
        call fstpass;
        mov r8, 0; i << 0
        ;; -- open --
        ;;
        ;; find first untagged lmnt
.1      inc r8;
        ;; ck if done
        cmp r8, n; j = n?
        jz .spit; yep!
        ;; ck if a[i] is tagged
        cmp byte[r14+r8], '1';
        jz .1; yep
        ;;
        ;; here a[j] is 1st untagged
        mov byte[r13+r9], '(';
        inc r9; k++
        ;; here if mooing directly to bh
        ;; I get: -- cannot use high register
        ;; in rex instruction --
        mov al, [r15+r8]; al << a[i]
        mov [r13+r9], al; to outbuf
        inc r9; ++k
        ;;
        ;; set staat
        mov bh, al; staat
        mov r10, r8; j << i
        ;;
        ;; -- set cure --
.cure   inc byte[r14+r10]; tag[j] << '1'
        inc r10; ++j
        mov bl, [r15+r10]; cure << a[j]
        ;; -- scan --
.scan   inc r10; j++
        cmp r10, n; j = n?
        jz .wtf; yep!
        cmp bl, [r15+r10]; a[j] = cure?
        jz .cure; [y]ep!
        jmp .scan; follow me!
        ;;
        ;; -- staat = cure? --
.wtf:   cmp bh, bl; staat = cure?
        jz .close; yep!
        mov [r13+r9], bl; outbuf[k] << cure
        inc r9; k++
        mov r10, r8; j << i
        jmp .scan; yeah!
.close  mov byte[r13+r9], ')'; out[k] << ')'
        inc r9; k++
        jmp .1; after me!
.spit   mov rdi, r13; puts argument
        call puts WRT ..plt; wtf
        ret;
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;; log: PRO=cycle make -f ../nasm.mk
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
