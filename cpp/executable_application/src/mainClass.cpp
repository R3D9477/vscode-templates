#include <stdio.h>
#include <mainClass.h>

MainClass::MainClass (int x, int y)
{
	gx = x;
	gy = y;
}

void MainClass::print ()
{
	printf("x:%d, y:%d\n", gx, gy);
}
