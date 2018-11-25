/* hello.c - Gameboy Advance Tutorial - Loirak Development */
#define RGB16(r,g,b)  ((r)+(g<<5)+(b<<10)) 

#define SCREEN_WIDTH 240
#define SCREEN_HEIGHT 160

#define BLUE RGB16(0,0,31)
#define WHITE RGB16(31,31,31)

int main() {
    unsigned short* Screen = (unsigned short*) 0x6000000; 
    *(unsigned long*)0x4000000 = 0x403; // mode3, bg2 on 

    char x, y;
    for (x = 0; x < SCREEN_WIDTH; x++) {
        for(y = 0; y < SCREEN_HEIGHT; y++) {
            Screen[x + y*SCREEN_WIDTH] = BLUE;
        }
    }

    for (x = 20; x <= 60; x += 15)
        for(y = 30; y < 50; y++)  
            Screen[x + y*SCREEN_WIDTH] = WHITE; 

    for (x = 20; x < 35; x++)
        Screen[x + 40*SCREEN_WIDTH] = WHITE;

    while(1){}
}
