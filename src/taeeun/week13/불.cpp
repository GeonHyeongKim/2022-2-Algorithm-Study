#include <iostream>
#include <algorithm>
#include <vector>
#include <queue>

using namespace std;
typedef pair<int, int> pi;
int dx[4] = { -1, 1, 0, 0 };
int dy[4] = { 0, 0, -1, 1 };

void bfs(vector<vector<int>> &graph, int x, int y, int w, int h) {
	vector<vector<int>> time(h, vector<int>(w, 0));
	queue<pi> q;
	q.push({ x, y });
	time[x][y] = 1;

	while (!q.empty()) {
		int curX = q.front().first;
		int curY = q.front().second;
		q.pop();

		for (int i = 0; i < 4; i++) {
			int nextX = curX + dx[i];
			int nextY = curY + dy[i];
			if (nextX < 0 || nextX >= h || nextY < 0 || nextY >= w) {
				cout << time[curX][curY] << "\n";
				return;
			}

			if (time[nextX][nextY] > 0) continue; //이미 방문 
			if (graph[nextX][nextY] == -1) continue; //벽
			if (graph[nextX][nextY] > 0 && graph[nextX][nextY] <= time[curX][curY] + 1) continue; //불보다 빨리 방문 못하는 경우
			
			time[nextX][nextY] = time[curX][curY] + 1;
			q.push({ nextX, nextY });
		}
		
	}
	cout << "IMPOSSIBLE" << "\n";
	return;
}

int main() {
	int t, w, h;
	cin >> t;
	while (t--) {
		cin >> w >> h;
		int x=0, y=0;
		vector<vector<char>> map(h, vector<char>(w));
		vector<vector<int>> graph(h, vector<int>(w, 0));
		queue<pi> fire;
		for (int i = 0; i < h; i++) {
			for (int j = 0; j < w; j++) {
				cin >> map[i][j];
				if (map[i][j] == '@') {
					x = i;
					y = j;
					graph[i][j] = 0;
				}
				else if (map[i][j] == '*') {
					fire.push({ i, j });
					graph[i][j] = 1;
				}
				else if (map[i][j] == '.') graph[i][j] = 0;
				else graph[i][j] = -1;
			}
		}
		while (!fire.empty()) {
			int curX = fire.front().first;
			int curY = fire.front().second;
			fire.pop();
			for (int i = 0; i < 4; i++) {
				int nextX = curX + dx[i];
				int nextY = curY + dy[i];
				if (nextX < 0 || nextX >= h || nextY < 0 || nextY >= w) continue;
				if (graph[nextX][nextY] == 0) {
					graph[nextX][nextY] = graph[curX][curY] + 1;
					fire.push({ nextX, nextY });
				}
			}
		}
		bfs(graph, x, y, w, h);
	}
}

