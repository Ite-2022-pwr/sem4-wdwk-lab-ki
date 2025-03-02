# Numbers of kernel functions.
EXIT_NR  = 1
READ_NR  = 3
WRITE_NR = 4

STDOUT = 1
STDIN = 0
EXIT_CODE_SUCCESS = 0

buff_len = 1
out_len = 3

.bss
buff : .space buff_len
out: .space out_len
	
.text

.global _start

_start:
	mov $READ_NR, 	%eax
	mov $STDIN, 	%ebx
	mov $buff, 	%ecx
	mov $buff_len,	%edx
	int $0x80

	cmp $buff_len, %eax # sprawdzenie czy zakonczono wczytywanie
	jl end

	movb buff, %al	# w al beda starsze bity
	mov %al, %bl	# w bl beda mlodsze bity

	shr $4, %al	# przesuniecie bitowe o 4 w prawo -> zostaja 4 starsze bity
	cmp $10, %al
	jl cyfryA	# cyfry 0-9
	jmp literyA	# znaki A-F

next4bits:
	and $0x0F, %bl	# zostaja 4 mlodsze bity
	cmp $10, %bl
	jl cyfryB	# cyfry 0-9
	jmp literyB	# znaki A-F

write:
	mov $out, %esi		# w esi przechowujemy wynik
	movb %al, 0(%esi)	# Zapis w buforze wyjsciowym - starsze bity 
	movb %bl, 1(%esi)	# - mlodsze bity
	movb $'\n', 2(%esi)	# endl

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


cyfryA:
	add $48, %al	# 48 -> kod ASCII zera
	jmp next4bits

literyA:
	add $55, %al	# 65 - 10 = 55 <- 65 = kod ASCII litery A
	jmp next4bits

cyfryB:
	add $48, %bl
	jmp write

literyB:
	add $55, %bl
	jmp write
