import java.util.Arrays;

public class DijkstraAlgorithm {
	private static final int INF = Integer.MAX_VALUE;

	public static void main(String[] args) {
		int[][] graph = {
				{ 0, 4, 0, 0, 0, 0, 0, 8, 0 },
				{ 4, 0, 8, 0, 0, 0, 0, 11, 0 },
				{ 0, 8, 0, 7, 0, 4, 0, 0, 2 },
				{ 0, 0, 7, 0, 9, 14, 0, 0, 0 },
				{ 0, 0, 0, 9, 0, 10, 0, 0, 0 },
				{ 0, 0, 4, 14, 10, 0, 2, 0, 0 },
				{ 0, 0, 0, 0, 0, 2, 0, 1, 6 },
				{ 8, 11, 0, 0, 0, 0, 1, 0, 7 },
				{ 0, 0, 2, 0, 0, 0, 6, 7, 0 }
		};

		dijkstra(graph, 0);
	}

	private static void dijkstra(int[][] graph, int source) {
		int vertices = graph.length;
		int[] dist = new int[vertices];
		boolean[] visited = new boolean[vertices];

		Arrays.fill(dist, INF);
		dist[source] = 0;

		for (int i = 0; i < vertices - 1; i++) {
			int minDist = minDistance(dist, visited);
			visited[minDist] = true;

			for (int j = 0; j < vertices; j++) {
				if (!visited[j] && graph[minDist][j] != 0 && dist[minDist] != INF &&
						dist[minDist] + graph[minDist][j] < dist[j]) {
					dist[j] = dist[minDist] + graph[minDist][j];
				}
			}
		}

		printSolution(dist);
	}

	private static int minDistance(int[] dist, boolean[] visited) {
		int min = INF;
		int minIndex = -1;
		for (int v = 0; v < dist.length; v++) {
			if (!visited[v] && dist[v] <= min) {
				min = dist[v];
				minIndex = v;
			}
		}
		return minIndex;
	}

	private static void printSolution(int[] dist) {
		System.out.println("Vertex \t\t Distance from Source");
		for (int i = 0; i < dist.length; i++) {
			System.out.println(i + " \t\t " + dist[i]);
		}
	}
}
