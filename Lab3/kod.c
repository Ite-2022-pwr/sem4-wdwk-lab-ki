#include <stdio.h>
extern long long int readTime();
extern void div();


int main() {

	long long int start = readTime();
	div();
	long long int end = readTime();
	long long int time = end - start;
			
	printf("%lld ticks\n", time);
	
	return 0;
}

/*

lstudent@lab21-11:~/WdWK272936/lab6i7$ as -g -32 time.s -o time.o
lstudent@lab21-11:~/WdWK272936/lab6i7$ as -g -32 lab4i5.s -o lab4i5.o
lstudent@lab21-11:~/WdWK272936/lab6i7$ gcc -g -m32 kod.c time.o lab4i5.o -o program
lstudent@lab21-11:~/WdWK272936/lab6i7$ ./program < dane/din32 > wy
lstudent@lab21-11:~/WdWK272936/lab6i7$ hexdump -C wy

lstudent@lab21-11:~/WdWK272936/lab6i7$ for i in {1..100}; do ./program < dane/din32; done

*/
