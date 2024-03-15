class PriorityQueue {
  constructor() {
    this.queue = [];
  }

  enqueue(element, priority) {
    this.queue.push({ element, priority });
    this.queue.sort((a, b) => a.priority - b.priority);
  }

  dequeue() {
    if (this.isEmpty()) return null;
    return this.queue.shift().element;
  }

  isEmpty() {
    return this.queue.length === 0;
  }
}

class Graph {
  constructor() {
    this.vertices = {};
  }

  addVertex(vertex) {
    if (!this.vertices[vertex]) {
      this.vertices[vertex] = {};
    }
  }

  addEdge(vertex1, vertex2, weight) {
    this.vertices[vertex1][vertex2] = weight;
    this.vertices[vertex2][vertex1] = weight; // if undirected graph
  }

  dijkstra(startVertex) {
    const distances = {};
    const previous = {};
    const priorityQueue = new PriorityQueue();

    // Initialize distances and priority queue
    for (let vertex in this.vertices) {
      if (vertex === startVertex) {
        distances[vertex] = 0;
        priorityQueue.enqueue(vertex, 0);
      } else {
        distances[vertex] = Infinity;
        priorityQueue.enqueue(vertex, Infinity);
      }
      previous[vertex] = null;
    }

    while (!priorityQueue.isEmpty()) {
      const currentVertex = priorityQueue.dequeue();

      for (let neighbor in this.vertices[currentVertex]) {
        const distance =
          distances[currentVertex] + this.vertices[currentVertex][neighbor];
        if (distance < distances[neighbor]) {
          distances[neighbor] = distance;
          previous[neighbor] = currentVertex;
          priorityQueue.enqueue(neighbor, distance);
        }
      }
    }

    return { distances, previous };
  }

  shortestPath(startVertex, endVertex) {
    const { distances, previous } = this.dijkstra(startVertex);
    const path = [];
    let currentVertex = endVertex;

    while (currentVertex !== null) {
      path.unshift(currentVertex);
      currentVertex = previous[currentVertex];
    }

    return path;
  }
}

// Example usage:
const graph = new Graph();
graph.addVertex("A");
graph.addVertex("B");
graph.addVertex("C");
graph.addVertex("D");
graph.addVertex("E");

graph.addEdge("A", "B", 4);
graph.addEdge("A", "C", 2);
graph.addEdge("B", "C", 5);
graph.addEdge("B", "D", 10);
graph.addEdge("C", "D", 3);
graph.addEdge("D", "E", 7);

console.log(graph.shortestPath("A", "E"));
