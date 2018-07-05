package main

import (
	"fmt"
	"strings"
)

func main() {
	adapters := []adapter{angryAdapter{3}, angryAdapter{5}, vapeAdapter{}}
	for _, a := range adapters {
		adapt(a, "Hello")
	}
}

// --- Abstract ---

type adapter interface {
	Adapt(string) string
}

func adapt(a adapter, s string) {
	fmt.Println(a.Adapt(s))
}

// --- Concrete ---

type angryAdapter struct {
	exclamations int
}

func (a angryAdapter) Adapt(s string) string {
	return strings.ToUpper(s) + strings.Repeat("!", a.exclamations)
}

type vapeAdapter struct{}

func (a vapeAdapter) Adapt(s string) string {
	output := ""
	for _, r := range []rune(s) {
		output += string(r) + " "
	}
	return output
}
