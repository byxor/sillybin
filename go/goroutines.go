package main

import (
	"fmt"
	"math/rand"
	"strings"
	"time"
)

func main() {
	const routines = 9
	const limit = 15

	responses := make(chan string)

	for id := 1; id <= routines; id++ {
		go startProgressBar(id, responses, limit)
	}

	times(routines*limit, func() {
		fmt.Println(<-responses)
	})

	fmt.Println("All progress bars have finished!")
}

func startProgressBar(id int, responses chan string, limit int) {
	for n := 0; n < limit; n++ {
		time.Sleep(time.Duration(rand.Intn(1000)) * time.Millisecond)
		progressBar := strings.Repeat("#", n) + strings.Repeat("-", limit-n-1)
		responses <- fmt.Sprintf("Progress Bar #%d: %s", id, progressBar)
	}
}

func times(n int, f func()) {
	for i := 0; i < n; i++ {
		f()
	}
}
