EXIT_NR  = 1
READ_NR  = 3
WRITE_NR = 4

STDOUT = 1
STDIN = 0
EXIT_CODE_SUCCESS = 0

index_len = 4
data_len = 256

.bss
index : .space index_len
first : .space data_len		# Fn-2
second : .space data_len	# Fn-1

.text

.global _start

_start:
	mov $0, %eax

reset:	# Zerujemy całe Fn-2 i Fn-1
	cmp $data_len, %eax
	jz set
	movb $0, first(%eax)
	movb $0, second(%eax)
	inc %eax
	jmp reset

set:
	dec %eax
	movb $0, first(%eax)	# Fn-2 = 0
	movb $1, second(%eax)	# Fn-1 = 1

	mov $READ_NR, 	%eax
	mov $STDIN, 	%ebx
	mov $index, 	%ecx
	mov $index_len,	%edx
	int $0x80

	cmp $index_len, %eax
	jl end

	mov index, %edi	# index ciągu

loop:
	dec %edi
	cmp $0, %edi
	jz write


	# Dodawanie Fn-2 i Fn-1
	mov $data_len, %esi	# index
	mov $0, %cl		# przeniesienie

next:
	dec %esi
		
	cmp $0, %esi
	jl loop

	movb first(%esi), %al		# Kopiuj bajt pierwszej liczby
	add second(%esi), %al		# Dodaj bajt drugiej liczby
	setc %bl			# Ustaw przeniesienie z dodania liczb
	add %cl, %al			# Dodaj poprzednie przeniesienie
		
	movb second(%esi), %ah
	movb %ah, first(%esi)		# Fn-1 staje się Fn-2
	movb %al, second(%esi)		# Kopiuj bajt do Fn-2

	setc %cl			# Ustaw nowe przeniesienie z dodania poprzedniego przeniesienia
	add %bl, %cl			# Dodaj przeniesienia -> do %cl

	jmp next


write:
	mov $WRITE_NR, 	%eax 
	mov $STDOUT, 	%ebx 
	mov $second, 	%ecx 
	mov $data_len, 	%edx 
	int $0x80
	jmp _start


end:
	mov $EXIT_NR          , %eax
	mov $EXIT_CODE_SUCCESS, %ebx 
	int $0x80

# as lab5.s -o lab5.o && ld lab5.o -o lab5
