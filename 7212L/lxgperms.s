/*      ,       ;       `       =       :       >       */
        .att_syntax noprefix
        .global main
        .include "gas.s"
        .data
fmt1:   .string "%d%c"
fmt2:   .string "[%s\n"
arr:    .int 0,1,2,2,4
        .equ n,(.-arr)/4-1 /* back */
        .equ bufsize, 32
        .equ outsize, 4096
        .text
// display (32-bit integer) array
// input: rax - a
//        rbx - n (back)
// r8  - buf
// r9  - out
// r10 - j
.macro  _backup
        push rax
        push rbx
        push r8
        push r9
        push r10
        push r10
.endm
.macro  _re_establish
        pop r10
        pop r10
        pop r9
        pop r8
        pop rbx
        pop rax
.endm
disparr:nop
        pushq
        // allocate local space
        sub $bufsize, rsp    /* buf (32)   */
        mov rsp, r8
        sub $outsize, rsp    /* out (4096) */
        mov rsp, r9
        // do the math
        xor r10, r10         /* 0 <- j */
        movb $0, (r9)        /* reset out */
        xor rdx, rdx         /* clear */
        xor rcx, rcx
1:      cmp rbx, r10         /* j == n? */
        jg 2f                /* yeh ! */
        movb $0, (r8)        /* reset buf */
        mov r8, rdi          /* 1st */
        lea fmt1(rip), rsi   /* sprintf 2nd */
        mov (rax,r10,4), edx /* 3rd (a[j]) */
        mov $'\,, cl         /* this is art */
        _backup
        xor rax, rax         /* varargs */
        call sprintf
        _re_establish
        mov r9, rdi
        mov r8, rsi
        _backup
        call strcat
        _re_establish
        inc r10              /* ++j */
        jmp 1b
2:      mov r9, rdi
        _backup
        call strlen
        movb $'], -1(r9,rax)
        _re_establish
        lea fmt2(rip), rdi
        mov r9, rsi
        xor rax, rax
        call printf
        // deallocate the stack
        add $(bufsize+outsize), rsp
        popq
        ret
// rax - a
// rbx - n
// r8  - j
// r9  - r
// r10 - output
next:   nop
        xor rcx, rcx         /* clear         */
        mov $0, r10          /* no moar       */
        // [find j]          //               //
        mov rbx, r8          /* j <- n        */
1:      dec r8               /* --j           */
        mov (rax,r8,4), ecx  /* ecx <- a[j]   */
        cmp 4(rax,r8,4), ecx /* a[j] < a[j+1] */
        jge 1b               /* nop           */
        // ck if don?        //               //
        cmp $0, r8           /* j = 0?        */
        jz 9f                /* yep!          */
        // [increace j]      //               //
        mov rbx, r9          /* r <- n        */
2:      mov (rax,r9,4), ecx  /* ecx <- a[r]   */
        cmp (rax,r8,4), ecx  /* a[j] < a[r]?  */
        jg 3f                /* yep!          */
        dec r9               /* r--           */
        jmp 2b               /* follow me!    */
3:      xchg (rax,r8,4), ecx /* a[j] <-> a[r] */
        mov ecx, (rax,r9,4)  /*               */
        // [reverse]
        mov rbx, r9 /**/
        inc r8 /**/
4:      cmp r8, r9 /**/
        jl 5f /**/
        mov (rax,r9,4), ecx /**/
        xchg (rax,r8,4), ecx /**/
        mov ecx, (rax,r9,4) /**/
        inc r8 /**/
        dec r9 /**/
        jmp 4b /**/
5:      mov $1, r10 /**/
9:      ret
//
main:   nop
        lea arr(rip), rax /* rax <- arr*/
        mov $n, rbx       /* rbx <- n  */
1:      call disparr
        call next
        cmp $0, r10
        jnz 1b
        ret
// log: gcc -g -I ../lib lxgperms.s
