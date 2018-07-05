package main

import (
	"fmt"
	"math/rand"
	"strings"
	"sync"
	"time"
)

func main() {
	const progressBars = 9
	const steps = 15

	var wg sync.WaitGroup
	wg.Add(progressBars)

	messages := make(chan string)

	for id := 1; id <= progressBars; id++ {
		go startProgressBar(&wg, messages, id, steps)
	}

	go func() {
		for message := range messages {
			fmt.Println(message)
		}
	}()

	wg.Wait()

	fmt.Println("All progress bars have finished!")
}

func startProgressBar(wg *sync.WaitGroup, messages chan string, id int, steps int) {
	defer wg.Done()
	for n := 0; n < steps; n++ {
		sleepForRandomDuration()
		messages <- progressBarGraphic(id, n, steps)
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
