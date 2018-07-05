package main

import (
	"fmt"
	"math/rand"
	"strings"
	"time"
)

func main() {
	const progressBars = 9
	const steps = 15

	responses := make(chan string)

	for id := 1; id <= progressBars; id++ {
		go startProgressBar(id, responses, steps)
	}

	times(progressBars*steps, func() {
		fmt.Println(<-responses)
	})

	fmt.Println("All progress bars have finished!")
}

func startProgressBar(id int, responses chan string, steps int) {
	for n := 0; n < steps; n++ {
		time.Sleep(time.Duration(rand.Intn(1000)) * time.Millisecond)
		progressBar := strings.Repeat("#", n) + strings.Repeat("-", steps-n-1)
		responses <- fmt.Sprintf("Progress Bar #%d: %s", id, progressBar)
	}
}

func times(n int, f func()) {
	for i := 0; i < n; i++ {
		f()
	}
}
