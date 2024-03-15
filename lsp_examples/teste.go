package main

import (
	"container/heap"
	"fmt"
)

type Node struct {
	id   int
	cost int
}

type PriorityQueue []*Node

func (pq PriorityQueue) Len() int { return len(pq) }

func (pq PriorityQueue) Less(i, j int) bool {
	return pq[i].cost < pq[j].cost
}

func (pq PriorityQueue) Swap(i, j int) {
	pq[i], pq[j] = pq[j], pq[i]
}

func (pq *PriorityQueue) Push(x interface{}) {
	item := x.(*Node)
	*pq = append(*pq, item)
}

func (pq *PriorityQueue) Pop() interface{} {
	old := *pq
	n := len(old)
	item := old[n-1]
	*pq = old[0 : n-1]
	return item
}

func dijkstra(graph [][]int, start int) []int {
	n := len(graph)
	dist := make([]int, n)
	visited := make([]bool, n)

	for i := range dist {
		dist[i] = 1 << 31 // Set distances to maximum integer value
	}

	dist[start] = 0
	pq := make(PriorityQueue, 0)
	heap.Push(&pq, &Node{id: start, cost: 0})

	for pq.Len() > 0 {
		u := heap.Pop(&pq).(*Node)
		uID := u.id
		visited[uID] = true

		for v := 0; v < n; v++ {
			if graph[uID][v] != 0 && !visited[v] {
				newCost := dist[uID] + graph[uID][v]
				if newCost < dist[v] {
					dist[v] = newCost
					heap.Push(&pq, &Node{id: v, cost: newCost})
				}
			}
		}
	}

	return dist
}

func main() {
	graph := [][]int{
		{0, 4, 0, 0, 0, 0, 0, 8, 0},
		{4, 0, 8, 0, 0, 0, 0, 11, 0},
		{0, 8, 0, 7, 0, 4, 0, 0, 2},
		{0, 0, 7, 0, 9, 14, 0, 0, 0},
		{0, 0, 0, 9, 0, 10, 0, 0, 0},
		{0, 0, 4, 14, 10, 0, 2, 0, 0},
		{0, 0, 0, 0, 0, 2, 0, 1, 6},
		{8, 11, 0, 0, 0, 0, 1, 0, 7},
		{0, 0, 2, 0, 0, 0, 6, 7, 0},
	}

	startNode := 0
	shortestDistances := dijkstra(graph, startNode)

	fmt.Printf("Shortest distances from node %d: %v\n", startNode, shortestDistances)
}
