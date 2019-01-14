/*------0-------1-------2-------3-------4-------5-------6------*/
	.text
	.global	main
/*------0-------1-------2-------3-------4-------5-------6------*/
/* gcd specification:				               */
/* entry: edx:eax - m, ecx - n			               */
/* exit: ecx - gcd, eax and edx are trashed	               */
/*------0-------1-------2-------3-------4-------5-------6------*/
gcd:	nop
1:	div	%ecx 		/* eax <- q, edx <- r          */
	cmp	$0, %edx 	/* r = 0?                      */
	jz	2f
	mov	%ecx, %eax 	/* edx:eax <- n                */
	mov	%edx, %ecx 	/* ecx <- r                    */
	xor	%edx, %edx
	jmp	1b
2:	ret
main:	push	%ebp
	mov	%esp, %ebp
	
	xor	%edx, %edx	/* edx:eax <- m		       */
	mov	$2166, %eax
	mov	$6099, %ecx	/* ecx <- n		       */
	call	gcd

	mov	$0, %eax
	leave
	ret
