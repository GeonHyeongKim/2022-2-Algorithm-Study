#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>
#include <set>

using namespace std;
typedef pair<int, int> pi;

vector<bool> circle(100001, false);
int n, m;
int g = 0;
int c = 0;

void bfs(int node, vector<vector<int>>&graph, vector<bool> &visited) {
	queue<int> q;
	q.push(node);
	visited[node] = true;

	set<int> edges; //방문한 노드들
	edges.insert(node);

	while (!q.empty()) {
		int cur = q.front();
		q.pop();
		for (int i = 0; i < graph[cur].size(); i++) {
			int next = graph[cur][i];
			if (visited[next]) continue;
			q.push(next);
			visited[next] = true;
			edges.insert(next);
		}
	}
	int edges_cnt = 0;
	for (auto e:edges) {
		edges_cnt += graph[e].size();
	}
	c += (edges_cnt / 2) - (edges.size() - 1);

}


int main() {
	cin >> n >> m;
	vector<vector<int>> graph(n);
	for (int i = 0; i < m; i++) {
		int u, v;
		cin >> u >> v;
		graph[u - 1].push_back(v - 1);
		graph[v - 1].push_back(u - 1);
	}

	vector<bool> visited(n, false);
	for (int i = 0; i < n; i++) {
		if (!visited[i]) {
			g++;
			bfs(i, graph, visited);
		}
	}
	cout << g + c - 1;
}