#include <stdio.h>
#include <mainClass.h>

MainClass::MainClass ()
{
	gx = 0;
}

void MainClass::setX (int x)
{
	gx = x;
}

void MainClass::printX ()
{
	printf("x:%d\n", gx);
}