;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .bss
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .data
radx:   dq      0, 2, 4, 3; tuple dimentions
back:   equ     ($-radx)/8-1; thats expressn
tupl:   times   back+1  dq      0; the tuple
fomt:   db      "%lld ", 0;          sprintf
bufr:   times   64      db      0; for outpt
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .text
GLOBAL main
EXTERN sprintf, puts
%include "nasm.asm"; clear
;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
vzit:   nop
; sprintf tupl into bufr, and than p u t s.
        mov     rcx, $back; No. of loops
        mov     rbx, 0; address index
        lea     rdi, [rel bufr]; sprintf fst
.H      inc     rbx; by one
        lea     rsi, [rel fomt]; the se'cond
        mov     rdx, [r14+rbx*8]; how about?
        and     rsp, -16; align stack
        mov     r12, rcx;
        call    sprintf wrt ..plt; -ha-ha-ha
        mov     rcx, r12;
        loop    .H; !haey
        mov     byte[rdi], 0; null byte
        lea     rdi, [rel bufr];
        call    puts wrt ..plt; -mmmua-ha-..
        ret;    >>>>                    >>>>
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
main:   nop;
        clear; set general registers to zero
        lea     r15, [rel radx]; initialzatn
        lea     r14, [rel tupl]; in progress
        ;; tes ing
        ;;    T
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
next:   call    vzit;
        mov     r13, $back;street boys
carry:  mov     rax, [r15+r13*8]; radx
        dec     rax;
        lea     r12, [r14+r13*8]; tupl
        cmp     rax, [r12]; are equal?
        jnz     nope; negative
        mov     qword [r12], 0; -a!-a!-a!-a!
        dec     r13; with one
	cmp	r13, 0; arve done?
	jz	exit; to the gates
	jmp	carry; thnx god not carrey
nope	inc	qword [r12]; by whom?
	jmp	next; »¿©£
exit:	mov 	rax, 0; exit code
        ret;
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;

