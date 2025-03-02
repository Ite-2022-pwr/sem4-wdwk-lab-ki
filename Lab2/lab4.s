EXIT_NR  = 1
READ_NR  = 3
WRITE_NR = 4

STDOUT = 1
STDIN = 0
EXIT_CODE_SUCCESS = 0

buff_len = 1
data_len = 256

.bss
buff : .space buff_len
first : .space data_len
second : .space data_len
out : .space data_len

.text

.global _start

_start:
	mov $READ_NR, 	%eax
	mov $STDIN, 	%ebx
	mov $first, 	%ecx
	mov $data_len,	%edx
	int $0x80

	cmp $buff_len, %eax
	jl end

	mov $READ_NR, 	%eax
	mov $STDIN, 	%ebx
	mov $second, 	%ecx
	mov $data_len,	%edx
	int $0x80

	mov $data_len, %esi	# index
	mov $0, %cl		# przeniesienie

loop:
	dec %esi

	cmp $0, %esi
	jl write

	movb first(%esi), %al		# Kopiuj bajt pierwszej liczby
	add second(%esi), %al		# Dodaj bajt drugiej liczby
	setc %bl			# Ustaw przeniesienie z dodania liczb
	add %cl, %al			# Dodaj poprzednie przeniesienie
	movb %al, out(%esi)		# Kopiuj bajt do wyniku
	setc %cl			# Ustaw nowe przeniesienie z dodania poprzedniego przeniesienia
	add %bl, %cl			# Dodaj przeniesienia -> do %cl

	jmp loop 


write:
	mov $WRITE_NR, 	%eax 
	mov $STDOUT, 	%ebx 
	mov $out, 		%ecx 
	mov $data_len, 	%edx 
	int $0x80
	jmp _start

end:
	mov $EXIT_NR          , %eax
	mov $EXIT_CODE_SUCCESS, %ebx 
	int $0x80

# as lab4.s -o lab4.o && ld lab4.o -o lab4
