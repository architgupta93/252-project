#include <stdio.h>

int main()
{
	int z = 0;
	__asm__(
		"subq $16, %rsp\n\t"
		"movl $2, -8(%rbp)\n\t"
		"movl $4, -12(%rbp)\n\t"
		"movl -8(%rbp), %eax\n\t"
		"movl -12(%rbp), %edx\n\t"
		"addl %eax, %edx\n\t"
		"movl %edx, -4(%rbp)\n\t"
	);
	printf("Assembly added value of z is %d\n",z);
	return 0;
}
