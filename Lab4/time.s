.global readTime
.type readTime, @function

readTime:
	push %ebx
	xor %eax, %eax
	cpuid
	rdtsc
	pop %ebx
	ret

