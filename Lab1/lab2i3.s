# Numbers of kernel functions.
EXIT_NR  = 1
READ_NR  = 3
WRITE_NR = 4

STDOUT = 1
STDIN = 0
EXIT_CODE_SUCCESS = 0

buff_len = 3
out_len = 1

.bss
buff : .space buff_len
out : .space out_len

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

	mov $buff, %ecx
	movb 0(%ecx), %al
	movb 1(%ecx), %bl

	subb $48, %al
	cmp $9, %al
	jg literaA

nastepna: 
	subb $48, %bl
	cmp $9, %bl
	jg literaB

zapis:
	shl $4, %al
	add %bl, %al

	mov $out, %esi # wynik
	movb %al, 0(%esi)

	mov $WRITE_NR, 	%eax 
	mov $STDOUT, 	%ebx 
	mov $out, 	%ecx 
	mov $out_len, 	%edx 
	int $0x80
	jmp _start

end:
	mov $EXIT_NR          , %eax
	mov $EXIT_CODE_SUCCESS, %ebx 
	int $0x80


literaA:
	subb $7, %al
	jmp nastepna


literaB:
	subb $7, %bl
	jmp zapis
