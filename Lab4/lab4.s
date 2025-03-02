	.file	"lab4.c"
	.text
	.globl	dx
	.data
	.align 8
	.type	dx, @object
	.size	dx, 8
dx:
	.long	3944497965
	.long	1058682594
	.globl	result
	.bss
	.align 8
	.type	result, @object
	.size	result, 8
result:
	.zero	8
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
	fld1
	fstpl	-8(%rbp)
	jmp	.L2
.L3:
	fldl	-8(%rbp)
	fmull	-8(%rbp)
	fmull	-8(%rbp)
	fmull	-8(%rbp)
	fsubl	-8(%rbp)
	fldl	-8(%rbp)
	fldl	.LC1(%rip)
	fmulp	%st, %st(1)
	fld1
	fsubp	%st, %st(1)
	fdivrp	%st, %st(1)
	fldl	dx(%rip)
	fmulp	%st, %st(1)
	fldl	result(%rip)
	faddp	%st, %st(1)
	fstpl	result(%rip)
	fldl	dx(%rip)
	fldl	-8(%rbp)
	faddp	%st, %st(1)
	fstpl	-8(%rbp)
.L2:
	fldl	-8(%rbp)
	fldl	.LC2(%rip)
	fucomip	%st(1), %st
	fstp	%st(0)
	jnb	.L3
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC1:
	.long	0
	.long	1074266112
	.align 8
.LC2:
	.long	0
	.long	1075052544
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
