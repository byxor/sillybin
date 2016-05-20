/* ================== dickgen.c ==================
 * Author: Brandon Ibbotson
 * Created: 18/05/16
 *
 * Generate a bunch of dicks.
 * 
 * Arguments:
 * -n <the number you want to generate>
 * -l <the length of each one>
 * =============================================== */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void dickgen(int n, int l)
{
	int i;
	printf("\e[31m");
	for(i = 0; i<n; i++)
	{
		printf("8");
		int j;
		for(j = 0; j<l; j++)
			printf("=");
		printf("D\n");
	}
}

int main(int argc, char *argv[])
{
	if (argc <= 1)
	{
		printf("Arguments...\n");
		printf(" -l <dick_length>\n");
		printf(" -n <num_dicks>\n");
		return 1;
	}
	
	int n = 1;
	int l = 3;
	
	int i;
	for(i = 1; i < argc; i++)
	{
		char *tag = argv[i];
		if(strcmp(tag, "-n") == 0)
			n = atoi(argv[++i]);
		else if(strcmp(tag, "-l") == 0)
			l = atoi(argv[++i]);
		else
		{
			printf("Unrecognised arguments...");
			return 1;
		}
	}
	
	if(l<0 || n<0)
	{
		printf("Arguments too small.");
		return 1;
	}
	
	dickgen(n, l);
	return 0;
}

