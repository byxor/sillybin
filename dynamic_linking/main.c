#include <stdio.h>
#include "sum.h"

#define indentt(text) { for (int i = 0; i < indentation; i++) { printf("  "); } }
#define cout(...) { indentt(); printf(__VA_ARGS__); }
#define enterr(name) { sprintf(thonText, enterrFormat, name); cout(thonText); indentation++;}
#define exitt(name) { sprintf(thonText, exittFormat, name); indentation--; cout(thonText); }

const char *enterrFormat = "<%s>\n";
const char *exittFormat = "</%s>\n";
char thonText[1024];
int indentation = 0;

// ^ Just for fun...


int main() {
  enterr(__FUNCTION__);

  int a, b;
  cout("Enter 2 integers (space separated): ");
  scanf("%d %d", &a, &b);

  int answer = sum(a, b);
  cout("Their sum is: %d\n", answer);

  exitt(__FUNCTION__);
  return 0;
}
