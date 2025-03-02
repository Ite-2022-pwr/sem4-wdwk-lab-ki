.global readTime
.type readTime, @function

readTime:
	
	xor %eax, %eax
	cpuid
	rdtsc
	
	ret

