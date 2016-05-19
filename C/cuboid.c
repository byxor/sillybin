/* ================== cuboid.c ==================
 * Author: Brandon Ibbotson
 * Created: 19/05/16
 *
 * Print out an oddly-shaped cuboid!
 * 
 * Command Line Arguments:
 * 1: The width
 * 2: The height
 * 3: The depth
 * ============================================== */

#include <stdlib.h>
#include <stdio.h>

#define HORIZONTAL '_'
#define DIAGONAL '\\'
#define VERTICAL '|'
#define SOLID '*'
#define GAP ' '

typedef struct
{
	short width;
	short height;
	short depth;
} Cuboid;

void drawTopFace(Cuboid *cuboid)
{
	int x, y, z;
	
	printf("%c", GAP);
	for (x = 0; x < cuboid->width + 1; x++)
		printf("%c", HORIZONTAL);
	printf("\n");

	for (z = 0; z < cuboid->depth - 1; z++)
	{
		for (x = 0; x < z + 1; x++)
			printf("%c", GAP);
			
		printf("%c", DIAGONAL);
		
		for (x = 0; x < cuboid-> width; x++)
			printf("%c", GAP);
			
		printf("%c\n", DIAGONAL);
	}
	
	for (x = 0; x < z + 1; x++)
		printf("%c", GAP);
		
	printf("%c", DIAGONAL);
	
	for (x = 0; x < cuboid-> width; x++)
		printf("%c", HORIZONTAL);
		
	printf("%c\n", DIAGONAL);
	
	for (y = 0 ; y < cuboid->height; y++)
		printf("\n");
	
}

void drawSideFace(Cuboid *cuboid)
{
	int x, y, z;
	
	printf("\n");
	
	for (y = 0; y < cuboid->height; y++)
		printf("%c\n", VERTICAL);
	
	for (z = 0; z < cuboid->depth; z++)
	{
		for (x = 0; x < z + 1; x++)
			printf("%c", GAP);
		printf("%c\n", DIAGONAL);
	}
	
}

void drawFrontFace(Cuboid *cuboid)
{
	int x, y, z;

	for (y = 0; y < cuboid->depth + 1; y++)
		printf("\n");
	
	for (y = 0; y < cuboid->height - 1; y++)
	{
		for (x = 0; x < cuboid->depth; x++)
			printf("%c", GAP);
	
		printf("%c", VERTICAL);
		for (x = 0; x < cuboid->width; x++)
			printf("%c", GAP);
		printf("%c\n", VERTICAL);
		
	}
	
	for (x = 0; x < cuboid->depth + 1; x++)
		printf("%c", GAP);
		
	for (x = 0; x < cuboid->width; x++)
		printf("%c", HORIZONTAL);
		
	printf("%c\n", VERTICAL);
}

void gotoStart(Cuboid *cuboid)
{
	int total_lines = cuboid->height + cuboid->depth + 1;
	int i;
	for (i = 0; i < total_lines; i++)
		printf("\033[F");
}

void drawCuboid(Cuboid *cuboid)
{
	drawTopFace(cuboid);
	gotoStart(cuboid);
	drawFrontFace(cuboid);
	gotoStart(cuboid);
	drawSideFace(cuboid);
}	

int main(int argc, char *argv[])
{
	if (argc < 4)
	{
		printf("Usage: cuboid <width> <height> <depth>\n");
		return 1;
	}
	
	short w = atoi(argv[1]);
	short h = atoi(argv[2]);
	short d = atoi(argv[3]);
	
	if (w<2 || h<2 || d<2)
	{
		printf("Cuboid is too small.\n");
		return 0;
	}
	
	// Create a cuboid from provided arguments
	Cuboid *cuboid = malloc(sizeof(Cuboid));
	cuboid->width = w;
	cuboid->height = h;
	cuboid->depth = d;
	
	drawCuboid(cuboid);
	
	free(cuboid);
	return 0;
}
