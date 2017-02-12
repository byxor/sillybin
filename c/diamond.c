#include <stdio.h>
#include <stdlib.h>

#define DIAMOND_CHARACTER '#'
#define INTERNAL_SPACE_CHARACTER ';'


void drawRow(int size, int rowWidth) {
  int i;
  for (i = 0; i < size - rowWidth - 1; i++)
    printf(" ");
  for (i = 0; i < rowWidth + 1; i++) {
    printf("%c", DIAMOND_CHARACTER);
    if (i < rowWidth)
      printf("%c", INTERNAL_SPACE_CHARACTER);
  }
  printf("\n");
}


void printDiamond(int size) {
  int rowWidth;
  for (rowWidth = 0; rowWidth < size; rowWidth++)
    drawRow(size, rowWidth);
  for (rowWidth = size - 2; rowWidth >= 0; rowWidth--)
    drawRow(size, rowWidth);
}


int main(int argc, char *argv[]) {
  if (argc < 2) {
    printf("Not enough arguments. Exiting...\n");
    return 1;
  }
  int size = atoi(argv[1]);
  printDiamond(size);
  return 0;
}

