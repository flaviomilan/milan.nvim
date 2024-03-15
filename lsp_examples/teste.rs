use std::cmp::Ordering;
use std::collections::BinaryHeap;
use std::usize;

const V: usize = 9;

#[derive(Copy, Clone, Eq, PartialEq)]
struct State {
    cost: u32,
    node: usize,
}

impl Ord for State {
    fn cmp(&self, other: &State) -> Ordering {
        other.cost.cmp(&self.cost)
    }
}

impl PartialOrd for State {
    fn partial_cmp(&self, other: &State) -> Option<Ordering> {
        Some(self.cmp(other))
    }
}

fn dijkstra(graph: &[Vec<u32>], start: usize) -> Vec<u32> {
    let mut dist = vec![usize::MAX; V];
    let mut visited = vec![false; V];
    let mut heap = BinaryHeap::new();

    dist[start] = 0;
    heap.push(State {
        cost: 0,
        node: start,
    });

    while let Some(State { cost, node }) = heap.pop() {
        if visited[node] {
            continue;
        }

        visited[node] = true;

        for (next, &weight) in graph[node].iter().enumerate() {
            if weight > 0 {
                let next_cost = cost + weight;
                if next_cost < dist[next] {
                    dist[next] = next_cost;
                    heap.push(State {
                        cost: next_cost,
                        node: next,
                    });
                }
            }
        }
    }

    dist
}

fn main() {
    let graph = vec![
        vec![0, 4, 0, 0, 0, 0, 0, 8, 0],
        vec![4, 0, 8, 0, 0, 0, 0, 11, 0],
        vec![0, 8, 0, 7, 0, 4, 0, 0, 2],
        vec![0, 0, 7, 0, 9, 14, 0, 0, 0],
        vec![0, 0, 0, 9, 0, 10, 0, 0, 0],
        vec![0, 0, 4, 14, 10, 0, 2, 0, 0],
        vec![0, 0, 0, 0, 0, 2, 0, 1, 6],
        vec![8, 11, 0, 0, 0, 0, 1, 0, 7],
        vec![0, 0, 2, 0, 0, 0, 6, 7, 0],
    ];

    let start_node = 0;
    let shortest_distances = dijkstra(&graph, start_node);

    println!(
        "Shortest distances from node {}: {:?}",
        start_node, shortest_distances
    );
}
