	.file	"nowacalka.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5512:
	.cfi_startproc
	endbr64
	vmovsd	dx(%rip), %xmm4
	vmulsd	.LC1(%rip), %xmm4, %xmm9
	vxorpd	%xmm3, %xmm3, %xmm3
	vmulsd	.LC2(%rip), %xmm4, %xmm8
	vmovsd	.LC0(%rip), %xmm2
	vaddsd	%xmm4, %xmm4, %xmm10
	vmovapd	.LC3(%rip), %ymm7
	vmovapd	.LC4(%rip), %ymm6
	vbroadcastsd	%xmm4, %ymm11
	vmovsd	.LC5(%rip), %xmm5
	.p2align 4,,10
	.p2align 3
.L2:
	vaddsd	%xmm2, %xmm4, %xmm0
	vaddsd	%xmm2, %xmm10, %xmm1
	vaddsd	%xmm2, %xmm9, %xmm12
	vunpcklpd	%xmm0, %xmm2, %xmm0
	vaddsd	%xmm8, %xmm2, %xmm2
	vunpcklpd	%xmm12, %xmm1, %xmm1
	vinsertf128	$0x1, %xmm1, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm1
	vcomisd	%xmm2, %xmm5
	vmulpd	%ymm0, %ymm1, %ymm1
	vfmsub132pd	%ymm0, %ymm0, %ymm1
	vfnmadd132pd	%ymm7, %ymm6, %ymm0
	vdivpd	%ymm0, %ymm1, %ymm0
	vfmadd231pd	%ymm11, %ymm0, %ymm3
	jnb	.L2
	vmovsd	result(%rip), %xmm0
	vunpckhpd	%xmm3, %xmm3, %xmm1
	xorl	%eax, %eax
	vaddsd	%xmm3, %xmm0, %xmm0
	vextractf128	$0x1, %ymm3, %xmm3
	vaddsd	%xmm1, %xmm0, %xmm0
	vaddsd	%xmm3, %xmm0, %xmm0
	vunpckhpd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm0, %xmm0
	vmovsd	%xmm0, result(%rip)
	vzeroupper
	ret
	.cfi_endproc
.LFE5512:
	.size	main, .-main
	.globl	result
	.bss
	.align 8
	.type	result, @object
	.size	result, 8
result:
	.zero	8
	.globl	dx
	.data
	.align 8
	.type	dx, @object
	.size	dx, 8
dx:
	.long	-350469331
	.long	1058682594
	.set	.LC0,.LC4
	.set	.LC1,.LC3
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1074790400
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC3:
	.long	0
	.long	1074266112
	.long	0
	.long	1074266112
	.long	0
	.long	1074266112
	.long	0
	.long	1074266112
	.align 32
.LC4:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.section	.rodata.cst8
	.align 8
.LC5:
	.long	0
	.long	1075052544
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
