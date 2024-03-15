import heapq


def dijkstra(graph, start):
    distances = {node: float("inf") for node in graph}
    distances[start] = 0
    priority_queue = [(0, start)]

    while priority_queue:
        current_distance, current_node = heapq.heappop(priority_queue)

        if current_distance > distances[current_node]:
            continue

        for neighbor, weight in graph[current_node].items():
            distance = current_distance + weight
            if distance < distances[neighbor]:
                distances[neighbor] = distance
                heapq.heappush(priority_queue, (distance, neighbor))

    return distances


if __name__ == "__main__":
    graph = {
        "A": {"B": 4, "H": 8},
        "B": {"A": 4, "C": 8, "H": 11},
        "C": {"B": 8, "D": 7, "F": 4},
        "D": {"C": 7, "E": 9, "F": 14},
        "E": {"D": 9, "F": 10},
        "F": {"C": 4, "D": 14, "E": 10, "G": 2},
        "G": {"F": 2, "H": 1, "I": 6},
        "H": {"A": 8, "B": 11, "G": 1, "I": 7},
        "I": {"G": 6, "H": 7},
    }

    start_node = "A"
    shortest_distances = dijkstra(graph, start_node)
    print(f"Shortest distances from node {start_node}: {shortest_distances}")
