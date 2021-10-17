//      ;       -       ,       :       \       /       _ 
        .att_syntax noprefix
        .globl main
        .include "gas.s"
        .data
f1:     .asciz  "(acfg)(bcd)(aed)(fade)(bgfae)="
tag:    .string "------------------------------"
        .equ G, .-tag-2 /* Guardian position */
output: .string "=============================="
        .text
// rdi - f1
// rsi - tag
// rcx - j( f1/tag offset)
// rax - buffer
// rbx - key( current)
// rdx - start
// r15 - output
// r8  - k( output offset)
// Use gcc -g -I ../lib cycle.s to compile the program.
////////////////////////////////////////////////////////
// dump for debugging( f1, tag, and output)
// 64-bit calling conventions:( rdi, rsi, rdx, rcx, ..)
dmp:    nop
        pushq                 /* backup */
        lea f1( rip), rdi     /* :f */
        call puts             /* check this out */
        lea tag( rip), rdi    /* :? */
        call puts             /* puts is the best! */
        lea output( rip), rdi /* 8o */
        call puts             /* check this out */
        popq                  /* re-establish */
        ret                   /* gerout */
//
.macro maketag pos=rcx
    movb $'v,( rsi,\pos)
.endm
// first pass
fstpas: nop
1:      inc rcx             /* mov fwrd */
        cmp $G, rcx         /* r we don? */
        jz 1f               /* jep */
        mov 0( rdi,rcx), al /* f1@j */
        cmp $'(, al         /* ( ? */
        jnz 2f              /* nop */
        // Tag this one, and backup the next.
        maketag             /* thats */
        mov 1( rdi,rcx), ah /* backup f1@j+1 */
2:      cmp $'), al         /* ) ? */
        jnz 1b              /* nop */
        // Tag and replace with backup
        mov ah,( rdi,rcx)   /* f1@j <- backup */
        maketag             /* gas rulz */
        jmp 1b              /* follow me */
1:      ret                 /* :! HsMa BpeMe */
////////////////////////////////////////////////////////
find_next_start: /* position rdx over start */
    	nop /* èn ó pë */
        mov $'v, al /* copy to al */
1:      inc rdx /* rdx=0 is (, so staát from 1 */
        cmp (rsi,rdx), al /* is tag@rdx checked? */
        jz 1b /* yeep keep searching */
        ret /* áu revoìr */
////////////////////////////////////////////////////////
.macro psh c /* push c to output */
        movb \c,( r15, r8) /* * ` * * * * * * * * * * */
        inc r8 /* * * * * * * * * * * * * * * * * * * */
.endm
////////////////////////////////////////////////////////
process_next_cycle:
        nop /* let's go */
        psh $'( /* output ( */
        mov (rdi,rdx), al /* copy f1@staät to al */
        psh al /* push it to output */
        maketag rdx /* and tag */
        mov rdx, rcx /* j << staät */
1:      inc rcx /* Position over the key. */
        mov (rdi,rcx), bl /* { okey} */
        mov bl, G( rdi) /* copy to Guardian */
2:      inc rcx /* rewind a little bit */
        cmp (rdi,rcx), bl /* f1@j = key? */
        jnz 2b /* N O P ¡ */
        cmp $G, rcx /* found? */
        jz 1f /* [ëN] [Ò] [pé] */
        maketag /* do the tag */
        jmp 1b /* follow me! */
1:      cmp (rdi,rdx), bl /* key equal to f1@start? */
        jz 1f /* positive */
        psh bl /* write to output */
        mov rdx, rcx /* a bit of repetition */
        jmp 2b /* follow me! */
1:      psh $') /* close the cycle */
        ret /* jeeh */
////////////////////////////////////////////////////////
main:   nop                     /* gdb */
        clear                   /* __ */
        mov $-1, rcx            /* 8. */
        lea f1( rip), rdi       /* 8( */
        lea tag( rip), rsi      /* 8" */
        lea output( rip), r15   /* 8o */
        call dmp                /* ok dunp */
        call fstpas             /* up to . is working */
1:      call find_next_start    /* [ 1] */
        cmp $G, rdx             /* r we don? */
        jz 2f                   /* CORRECT is correct */
        call process_next_cycle /* [ ~] */
        jmp 1b                  /* after me! */
2:      call dmp                /* au revoìr */
        mov $0, rax             /* exit code */
        ret                     /* kpaG */
////////////////////////////////////////////////////////
// log: - Knuth algorithms are weird                 [v]
