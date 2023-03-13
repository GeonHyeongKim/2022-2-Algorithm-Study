#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>

using namespace std;
typedef pair<int, int> pi;
int dx[4] = { -1, 1, 0, 0 };
int dy[4] = { 0, 0, -1, 1 };
int n, m;

int solve(vector<vector<int>> &graph) {
	vector<vector<bool>> visited(n, vector<bool>(m, false));
	int answer = 0;
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			if (graph[i][j] != 2) continue;
			if (visited[i][j]) continue;
			queue<pi> q;
			q.push({ i, j });
			visited[i][j] = true;
			int cnt = 0;
			bool flag = true;

			while (!q.empty()) {
				int x = q.front().first;
				int y = q.front().second;
				q.pop();
				cnt++;

				for (int d = 0; d < 4; d++) {
					int nx = x + dx[d];
					int ny = y + dy[d];
					if (nx < 0 || nx >= n || ny < 0 || ny >= m) continue;
					if (visited[nx][ny]) continue;
					if (graph[nx][ny] == 1) continue;
					if (graph[nx][ny] == 0) {
						flag = false;
						//continue;
					}
					q.push({ nx, ny });
					visited[nx][ny] = true;

				}
			}
			if (flag) {
				answer += cnt;
			}
		}
	}
	return answer;
}



int main() {

	cin >> n >> m;
	vector<vector<int>> graph(n, vector<int>(m, 0));
	vector<pi> empty;

	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			cin >> graph[i][j];
			if (graph[i][j] == 0) {
				empty.push_back({ i, j });
			}
		}
	}
	int answer = 0;

	for (int i = 0; i < empty.size(); i++) {
		for (int j = 0; j < empty.size(); j++) {
			if (i == j) continue;
			int x1 = empty[i].first;
			int y1 = empty[i].second;

			int x2 = empty[j].first;
			int y2 = empty[j].second;

			graph[x1][y1] = 1;
			graph[x2][y2] = 1;

			answer = max(answer, solve(graph));


			graph[x1][y1] = 0;
			graph[x2][y2] = 0;

		}
	}

	cout << answer;
}