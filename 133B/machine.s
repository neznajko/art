//      ;       -       ,       :       \       /       _	,
        .att_syntax noprefix
        .globl main
        .include "gas.s"
        .data
f1:     .asciz "(acfg)(bcd)(aed)(fade)(bgfae)"
	.lcomm T, 26/* Table with permutation's ascii offsets */
        .text
////////////////////////////////////////////////////////////////	
////////////////        ////////////////////////////////________
////////////////////////////////////////////////////////""""""""
////////////////////////////////////////\\\\\\\\////////''''''''
////////________--------````````========        >>>>>>>>........
// r8  -                        rax -
// r9  -                        rbx - j
// r10 -                        rcx - i
// r11 -                        rdx - z
// r12 - T                      rsi -
// r13 - n = len( T ) - 1       rdi -
// r14 - k = len( f1 )
// r15 - f1
////////////////////////////////////////////////////////////////
main:   nop                     /* gdb                        */
        clear                   /* __                         */
        lea f1(rip), r15        /* 8(                         */
	lea T(rip), r12         /*                            */
	call fwdpas             /* get f1 length and n        */
        call initT              /* initialize T               */
        call bwdpas             /*                            */
        mov $0, rax             /* exit code                  */
        ret                     /* kpaG                       */
////////////////////////////////////////////////////////////////
// spec no more: put character's ch offset to rcx              *
//#    #  #     #   #           #  #      #  #   ###############
//=    =  =     =   =           =  =      =  =   ===============
//-    -  -     -   -           -  -      -  -   ---------------
//.    .  .     .   .           .  .      .  .   ...............
.macro	off ch
	lea 1-'a( \ch ), rcx
.endm
////////////////////////////////////////////////////////////////
// spec: Loop over f1, find n and f1's length.
////////////////////////////////================================
fwdpas:	nop                     /* forward pass               */
	mov $-1, r14            /* check this out             */
1:	inc r14                 /* ++k                        */
	mov (r15,r14), al       /* al <- f1[k]                */
	cmp $0, al              /* zero byte?                 */
	jz  0f                  /* jep                        */
     	off rax                 /* -> rcx                     */
	cmp rcx, r13            /* r13 >= rcx ?               */
	jge 1b                  /* yep                        */
	mov rcx, r13            /* update                     */
	jmp 1b                  /* one more loop              */
0:	ret                     /* bye                        */
////////////////////////////////////////////////////////////////
initT:  nop                     /*                            */
        mov r13, rax            /* copy n to rax              */
1:      mov al, (r12,rax)       /* T[n] <- n                  */
        dec rax                 /* --n                        */
        cmp $0, rax             /* n >= 0?                    */
        jge 1b                  /* yep                        */
        ret                     /* :)                         */
////////////////////////////////////////////////////////////////
bwdpas: nop                     /* backward pass              */
        mov $0, rax             /* clear rax register         */
1:      dec r14                 /* --k                        */
        cmp $0, r14             /* k >= 0?                    */
        jl  0f                  /* nope                       */
        mov (r15,r14), al       /* al <- f1[k]                */
        cmp $'), al             /* al = ) ?                   */
        jnz 2f                  /* nop                        */
        mov $0, rdx             /* z <- 0                     */
        jmp 1b                  /* clck prev                  */
2:      cmp $'(, al             /* al = ( ?                   */
        jnz 3f                  /* negative                   */
        mov dl, (r12,rbx)       /* T[j] <- z                  */
        jmp 1b                  /* yeeh                       */
3:      off rax                 /* get character's offset     */
        mov (r12,rcx), al       /* al <- T[i]                 */
        mov dl, (r12,rcx)       /* T[i] <- z                  */
        mov rax, rdx            /* z <- al                    */
        cmpb $0, (r12,rcx)      /* T[i] = 0?                  */
        jnz 1b                  /* en ou pe                   */
        mov rcx, rbx            /* j <- i                     */
        jmp 1b                  /* haHa                       */
0:      ret                     /*                            */
////////////////////////////////////////////////////////////////
// $ PRO=machine make -f ../gas.mk
////////////////////////////////////////////////////////////////
// $ gdb ./a.out/
////////////////////////////////////////////////////////////////
// (gdb) b main
// (gdb) r
// (gdb) b 87
// (gdb) c 
////////////////////////////////////////////////////////////////
// (gdb) x/8db $r12
////////////////////////////////////////////////////////////////
// 0x555555558090 <T>:   0   4   3   5   7   2   6   1
////////////////////////////////////////////////////////////////
