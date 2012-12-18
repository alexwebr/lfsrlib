	.file	"7bit.c"
	.section	.rodata
.LC0:
	.string	"%u\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$64, %esp
	movl	$1, 8(%esp)
	movl	$7, 4(%esp)
	leal	36(%esp), %eax
	movl	%eax, (%esp)
	call	lfsr_load
	movl	$7, 28(%esp)
	movl	$6, 32(%esp)
.L2:
	movl	$7, 4(%esp)
	leal	36(%esp), %eax
	movl	%eax, (%esp)
	call	lfsr_dump
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	movl	$2, 12(%esp)
	leal	28(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$7, 4(%esp)
	leal	36(%esp), %eax
	movl	%eax, (%esp)
	call	lfsr_xor_taps
	movl	%eax, 8(%esp)
	movl	$7, 4(%esp)
	leal	36(%esp), %eax
	movl	%eax, (%esp)
	call	lfsr_shift
	jmp	.L2
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 4.7.1-7) 4.7.1"
	.section	.note.GNU-stack,"",@progbits
