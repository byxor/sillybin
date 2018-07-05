package main

import (
	"fmt"
	"strings"
)

func main() {
	adapters := []adapter{makeAngry(5), makeAngry(10), makeVape}
	for _, a := range adapters {
		adapt(a, "Hello")
	}
}

// --- Abstract ---

type adapter func(s string) string

func adapt(a adapter, s string) {
	fmt.Println(a(s))
}

// --- Concrete ---

func makeAngry(exclamations int) adapter {
	return func(s string) string {
		return strings.ToUpper(s) + strings.Repeat("!", exclamations)
	}
}

func makeVape(s string) (output string) {
	for _, r := range []rune(s) {
		output += string(r) + " "
	}
	return
}
