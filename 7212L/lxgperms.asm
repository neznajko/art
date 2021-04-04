GLOBAL  main
EXTERN  sprintf
EXTERN  printf
SECTION .bss
BUFF:   resb 256; output buffer
SECTION .data
A:      dd 0,1,2,2,4
SIZE    equ ($-A)/4
FMT1    db "%s%d, ",0
FMT2    db "[%s%d]",10,0
SECTION .text
%macro  pushq 0
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
%endmacro
%macro  popq 0
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
%endmacro
;; input: rbx - address of A
;; outup: rax - 0 on no moar, otherwise 1
;; r8  - j
;; r9  - r
;; r10 - n (last index)
next    nop
        lea r10, [SIZE-1]; set n
        mov rax, 0; clear
;; [find j]
        lea r8, [r10-1]; j <- n - 1
.1      mov eax, [rbx+r8*4]; eax <- A[j]
        mov ecx, [rbx+(r8+1)*4]; A[j+1]
        cmp eax, ecx; A[j] < A[j+1]?
        jl .2; yep
        dec r8; j--
        ;; are we don?
        cmp r8, 0; j == 0?
        jnz .1; nope
        mov rax, 0;
        jmp .Exit;
;; [increase A[j]]
;; starting from behind find first value
;; larger than A[j], and swap them.
.2      mov r9, r10; r <- n
.3      mov ecx, [rbx+r9*4]; A[r]
        cmp eax, ecx; A[j] < A[r]?
        jl .swap; yep
        dec r9; r--
        jmp .3; follow me
.swap   xchg eax, [rbx+r9*4]; r
        mov [rbx+r8*4], eax;  j
;; [reverse]
        inc r8;      j <- j+1
        mov r9, r10; r <- n
.5      cmp r8, r9; r8 < r9?
        jnl .4; nop
        mov eax, [rbx+r8*4]; eax <- A[j]
        xchg eax, [rbx+r9*4]; eax <-> A[r]
        mov [rbx+r8*4], eax;
        inc r8; j++
        dec r9; r--
        jmp .5; follow me
.4      mov rax, 1; ok        
.Exit:  ret
;; rbx - A
main    nop
        lea rbx, [rel A];
.Loop:  call aspit;
        call next;
        cmp rax, 0;
        jnz .Loop;
Exit    ret
;; Array SPIT 
;; input: rbx - A's address
aspit:  nop
        pushq
        lea rdi, [rel BUFF]; 1st
        lea rsi, [rel FMT1]; 2nd
        mov rdx, rdi; 3rd
        lea r9, [SIZE-1]; back
        mov al, 0;
        mov [rdi], al; clear buffer
        mov r10, 1; A's index (i)
        mov rcx, 0; clear
.Loof:  cmp r10, r9; i == SIZE - 1?
        jz .Yeah; yea
        mov ecx, [rbx+r10*4]; 4th A[i]
        pushq
        mov rax, 0; varargs
        call sprintf wrt ..plt
        popq
        inc r10; i++
        jmp .Loof
.Yeah:  mov rsi, rdi; 2nd
        lea rdi, [rel FMT2]; 1st
        mov rdx, [rbx+r10*4]; 3rd
        pushq
        mov rax, 0;
        call printf wrt ..plt
        popq
        popq
        nop
        ret
;; log:
