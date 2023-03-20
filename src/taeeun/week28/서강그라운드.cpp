#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>

using namespace std;
typedef pair<int, int> pi;
const int INF = 1e9;
int dx[4] = { -1, 1, 0, 0 };
int dy[4] = { 0, 0, -1, 1 };
int n, m, r;
int dijkstra(int start, vector<vector<pi>> &graph, vector<int> &items) {
	vector<bool> visited(n, false);
	visited[start] = true;
	vector<int> dist(n, INF);
	dist[start] = 0;
	priority_queue<pi, vector<pi>, greater<>> pq;
	pq.push({ 0, start });
	while (!pq.empty()) {
		int cost = pq.top().first;
		int cur = pq.top().second;
		pq.pop();

		for (int i = 0; i < graph[cur].size(); i++) {
			int next = graph[cur][i].first;
			int next_cost = graph[cur][i].second;
			if (dist[next] > next_cost + cost) {
				dist[next] = next_cost + cost;
				pq.push({ dist[next], next });
			}
		}
	}
	int result = 0;
	for (int i = 0; i < dist.size(); i++) {
		if (dist[i] > m) continue;
		result += items[i];
	}
	return result;
}


int main() {
	cin >> n >> m >> r;
	vector<int> items(n);
	for (int i = 0; i < n; i++) {
		cin >> items[i];
	}
	vector<vector<pi>>graph(n);
	for (int i = 0; i < r; i++) {
		int a, b, l;
		cin >> a >> b >> l;
		graph[a - 1].push_back({ b - 1, l });
		graph[b - 1].push_back({ a - 1, l });
	}
	int answer = 0;
	for (int i = 0; i < n; i++) {
		answer = max(answer, dijkstra(i, graph, items));
	}

	cout << answer;

}