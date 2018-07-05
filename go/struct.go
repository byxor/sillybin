package main

import "fmt"

type point struct {
	x, y int
}

func (p point) ToString() string {
	return fmt.Sprintf("<point: x=%d y=%d>", p.x, p.y)
}

func main() {
	points := []point{
		{10, 20},
		{-1, -2},
		{100, 200},
	}
	for _, p := range points {
		fmt.Println(p.ToString())
	}
}
