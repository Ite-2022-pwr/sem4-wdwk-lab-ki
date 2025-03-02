EXIT_NR  = 1
READ_NR  = 3
WRITE_NR = 4

STDOUT = 1
STDIN = 0
EXIT_CODE_SUCCESS = 0

buff_len = 1
data_len = 32

.bss
	buff : .space buff_len
	first : .space data_len
	second : .space data_len
	out : .space data_len

.text

.global div
.type div, @function

div:
	push %ebx
_begin:
	mov $0, %eax
reset:
	cmp $data_len, %eax
	jz dalej
	movb $0, out(%eax)
	inc %eax
	jmp reset


dalej:
	mov $READ_NR, 	%eax
	mov $STDIN, 	%ebx
	mov $first, 	%ecx
	mov $data_len,	%edx
	int $0x80

	cmp $data_len, %eax
	jl end

	mov $READ_NR, 	%eax
	mov $STDIN, 	%ebx
	mov $second, 	%ecx
	mov $data_len,	%edx
	int $0x80

	mov $-1, %edi # Q; R = first; D = second

mainloop:
	mov $0, %eax
compare:
	cmp $data_len, %eax # Liczby są równe
	jz next

	movb first(%eax), %bl
	movb second(%eax), %cl
	inc %eax
	cmp %bl, %cl
	ja write

	cmp %bl, %cl
	jz compare


next:
	mov $data_len, %esi	# index
	mov $0, %cl		# przeniesienie


loop:
	dec %esi

	cmp $0, %esi
	jl dodajjeden

	movb first(%esi), %al	# Kopiuj bajt pierwszej liczby
	subb second(%esi), %al	# Odejmij bajt drugiej liczby
	setc %bl		# Ustaw przeniesienie z odej liczb
	subb %cl, %al		# Odejmij poprzednie przeniesienie
	movb %al, first(%esi)	# Kopiuj bajt do wyniku
	setc %cl		# Ustaw nowe przeniesienie z odej poprzedniego przeniesienia
	add %bl, %cl		# Dodaj przeniesienia -> do %cl

	jmp loop 


dodajjeden:
	mov $data_len, %esi	# index
	mov $0, %cl		# przeniesienie

dodaj:
	dec %esi

	cmp $0, %esi
	jl mainloop

	mov out(%esi), %al
	add $1, %al
	movb %al, out(%esi)	# Kopiuj bajt do wyniku
	setc %cl
	cmp $0, %cl
	jnz dodaj
	jmp mainloop

write:
	#mov $WRITE_NR, %eax 
	#mov $STDOUT, 	%ebx 
	#mov $out, 	%ecx 
	#mov $data_len, %edx 
	#int $0x80

	#mov $WRITE_NR, %eax 
	#mov $STDOUT, 	%ebx 
	#mov $first, 	%ecx 
	#mov $data_len, %edx 
	#int $0x80

	jmp _begin

end:
	pop %ebx
	ret

