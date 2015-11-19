	.file	"assembly_embedded_c.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"Assembly added value of z is %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
#APP
# 6 "assembly_embedded_c.c" 1
	subq $16, %rsp
	movl $2, -8(%rbp)
	movl $4, -12(%rbp)
	movl -8(%rbp), %eax
	movl -12(%rbp), %edx
	addl %eax, %edx
	movl %edx, -4(%rbp)
	
# 0 "" 2
#NO_APP
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 5.2.0"
	.section	.note.GNU-stack,"",@progbits
