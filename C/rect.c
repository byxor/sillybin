/* ================== rect.c ==================
 * Author: Brandon Ibbotson
 * Created: 19/05/16
 *
 * Print out an oddly-shaped rectangle!
 * 
 * Command Line Arguments:
 * 1: The width
 * 2: The height
 * ============================================ */

#include <stdlib.h>
#include <stdio.h>

typedef struct
{
	short width;
	short height;
} Rectangle;

void drawRect(Rectangle *rect)
{
	// Variables for looping.
	int x, y;
	
	// Draw the top line
	printf(" ");
	for (x=0; x < rect->width; x++)
		printf("-");
	printf(" \n");
	
	// Draw the vertical sides
	for (y=0; y < rect->height; y++)
	{
		printf("|");
		for (x=0; x < rect->width; x++)
			printf(" ");
		printf("|\n");
	}
	
	// Draw the bottom line
	printf(" ");
	for (x=0; x < rect->width; x++)
		printf("-");
	printf(" \n");
}

int main(int argc, char *argv[])
{
	if (argc < 3)
	{
		printf("Not enough args. Expecting width and height.\n");
		return 1;
	}
	
	// Create a rectangle from provided arguments
	Rectangle *rect = malloc(sizeof(Rectangle));
	rect->width = atoi(argv[1]);
	rect->height = atoi(argv[2]);
	
	drawRect(rect);
	
	free(rect);
	return 0;
}
