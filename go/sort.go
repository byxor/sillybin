package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	fmt.Println(sort(getNumbers()))
}

func getNumbers() []int64 {
	fmt.Print("Enter numbers: ")
	line, _ := bufio.NewReader(os.Stdin).ReadString('\n')
	line = line[:len(line)-1]

	segments := strings.Split(line, " ")

	numbers := make([]int64, len(segments))
	for i, segment := range segments {
		numbers[i], _ = strconv.ParseInt(segment, 10, 32)
	}

	return numbers
}

func sort(numbers []int64) {
	numOfSorted := 0
	length := len(numbers)

	for numOfSorted < length {
		i := 0
		for i < length-numOfSorted-1 {
			if numbers[i] > numbers[i+1] {
				numbers[i], numbers[i+1] = numbers[i+1], numbers[i]
			}
			i++
		}
		numOfSorted++
	}
}
