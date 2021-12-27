;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .bss
BUFSIZ  equ 1024
buf:    resb BUFSIZ; io buffer
n:      resd 1; number of vertices
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .data
MIXWORD equ 5; Yee?
input:  db "./paper.dev", 0
fmt1:   db "[COUNT] SUCC %d: [%d] ", 0
fmt2:   db "%d ", 0
fmt3    db "Wet'z,goo:", 0
fmt4:   db " %d", 0
void:   db 0
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
SECTION .text
GLOBAL main
EXTERN atoi; ascii to integer
%include "nasm.asm"; clear
;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;   ;
struc node
    .vertex:    resb 1
    .next:      resq 1; 64-bit pointer
endstruc
;; This shld be macros I guess but cant debug
;; them so all related node methods are funcs
EXTERN calloc
cons_node:
;; Input: bl - vertex value
;; Outpt: rax - pointr of calloced node struc
    ;; set out calloc arguments
    mov rdi, 1; one element
    mov rsi, node_size;
    call calloc wrt ..plt; check rax out
    mov [rax+node.vertex], bl
    ret
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;; [ oK] rbx, rbp, and r12-r15 registers are
;; presrved by gcc calls, zoo'm going to uze
;; dhem. 
;; rbp - main data structre base pnter( Top)
;; r12 - cure buf pointer
;; r13 - ?
;; r14 - [u]-> v
;; r15 -  u ->[v]
;; rbx - ?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; readnext: Read next input word.         ;
;; input: r12 - cure buf address           ;
;; ouput: rax - corresponding digit        ;
;; ____0----9 .. ----7____1\n----2 ..      ;
;; ^ buf                                   ;
readnext:;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        xor rax, rax; clear
;  [:)] skip if new line
        mov al, [r12]; load character to al
        cmp al, 10; thAtS new line 0xa
        jnz .A; noop
        inc r12; skip
;  [;/] set zero byte
.A:     mov rdi, r12; atoi argument
        add r12, MIXWORD; update buf position
        mov bl, [r12]; backup
        mov BYTE[ r12], 0; set 0 byte
        call atoi wrt ..plt;
        mov [r12], bl; re-establish
        ret; check rax out
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; getoff: Take as argument vertex nmber and
;; return the correspondng Top pointr in rbx
%macro  getoff 1 
        lea rbx, [rbp+%1*8];
        add rbx, %1;
%endmacro                                  what is this?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; topstr: Get as input a vertex number u, than put in a
;; buffer that is buf the following: SUCC u: v1 v2 v3 ..
;; input: r14 - u
;; outpt: buf
EXTERN sprintf
topstr: nop
        lea r12, [rel buf]; // buf pointer 
        mov rdi, r12; 1st arg
        lea rsi, [rel fmt1]; snd
        mov rdx, r14; trd
        getoff r14; rbx
        xor rcx, rcx; thats comment
        mov cl, [rbx+node.vertex];
        sub rsp, 8; align stack
        call sprintf wrt ..plt; ieah!
        add rsp, 8; re-establish
.A:     add r12, rax; adjust buffer pointer
        mov rbx, [rbx+node.next]; clck nxt
        cmp rbx, 0; ar ve dn ?!
        jz .B; yep
        mov rdi, r12;
        lea rsi, [rel fmt2];
        xor rdx, rdx;
        mov dl, [rbx+node.vertex];
        sub rsp, 8;
        call sprintf wrt ..plt;
        add rsp, 8;
        jmp .A; follow me!
.B:     ret; lets' go
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
EXTERN puts
%macro PUTS 1
        sub rsp, 8;
        mov rdi, %1;
        call puts wrt ..plt;
        add rsp, 8;
%endmacro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dump the Top structure
dmp:    lea r15, [rel buf];
        xor rax, rax;
        mov al, [rel n];
        mov r14, rax;
.Boom:  call topstr;
        PUTS r15;
        dec r14;
        cmp r14, 0;
        jge .Boom;
        ret;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%macro  LOADC 1; load counter
        getoff %1; rbx
        xor rax, rax; clear
        mov al, [rbx]; thats
%endmacro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%macro  QSET 1; set QLINK
        getoff r15; get rear offset
        mov rax, %1; use rax as buffer
        mov [rbx], al; copy to memory
        mov r15, rax; opdat rear pointer
%endmacro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
%macro  DECC 1; decrement counter
        getoff %1; rbx
        dec byte [rbx];
        xor rax, rax; clear
        mov al, [rbx];
%endmacro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Scan for COUNT=0 that is src vertices and
;; put them in the QUEUE; F/R = r14/r15,.;!?
initQ:  nop
        xor r14, r14; [F]ront
        xor r15, r15; [R]ear
        mov rcx, [rel n]; No. vertices
.Lab0   LOADC rcx; rax
        cmp rax, 0; ck if src
        jnz .Lab1; nop
        QSET rcx; push to d'Queue
.Lab1   loop .Lab0; follow me!
        ret; cuge 6ocuge
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
extern printf;
main:   nop;
        clear; set general registers to zero
        ;; tes ing
        ;;    T
;1) o p e n Get fd for the input file.
        mov rax, 2; sys_open
        lea rdi, [rel input]; pathname
        syscall; check rax out
