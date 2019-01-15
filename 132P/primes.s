/* P1. [Start table]
 * P2. [N is prime]	
 * P3. [500 found?]	
 * P4. [Advance N]	
 * P5. [K <- 2]
 * P6. [PRIME[K]\N?]
 * P7. [PRIME[K] large?]
 * P8. [Advance K]       */
	.include "communism.s"
	.data
	.equ	L, 500
	.lcomm	prime, L*4
	.equ	LINEZ, 50		/* number of output lines */
	.lcomm	buf, LINEZ+1		/* output buffer */
fmt:	.asciz	" %04d\n"
	.text
	.global main
main:
	enter 	$0, $0
	call	clean
P1:	movl	$2, prime(,%ecx,4)
	inc	%ecx			/* J */
	mov	$3, %ebx		/* N */
P2:	mov	%ebx, prime(,%ecx,4)    /* PRIME[J] <- N */
	inc	%ecx
P3:	cmp	$L, %ecx
	jz	Spit
P4:	add	$2, %ebx
P5:	mov	$1, %esi		/* K */
P6:	xor	%edx, %edx
	mov	%ebx, %eax
	mov	prime(,%esi,4), %edi
	div	%edi
	cmp	$0, %edx
	jz	P4
P7:	cmp	%edi, %eax
	jng	P2
P8:	inc	%esi
	jmp	P6
Spit:
	sub	$12, %esp		/* 3 args */
	movl	$fmt, 4(%esp)		/* second */
	xor	%esi, %esi		
1:	mov	%esi, %ebx
	mov	$buf, %edi
2:	mov	prime(,%ebx,4), %edx
	mov	%edx, 8(%esp)		/* third */
	mov	%edi, (%esp)		/* first */
	call	sprintf			/* this is trashing */
	add	$5, %edi
	add	$LINEZ,	%ebx
	cmp	$L, %ebx
	jb	2b
	push	$buf
	call 	printf
	add	$4, %esp
	inc	%esi
	cmp	$LINEZ, %esi
	jb	1b
	add	$12, %esp
	leave
	ret
