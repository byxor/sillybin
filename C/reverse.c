#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *reverse(char *original)
{
	char *reversed = malloc(strlen(original) + 1);
	
	int i;
	for(i=0; i<strlen(original); i++)
		*(reversed+i) = *(original+ strlen(original) - 1 - i);
	
	return reversed;
}

int main(int argc, char *argv[])
{
	if (argc < 2)
	{
		printf("Not enough args. Expecting a string.");
		return 1;
	}
	
	char *original = argv[1];
	char *reversed = reverse(original);
	printf("%s\n", reversed);
	
	free(reversed);
	return 0;
}

