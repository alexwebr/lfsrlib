	.file	"lfsr.c"
	.text
	.globl	lfsr_xor_taps
	.type	lfsr_xor_taps, @function
lfsr_xor_taps:
.LFB0:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -8(%ebp)
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$1, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	addl	$1, -8(%ebp)
	jmp	.L2
.L3:
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$1, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	-4(%ebp), %eax
	sete	%al
	movzbl	%al, %eax
	movl	%eax, -4(%ebp)
	addl	$1, -8(%ebp)
.L2:
	movl	-8(%ebp), %eax
	cmpl	20(%ebp), %eax
	jb	.L3
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	lfsr_xor_taps, .-lfsr_xor_taps
	.globl	lfsr_xnor_taps
	.type	lfsr_xnor_taps, @function
lfsr_xnor_taps:
.LFB1:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	$0, -8(%ebp)
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$1, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	addl	$1, -8(%ebp)
	jmp	.L6
.L7:
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	16(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	subl	$1, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	-4(%ebp), %eax
	setne	%al
	movzbl	%al, %eax
	movl	%eax, -4(%ebp)
	addl	$1, -8(%ebp)
.L6:
	movl	-8(%ebp), %eax
	cmpl	20(%ebp), %eax
	jb	.L7
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	lfsr_xnor_taps, .-lfsr_xnor_taps
	.globl	lfsr_shift
	.type	lfsr_shift, @function
lfsr_shift:
.LFB2:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	12(%ebp), %eax
	subl	$1, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	jmp	.L10
.L11:
	movl	12(%ebp), %eax
	subl	$1, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%eax, %edx
	movl	12(%ebp), %eax
	subl	$2, %eax
	leal	0(,%eax,4), %ecx
	movl	8(%ebp), %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%eax, (%edx)
	subl	$1, 12(%ebp)
.L10:
	cmpl	$1, 12(%ebp)
	ja	.L11
	movl	8(%ebp), %eax
	movl	16(%ebp), %edx
	movl	%edx, (%eax)
	movl	-4(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	lfsr_shift, .-lfsr_shift
	.globl	lfsr_dump
	.type	lfsr_dump, @function
lfsr_dump:
.LFB3:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	movl	$0, -16(%ebp)
	movl	$0, -12(%ebp)
	jmp	.L14
.L17:
	movl	-16(%ebp), %eax
	movl	$0, %edx
	movl	%eax, -40(%ebp)
	movl	%edx, -36(%ebp)
	fildq	-40(%ebp)
	fstpt	-56(%ebp)
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L15
	movl	-12(%ebp), %eax
	movl	$0, %edx
	movl	%eax, -40(%ebp)
	movl	%edx, -36(%ebp)
	fildq	-40(%ebp)
	fstpt	12(%esp)
	movl	$0, %eax
	movl	$-2147483648, %edx
	movl	$16384, %ecx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	call	powl
	jmp	.L16
.L15:
	fldz
.L16:
	fldt	-56(%ebp)
	faddp	%st, %st(1)
	fnstcw	-26(%ebp)
	movzwl	-26(%ebp), %eax
	movb	$12, %ah
	movw	%ax, -28(%ebp)
	fldcw	-28(%ebp)
	fistpq	-40(%ebp)
	fldcw	-26(%ebp)
	movl	-40(%ebp), %eax
	movl	-36(%ebp), %edx
	movl	%eax, -16(%ebp)
	addl	$1, -12(%ebp)
.L14:
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	.L17
	movl	-16(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	lfsr_dump, .-lfsr_dump
	.globl	lfsr_load
	.type	lfsr_load, @function
lfsr_load:
.LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	12(%ebp), %eax
	subl	$1, %eax
	movl	%eax, -12(%ebp)
	jmp	.L20
.L23:
	fildl	-12(%ebp)
	fstpt	12(%esp)
	movl	$0, %eax
	movl	$-2147483648, %edx
	movl	$16384, %ecx
	movl	%eax, (%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, 8(%esp)
	call	powl
	fnstcw	-26(%ebp)
	movzwl	-26(%ebp), %eax
	movb	$12, %ah
	movw	%ax, -28(%ebp)
	fldcw	-28(%ebp)
	fistpq	-40(%ebp)
	fldcw	-26(%ebp)
	movl	-40(%ebp), %eax
	movl	-36(%ebp), %edx
	movl	%eax, -16(%ebp)
	movl	16(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jb	.L21
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	$0, (%eax)
	movl	-16(%ebp), %eax
	subl	%eax, 16(%ebp)
	jmp	.L22
.L21:
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	$1, (%eax)
.L22:
	subl	$1, -12(%ebp)
.L20:
	cmpl	$0, -12(%ebp)
	jns	.L23
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	lfsr_load, .-lfsr_load
	.ident	"GCC: (Debian 4.7.1-7) 4.7.1"
	.section	.note.GNU-stack,"",@progbits
