package main

import (
	"fmt"
	"strings"
)

func main() {
	adapters := []adapter{makeAngry, makeExcited, makeVape}
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

func makeAngry(s string) string {
	return strings.ToUpper(s) + "11!"
}

func makeExcited(s string) string {
	return s + "!"
}

func makeVape(s string) string {
	output := ""
	for _, r := range []rune(s) {
		output += string(r) + " "
	}
	return output
}
