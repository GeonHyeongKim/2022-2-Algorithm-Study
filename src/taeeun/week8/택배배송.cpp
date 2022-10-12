#include <iostream>
#include <algorithm>
#include <vector>
#include <queue>

using namespace std;
typedef pair<int, int> pi;
const int INF = 1e9;
int n, m;

void dijkstra(vector<vector<pi>> &graph, vector<int> &dist) {
	priority_queue<pi, vector<pi>, greater<>> pq;
	pq.push({ 0, 1 });
	dist[1] = 0;
	
	while (!pq.empty()) {
		int cost = pq.top().first;
		int cur = pq.top().second;
		pq.pop();
		for (int i = 0; i < graph[cur].size(); i++) {
			int next_cost = graph[cur][i].first;
			int next = graph[cur][i].second;

			if (cost + next_cost < dist[next]) {
				dist[next] = cost + next_cost;
				pq.push({ dist[next], next });
			}
		}
	}

}

int main() {
	cin >> n >> m;

	vector<vector<pi>> graph(n+1);
	vector<int> dist(n + 1, INF);

	for (int i = 0; i < m; i++) {
		int a, b, c;
		cin >> a >> b >> c;
		graph[a].push_back({ c, b });
		graph[b].push_back({ c, a });
	}

	dijkstra(graph, dist);
	cout << dist[n];
}

