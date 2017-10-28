#include <stdio.h>
#include <extlibfunc.h>

int mainlibfunc (void) {
  
  printf("Main function called!\n");

  extlibfunc();

  return (0);
}