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

	for i := 0; i < progressBars*steps; i++ {
		fmt.Println(<-responses)
	}

	fmt.Println("All progress bars have finished!")
}

func startProgressBar(id int, responses chan string, steps int) {
	for n := 0; n < steps; n++ {
		sleepForRandomDuration()
		responses <- progressBarGraphic(id, n, steps)
	}
}

func sleepForRandomDuration() {
	random := rand.Intn(1000)
	duration := time.Duration(random) * time.Millisecond
	time.Sleep(duration)
}

func progressBarGraphic(id int, n int, steps int) string {
	return fmt.Sprintf(
		"Progress Bar #%d: %s%s",
		id,
		strings.Repeat("#", n),
		strings.Repeat("-", steps-n-1))
}
