#include <stdio.h>
#include <mainClass.h>

int main (void) {
  
  MainClass *mc = new MainClass(123, 321);
  mc->print();
  
  printf("\nPress any key to exit...");
  getchar();

  return (0);
}
