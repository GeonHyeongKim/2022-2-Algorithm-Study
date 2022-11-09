#include <iostream>
#include <vector>
#include <queue>
using namespace std;	
int N, M;
vector<vector<bool>> visited;
vector<vector<int>>shark;
int dx[8] = { 0,0,-1,1,-1,1,-1,1 };
int dy[8] = { -1,1,0,0-1,1,1,-1 };
int bfs(int i, int j) {
	queue<pair<pair<int, int>, int>> q;
	visited[i][j] = true;
	q.push(make_pair(make_pair(i,j), 0));
	while (!q.empty()) {
		int curX = q.front().first.first;
		int curY = q.front().first.second;
		int cnt = q.front().second;
		q.pop();
		if (shark[curX][curY] == 1) 
			return cnt;
		for (int i = 0; i < 8; i++) {
			int nextX = curX + dx[i];
			int nextY = curY + dy[i];
			if (nextX >= 0 && nextX < N && nextY>=0 && nextY < M) {
				if (!visited[nextX][nextY]) {
					visited[nextX][nextY] = true;
					q.push(make_pair(make_pair(nextX, nextY), cnt + 1));
				}
			}
		}
	}
}
int main() {

	cin >> N >> M;
	shark.assign(N + 1, vector<int>(M + 1));
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < M; j++) {
			cin >> shark[i][j];
		}
	}
	int answer = 0;
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < M; j++) {
			visited.assign(N + 1, vector<bool>(M + 1, false));
			answer = max(answer, bfs(i, j));
		}
	}
	cout << answer;
}
