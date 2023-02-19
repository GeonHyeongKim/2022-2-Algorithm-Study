#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>

using namespace std;
typedef pair<int, int> pi;
int dx[4] = { -1, 1, 0, 0 };
int dy[4] = { 0, 0, -1, 1 };
const int INF = 1e9;

int n, m;
struct point {
	int x, y, garbage, garbage_next;
};

struct cmp{
	bool operator()(const point &a, const point &b) {
		if (a.garbage == b.garbage) return a.garbage_next > b.garbage_next;
		return a.garbage > b.garbage;
	}
};

pair<int, int> dijkstra(vector<vector<char>> &graph,pi start,pi end) {
	priority_queue<point, vector<point>, cmp> pq;
	vector<vector<int>> dist(n, vector<int>(m, INF));

	dist[start.first][start.second] = 0;
	pq.push({ start.first, start.second, 0, 0 });
	int garbage = 0;
	int garbage_next = 0;

	while (!pq.empty()) {
		point p = pq.top();
		pq.pop();
		int x = p.x;
		int y = p.y;
		int g = p.garbage;
		int g_n = p.garbage_next;

		for (int i = 0; i < 4; i++) {
			int nextX = x + dx[i];
			int nextY = y + dy[i];
			if (nextX < 0 || nextX >= n || nextY < 0 || nextY >= m) continue;
			if (nextX == end.first && nextY == end.second) {
				garbage= g;
				garbage_next = g_n;
				return { garbage, garbage_next };
			}

			if (dist[nextX][nextY] != INF) continue;
			if (graph[nextX][nextY] == 'g') {
				pq.push({ nextX, nextY, g + 1, g_n });
			}
			if (graph[nextX][nextY] == 'N') {
				pq.push({ nextX, nextY, g, g_n+1 });
			}
			if (graph[nextX][nextY] == '.') {
				pq.push({ nextX, nextY, g, g_n });
			}

			dist[nextX][nextY] = dist[x][y] + 1;
		}
	}
	return { garbage,garbage_next};
}


int main() {
	cin >> n >> m;
	vector<vector<char>> graph(n, vector<char>(m));

	pi start, end;
	for (int i = 0; i < n; i++)	{
		for (int j = 0; j < m; j++) {
			cin >> graph[i][j];
			if (graph[i][j] == 'S')  start = { i, j };
			if (graph[i][j] == 'F')  end = { i, j };
		}
	}

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			if (graph[i][j] != 'g') continue;
			for (int d = 0; d < 4; d++) {
				int nx = i + dx[d];
				int ny = j + dy[d];
				if (nx < 0 || nx >= n || ny < 0 || ny >= m) continue;
				if (graph[nx][ny] == 'S' || graph[nx][ny] == 'F' || graph[nx][ny]=='g') continue;
				graph[nx][ny] = 'N';
			}
		}
	}

	pi garbage = dijkstra(graph, start, end);
	cout << garbage.first << " " << garbage.second;

}