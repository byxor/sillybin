#!/bin/bash

echo "Compiling library code..."
gcc -c -Wall -Werror -fPIC -o sum_good/sum.o sum_good/sum.c
gcc -c -Wall -Werror -fPIC -o sum_bad/sum.o sum_bad/sum.c

echo "Building shared libraries..."
gcc -shared -o sum_good/libsum.so sum_good/sum.o
gcc -shared -o sum_bad/libsum.so sum_bad/sum.o

echo "Building main program..."
gcc -L ./sum_bad -L ./sum_good -Wall -Wno-format-security -o main.exe main.c -lsum

echo "done."
