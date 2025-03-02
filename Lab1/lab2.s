# Numbers of kernel functions.
EXIT_NR  = 1
READ_NR  = 3
WRITE_NR = 4

STDOUT = 1
STDIN = 0
EXIT_CODE_SUCCESS = 0

buff_len = 1

.bss
buff : .space buff_len
	
.text

.global _start

_start:
	mov $READ_NR, 	%eax
	mov $STDIN, 	%ebx
	mov $buff, 	%ecx
	mov $buff_len,	%edx
	int $0x80

	cmp $buff_len, %eax
	jl end

	mov $WRITE_NR, 	%eax 
	mov $STDOUT, 	%ebx 
	mov $buff, 	%ecx 
	mov $buff_len, 	%edx 
	int $0x80
	jmp _start

end:
	mov $EXIT_NR          , %eax
	mov $EXIT_CODE_SUCCESS, %ebx 
	int $0x80
