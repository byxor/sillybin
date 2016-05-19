/* ================== aesthetic.c ==================
 * Author: Brandon Ibbotson
 * Created: 19/05/16
 *
 * A E S T H E T I F Y a string! Simply pass it in
 * as the first command line argument.
 *
 * Currently doesn't support STDIN.
 * Might enforce capitalisation at a later date.
 * ================================================= */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define _STDIN_ 1
#define _ARGV_ 0

char *aesthetify(char *original)
{
	int length = strlen(original);
	char *new_string = malloc(2*length -1 + 1);
	
	*(new_string+0) = *(original+0);
	int i;
	for (i=1; i<length; i++)
	{
		*(new_string+(i-1)*2+1) = ' ';
		*(new_string+(i-1)*2+2) = *(original+i);
	}
	
	return new_string;
}

int main(int argc, char *argv[])
{

	short mode = _ARGV_;
	if (argc < 2)
	{
		mode = _STDIN_;
	}
	
	char *original = (mode == _ARGV_) ? argv[1] : readSTDIN();
	char *aesthetic = aesthetify(original);
	
	printf("%s\n", aesthetic);
	
	if(mode == _STDIN_)
		free(original);
	free(aesthetic);
	return 0;
}
