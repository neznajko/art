GLOBAL  main
EXTERN  sprintf
EXTERN  puts
SECTION .bss
S       resb 64
SECTION .data
FMT1    db "GCD(%d,%d)=",0
FMT2    db "%s%d",0
SECTION .text
;; rdx:rax - m
;; rcx     - n
;; output  - rcx
GCD     nop          ;
.DIV    div rcx      ; rax <- q, rdx <- r
        cmp rdx, 0   ; are we done?
        jz  .RET     ; yep
        mov rax, rcx ; m <- n 
        mov rcx, rdx ; n <- r
        xor rdx, rdx ;
        jmp .DIV     ; follow me
.RET    ret          ; 
;;
main    push rbp
        mov rdx, 0
        mov rax, 2166
        mov rcx, 6099
        ;; save to output string
        push rax      ;
        push rcx      ; trashed by sprintf
        push rdx      ;
        push r9       ; align the stack
        mov rdi, S    ; sprintf(rdi,rsi,rdx,rcx)
        mov rsi, FMT1 ; 
        mov rdx, rax  ;
        mov rax, 0    ; varargs
        ;; without wrt ..plt ld will complain:
        ;; relocation R_X86_64_PC32 ..
        call sprintf WRT ..plt
        pop r9        ;
        pop rdx       ;
        pop rcx       ;
        pop rax       ;
        call GCD      ; rcx <- gcd
        ;; append result to S
        mov rdi, S    
        mov rsi, FMT2
        mov rdx, S
        mov rax, 0
        call sprintf WRT ..plt
        ;; dump output
        mov rdi, S
        call puts wrt ..plt;
        pop rbp
        mov rax, 0
        ret
;; log:
