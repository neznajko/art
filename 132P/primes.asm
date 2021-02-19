global main
extern sprintf
extern puts
section .bss
ROWZ:   equ  50
SIZE:   equ  500
prime:  resd SIZE ; 32-bit (4 bytes)
buf:    resb ROWZ+1
section .data
fmt:    db "%s %04d",0
section .text
%include "glibc.asm"
;; GET Primes
;; input: none
;; otput: prime
;; r8  - prime
;; rcx - j prime counter
;; rbx - n prime candidate
;; r9  - k prime index
;; rsi - prime[k]
getp:   nop                  ;
        ;; [Initialize the stuff]
        lea r8, [rel prime]  ; prime base address
        mov dword [r8], 2    ; save first prime number
        mov rcx, 1           ; rcx, j - number of found primes
        mov rbx, 3           ; rbx, n - prime candidates
        mov rsi, 0           ; clear
        ;; Ok this is assembly so we can copy Knuth's logic directly
        ;; [N iz prime!]
.1:     mov [r8+rcx*4], ebx  ; store n to prime[j]
        inc rcx              ;
        ;; [Are we done?]
        cmp rcx, SIZE        ; n == 500?
        jz .2                ; yep!
        ;; [increment n]
.3:     add rbx, 2           ; next odd number
        ;; [loop over primes]
        mov r9, 1            ; start with 3
.4:     mov rdx, 0           ; rdx:rax <- n
        mov rax, rbx         ;
        mov esi, [r8+r9*4]   ;
        div rsi              ; rax <- Q, rdx <- R
        cmp rdx, 0           ; R = 0?
        jz  .3               ; try next candidate
        cmp rsi, rax         ; prime[k] >= Q?
        jge .1               ; yep
        inc r9               ; k++
        jmp .4               ; prime[k]\n?
.2:     ret                  ; bye getp
;; input: r8 - prime array
;; rdi - buf
;; rsi - fmt
;; rax - row counter (j)
;; rbx - prime index (k)
;; sprintf(buf, fmt, buf, prime[i])
;;         rdi, rsi, rdx, rcx
;;    puts(buf)
spit:   nop
        lea rdi, [rel buf];  buffer address
        lea rsi, [rel fmt];  format spec
        mov rax, 0;          table row
        mov rcx, 0;          clear
        mov rdx, rdi;        3rd argument (buf)
        ;;                   line loop
.0:     mov rbx, rax;        k <- j
        mov dword [rdi], 0;  clear buffer
        ;;                   column loop
.1:     mov ecx, [r8+rbx*4]; prime[k]
        ccall sprintf;       yeah!
        add rbx, ROWZ;       k += 50
        cmp rbx, SIZE;       k <  500?
        jb  .1;
        ccall puts;
        inc rax;
        cmp rax, ROWZ;
        jnz .0;
        ret
main:   nop
        clear
        call getp
        call spit
        ret
;; log: 