;2)-r-e-a-d- Load file to buffer.
        mov rdi, rax; fd
        mov rax, 0; sys_read
        lea rsi, [rel buf]; buffer pointer
        mov rdx, BUFSIZ; No. of read bytes
        syscall; wow! what is this?
;3)[~] get No. vrtces and a'locate top lnks.
        mov r12, rsi; copy buf adrs to r12
        call readnext; skip( dummy record)
        call readnext; thAtS n
        mov [rel n], rax; copy
        lea rdi,[rax+1]; n + 1 
        mov rsi, node_size; prepre fr calloc
        call calloc wrt ..plt;
        mov rbp, rax; set Top pointer to rbp
;4)[:"] Build data structures
.lab0:  call readnext; Read u in u<v relatn.
; output z'n rax, rbx is uzed as backup, zoo
; 'm going to save it to r, let'see r .. hm?
        mov r14, rax; [ ok] let's uz r14 and
        call readnext; r15 for u, v vertices
        mov r15, rax; Thts v, Ok now we have
; to incrmnt COUNT[v], and thn create a sukc
; structure for u, vhich iz the most complex
; stuff, so let's make a picture:
; r14 - u, u -> v, v is successor   of u
; r15 - v,         u is predecessor of v
;
; if COUNT[v] is 0, v can be discarded
; if COUNT[u] is 0, dec COUNT[v] 4 all u->v,
; so insert node( v) in Top[ u].
;4.a) inc COUNT[v]
;;;;;;; by the way ck if end of input
        cmp rax, 0;
        jz .lab1; yea let's go sorting!
        getoff r15; rbx <- &Top[ v]
        inc Byte[rbx]; COUNT[ v]++
;4.b) insert coin
        mov rbx, r15; rbx: cons_node input
        call cons_node; rax: output
;     I think thats the first time I'm going
;     to link a node in assembly:) 
        ;; get address of Top[u]
        getoff r14; rbx <- &Top[u]
;;;;;;; set node(v) link; copy Top[u].next
;;;;;;; to rcx
        mov rcx, [rbx+node.next];
;;;;;;; opdate node(v).next
        mov [rax+node.next], rcx
;;;;;;; opdate Top[u].next
        mov [rbx+node.next], rax
;;;;;;; read remaining relations
        jmp .lab0
.lab1:  nop
        call dmp;
;; [Y/n] ok believe it or not but we r done
;; with the structs, now starts the popping.
;; r14 - front
;; r15 - rear
        call initQ; initlze the queue
;; Let's go( popping)
        nop
        lea rax, [rel fmt3];
        PUTS rax;
        jmp .Lab2
.Lab3:  cmp r14, 0; rvd?( [r]e [v]e [d]on ?)
        jz .Iep; yezs!?
        ;; dump the frontman
        lea rdi, [rel fmt4]; printf args
        mov rsi, r14; boo
        sub rsp, 8; avoid Segmentation fault
        call printf wrt ..plt;
        add rsp, 8; de-align
;; r14 has just been popped out, now we have
;; to decremnt countrs of all its successors
;; nd f one of thm becms 0 psh it to d'Queue
        ;; thats the heart of the program if
        ;; you ask me;
        getoff r14; rbx
        mov r12, rbx; rbx is windy place
.SUCC   mov r12, [r12+node.next]; click next
        cmp r12, 0; rvd?
        jz .Lab2; jep!
        ;; load next vertex to r13
        xor rax, rax; clear
        mov al, [r12+node.vertex];
        mov r13, rax; copy
        DECC r13; result of dec is at rax
        cmp rax, 0; ck if zero
        jnz .SUCC; nop
        QSET r13; push to Queue
        jmp .SUCC; continue repeating        
.Lab2:  LOADC r14; rax
        mov r14, rax; new front
        jmp .Lab3; can't do this with 4 loop
;; geraut ;;;;;;;;;;;;;;;;;;;_;;;;;;;;;;;;;;
.Iep:   lea rax, [rel void];
        PUTS rax;
        mov rax, 0; exit code
        ret;
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;
;; log: - Did you know tht in crontab d'flds
;; may be separatd by spacs or tabs, but the
;; maxmum permited length for the comand fld
;; is 998 characters?
;; Q: - Your mother, or father never treated
;; you as winner neither loser but all other
;; think of you that way, why?
;; A: - Becuz that is the only way, they can
;; gain something from you!
;;
;; 223T$ PRO=topsort make -f ../nasm.mk
;; gcc -gdwarf topsort.o
;; 223T$ ./a.out 
;; [COUNT] SUCC 9: [0] 5 2 
;; [COUNT] SUCC 8: [2] 6 
;; [COUNT] SUCC 7: [1] 4 5 
;; [COUNT] SUCC 6: [2] 
;; [COUNT] SUCC 5: [2] 8 
;; [COUNT] SUCC 4: [1] 6 
;; [COUNT] SUCC 3: [1] 7 
;; [COUNT] SUCC 2: [1] 8 
;; [COUNT] SUCC 1: [0] 3 
;; [COUNT] SUCC 0: [0] 
;; Wet'z,goo:
;;  9 1 2 3 7 4 5 8 6
;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;,,,,;;;;

