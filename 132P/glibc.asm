;;
%macro clear 0
        xor rax, rax
        xor rbx, rbx
        xor rcx, rcx
        xor rdx, rdx
        xor rsi, rsi
        xor rdi, rdi
        xor r8 , r8
        xor r9 , r9
        xor r10, r10
        xor r11, r11
        xor r12, r12
        xor r13, r13
        xor r14, r14
        xor r15, r15
%endmacro
;;
%macro  pushq 0
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
%endmacro
;;
%macro  popq 0
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
%endmacro
;; (rdi, rsi, rdx, rcx, r8, r9, stack)
%macro ccall 1
        pushq
        mov rax, 0 ; varargs
        call %1 WRT ..plt
        popq
%endmacro
;;
