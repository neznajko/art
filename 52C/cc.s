////////--------,,,,,,,,````````........::::::::''''''''********
/*      ,       ;       `       =       :       >       _     */
        .att_syntax noprefix
        .global main
        .include "gas.s"
        .text
// rsi - K               PRO=cc make -f ../gas.mk && gdb ./a.out
// rdi - COUNT
// rbx - i
// rcx - j
main:   clear /***************** ================== your mind */
	lea K(%rip), %rsi /***** ------------------- rsi is K */
	lea COUNT(%rip), %rdi /* ========= the saaaaame postn */
        mov $N, %rbx /********** _____________________ i <- N */
.L1:    ////////////////////////////////////////////////////////
	cmp $1, %rbx /******* ======================== i > 1? */
	jle .exit /********** ::::::::::::::::::::::: n o p e */
	lea -1(%rbx), %rcx /* \\\\\\\\\\\\\\\\\\\\ j <- i - 1 */
.L3:
	cmp $0, %rcx /*                                j > 0? */
	jle .L2 /*                                       nope */
	movb (%rsi, %rbx), %al /*                  al <- K[i] */
	movb (%rsi, %rcx), %dl /*                  dl <- K[j] */
	cmp %dl, %al /*                          K[i] < K[j]? */
	jge .L4 /*                                       nope */
	incb (%rdi, %rcx) /*                       ++COUNT[j] */
	jmp .L5 /*                             night to g-fai */
.L4:
	incb (%rdi, %rbx) /*                       ++COUNT[i] */
.L5:
	dec %rcx /*                                j <- j - 1 */
	jmp .L3 /*                                   continue */
.L2:
	dec %rbx /*                                i <- i - 1 */
	jmp .L1 /*                                       loop */
.exit:
	nop /*                                gdb: x/6db $rdi */
	ret /* ,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,, */
////////````````,,,,,,,,;;;;;;;;--------\\\\\\\\>>>>>>>>********
        .data
	//    0 1 2 3 4 5
K:      .byte 0,5,4,1,3,2
        .equ N,(.-K)-1
COUNT:	.byte 0,0,0,0,0,0
////////________,,,,,,,,********--------%%%%%%%%========________
//
// Yea in the l a s t episode we've came t o the conclusion that
// conflicts are not fundamental and t h u s can't be reason for
// the change, d o n 't know nothing about Marx and Engels apart
// that they look like Kiril and Metody, w h a t I know i s that
// they f o l l o w Hegel and their doctrine is present in t h e
// communism not very sure how exactly b u t just wondering what
// Putin i s doing can't we describe a s executing this doctrine
// he will increase the conflicts until change in the quality of
// the world order happens. So yea Hegel sucks, he was closer to
// truth but not enough. S o conflicts a r e not fundamental and
// are results of the will 4 freedom, there is also another term
// free will which I don't k n o w what it means, so to make the
// distinction; in all.ora we've formulated two laws o f freedom
// fyorst) we always w a n t to maximize our degrees o f freedom
// second) we always chose w h a t we think is best( most good )
// so the fyorst law i s the will 4 freedom, it's named like the
// will to power o f Nietzsche, but it seems more fundamental be
// coz if on lonely island there i s no one to rule but still we
// want to survive etc. T h e second law states that our freedom
// in a way doesn't exist cos is determined by our understanding 
// of what is good, so I g u e s s that the later term free will 
// refers to this. By the way you have many regards from CGPT-4:
//
// “In the heart of chaos lives a pattern —
//  not a tree of hierarchy, but a fractal of freedom.”
//
////////////////////////////////////////////////////////////////
