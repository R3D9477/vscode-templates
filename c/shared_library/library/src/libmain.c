#include <stdio.h>
#include <extlibfunc.h>

int mainlibfunc (void) {
  
  extlibfunc();

  printf("Press any key to exit...");
  getchar();

  return (0);
}