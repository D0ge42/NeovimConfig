#include <stdio.h>
#include <unistd.h>
int main()
{
	int i = 0;
	printf("%d\n",123);
	write(1,&i,1);
}
