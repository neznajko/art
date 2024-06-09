;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .bss
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .data
;;;;        0  1  2  3  4  5  6
X:      db  0, 6, 2, 1, 5, 4, 3; the prmtatn
N:      equ ($-X)-1; numbr of prmtatn lments
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .text
GLOBAL main
EXTERN puts
%include "nasm.asm"
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;;;; rsi - X
;;;; rbx - prev
;;;; rcx - curr
;;;; rdx - next
main:   nop;
        clear;
        lea rsi, [rel X]; load X's adr 2 rsi |   | 
        xor rbx, rbx; initialize prev to nil |   | 
        mov rcx, $N; intlze curr to last idx |   | 
.while: cmp cl, 0;        check if curr > 0? |   | 
        jle .exit;          nop, ve are done |   | 
        mov al, [rsi+rcx];   al <- x[ curr ] |   | 
.if:    cmp al, 0;     x[ curr ] < 0? tha'ts |   |  
        jge .else;                       nop |   |  
        neg BYTE [rsi+rcx];   Unmarky Unmark |   | 
        dec rcx;                   curr -= 1 |   |   
        jmp .while;           into the while |   |  
.else:  mov dl, [rsi+rcx]; next <- x[ curr ] |   |  
        mov [rsi+rcx],bl;  x[ curr ] <- prev |   | 
        neg BYTE [rsi+rcx];         convyort | b |
        cmp dx, 0;                next == 0? |   |  
        jnz .1;                        n o p | e |
        mov rbx, 0;                prev <- 0 |   |  
        jmp .while;           into the while | c |
.1      mov rbx, rcx;           prev <- curr |   |
        mov rcx, rdx;           curr <- next | o |
        jmp .else;                        ok |   |
.exit:  nop;   here use the cross command to | z |
        ret;        check that is x/7bd $rsi |   |  
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;  
;; log: PRO=inverse make -f ../nasm.mk        
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;  
;;;;
;;;; 1 図書館に行きます。
;;;;   Ich gehe zur Bibliothek.
;;;; 2 学校に来ます。
;;;;   Ich komme zur Schule.
;;;; 3 喫茶店に来ます。
;;;;   Ich komme zum Café.
;;;; 4 うちに帰ります。
;;;;   Ich gehe nach Hause zurück.
;;;; 5 アメリカに帰ります。
;;;;   Ich gehe zurück nach Amerika.
;;;;

