#!/bin/bash

./build.sh
echo
echo

echo "Running program linked with good library..."
LD_LIBRARY_PATH=$(pwd)/sum_good ./main.exe
echo
echo

echo "Running program linked with bad library..."
LD_LIBRARY_PATH=$(pwd)/sum_bad ./main.exe
echo
echo
