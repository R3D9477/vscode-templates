#include<stdio.h>
#include<mainClass.h>

int main (void)
{
	MainClass mc;
	mc.setX(123);
	mc.printX();

	printf("\nPress any key to exit...");
	getchar();

	return 0;
}