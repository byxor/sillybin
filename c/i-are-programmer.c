#include <stdio.h>
#include <unistd.h>
#include <time.h>

#define TYPING_INTERVAL 50 * 1000
#define PAUSE_INTERVAL 1000 * 1000
#define NUMBER_OF_SOUNDS 15

void printSlowly(char* message) {
  int i = 0;
  while (1) {
    usleep(TYPING_INTERVAL);
    char nextCharacter = message[i++];
    if (nextCharacter == '\0') break;
    printf("%c", nextCharacter);
    fflush(stdout);
  }
}

void println(char* message) {
  printSlowly(message);
  printf("\n");
  fflush(stdout);
  usleep(PAUSE_INTERVAL);
}

void startBeepBooping() {
  srand((unsigned int) time(NULL));
  for (int i = 0; i < NUMBER_OF_SOUNDS; i++) {
    int random = rand() % 2;
    if (random == 0)
      println("Beep...");
    else
      println("Boop...");
  }
}

int main(void) {
  println("I are programmer...");
  println("I make computer go...");
  startBeepBooping();
  return 0;
}
