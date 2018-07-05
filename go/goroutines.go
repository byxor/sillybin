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

	var wg sync.WaitGroup
	wg.Add(progressBars)

	messages := make(chan string)

	for id := 1; id <= progressBars; id++ {
		go startProgressBar(&wg, messages, id)
	}

	go func() {
		for message := range messages {
			fmt.Println(message)
		}
	}()

	wg.Wait()

	fmt.Println("All progress bars have finished!")
}

func startProgressBar(wg *sync.WaitGroup, messages chan string, id int) {
	defer wg.Done()

	const steps = 20
	for progress := 0; progress < steps; progress++ {
		sleepForRandomDuration()
		messages <- progressBarGraphic(id, progress, steps)
	}
}

func sleepForRandomDuration() {
	random := rand.Intn(1000)
	duration := time.Duration(random) * time.Millisecond
	time.Sleep(duration)
}

func progressBarGraphic(id int, progress int, steps int) string {
	message := fmt.Sprintf(
		"Progress Bar #%d: %s%s",
		id,
		strings.Repeat("#", progress),
		strings.Repeat("-", steps-progress-1))
	if progress == steps-1 {
		message += " done!"
	}
	return message
}
