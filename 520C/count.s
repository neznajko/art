/*------1-------2-------3-------4-------5-------6-------7------*/
	.data
	.equ 	n, 16 /* number of keys */
key:	.long	503,  87, 512,  61, 908, 170, 897, 275
	.long	653, 426, 154, 509, 612, 677, 765, 703
	/* C1. [Clear COUNTs] */
	.lcomm	cnt, n*4
fmt:	.asciz	"%4d\n"
	.text
	.global main
	.include "communism.s"
main:   enter	$0, $0
	call	clean
	/* C2. [Loop on i] */
	mov	$(n - 1), %ecx
C2:	mov	key(,%ecx,4), %eax	/* Ki */
	mov	%ecx, %edx
	/* C3. [Loop on j] */
C3:	dec	%edx
	jl	1f
	/* C4. [Compare Ki:Kj] */
C4:	mov	key(,%edx,4), %ebx	/* Kj */
	cmp	%eax, %ebx
	jg	2f
	incl	cnt(,%ecx,4)
	jmp	3f
2:	incl	cnt(,%edx,4)
3:	jmp	C3
1:	dec	%ecx
	jg	C2
	/* spit	*/
	sub	$8, %esp
	movl	$fmt, (%esp)
	xor	%esi, %esi
1:	mov	cnt(,%esi,4), %eax
	mov	%eax, 4(%esp)		
	call	printf
	inc	%esi
	cmp	$n, %esi
	jnz	1b
	add	$8, %esp
	leave	
	ret
