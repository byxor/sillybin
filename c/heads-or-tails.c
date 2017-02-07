#include <time.h>
#include <stdio.h>
#include <stdlib.h>

int main(void) {

  srand((unsigned int) time(NULL));
  int random = rand() % 2;

  if (random == 0)
    printf("Heads\n");
  else
    printf("Tails\n");
  
  return 0;
}

