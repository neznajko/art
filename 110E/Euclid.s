/*------0-------1-------2-------3-------4-------5-------6------*/
        .text
	.global main
/*------0-------1-------2-------3-------4-------5-------6------*/
/* ntry: rdx:rax - m, ecx - n			               */
/* exit: rcx - gcd, rax and rdx are trashed	               */
/*------0-------1-------2-------3-------4-------5-------6------*/
gcd:	nop
1:	div	%rcx 		/* eax <- q, edx <- r          */
	cmp	$0, %rdx 	/* r = 0?                      */
	jz	2f
	mov	%rcx, %rax 	/* edx:eax <- n                */
	mov	%rdx, %rcx 	/* ecx <- r                    */
	xor	%rdx, %rdx
	jmp	1b
2:	ret
main:   nop
	xor	%rdx, %rdx	/* rdx:rax <- m		       */
	mov	$2166, %rax
	mov	$6099, %rcx	/* rcx <- n		       */
	call	gcd
        /* print result */
        push    %rax /* align stack */
        lea     fmt(%rip), %rdi
        mov     %rcx, %rsi
        call    printf
        pop     %rax
	mov	$0, %rax
	ret
fmt:    .string  "gcd: %d\n"
// log:
