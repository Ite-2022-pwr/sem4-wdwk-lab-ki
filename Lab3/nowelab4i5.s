EXIT_NR  = 1
READ_NR  = 3
WRITE_NR = 4

STDOUT = 1
STDIN = 0
EXIT_CODE_SUCCESS = 0

data_len = 32

.bss
	first : .space data_len
	second : .space data_len
	out : .space data_len

.text

.global div
.type div, @function

div:
	push %ebx
_begin:
	# Reset out - ustawienie na 0
	mov $out, %edi
	mov $0, %eax
	mov $data_len, %ecx
	rep stosb

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

	mov $0, %cl	# przeniesienie

mainloop:
	mov $data_len, %esi	# index


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
	cmp $0, %cl
	jnz result		# Jesli przeniesienie > 0 to liczba jest ujemna wiec koniec algorytmu

	mov $data_len, %esi	# index

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

result:
	# Korekcja wyniku
	mov $data_len, %esi	# index
	mov $0, %cl		# przeniesienie

	loop2:
	dec %esi

	cmp $0, %esi
	jl write

	movb first(%esi), %al	# Kopiuj bajt pierwszej liczby
	add second(%esi), %al	# Odejmij bajt drugiej liczby
	setc %bl		# Ustaw przeniesienie z odej liczb
	add %cl, %al		# Odejmij poprzednie przeniesienie
	movb %al, first(%esi)	# Kopiuj bajt do wyniku
	setc %cl		# Ustaw nowe przeniesienie z odej poprzedniego przeniesienia
	add %bl, %cl		# Dodaj przeniesienia -> do %cl

	jmp loop2

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

