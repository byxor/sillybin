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

	messages := make(chan string)
	done := make(chan bool)

	for id := 1; id <= progressBars; id++ {
		go startProgressBar(done, messages, id, steps)
	}

	go func() {
		for message := range messages {
			fmt.Println(message)
		}
	}()

	for i := 0; i < routines; i++ {
		<-done
	}

	fmt.Println("All progress bars have finished!")
}

func startProgressBar(done chan bool, messages chan string, id int, steps int) {
	for n := 0; n < steps; n++ {
		sleepForRandomDuration()
		messages <- progressBarGraphic(id, n, steps)
	}
	done <- true
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
