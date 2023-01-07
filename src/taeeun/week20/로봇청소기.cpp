#include <iostream>
#include <vector>
using namespace std;
int N, M;
vector <vector<int>> graph;
vector<vector<bool>> visited;
int dx[4] = { -1, 0, 1, 0 };
int dy[4] = { 0, 1, 0, -1 };
int cnt = 0;
void dfs(int d, int r, int c, int cnt) {
	bool flag = false;
	for (int i = 0; i < 4; i++) {
		int nextD = (d+3-i) % 4;
		int nextX = r + dx[nextD];
		int nextY = c + dy[nextD];
		//탐색할 수 있고
		if (nextX >= 0 && nextX < N && nextY >= 0 && nextY < M) {
			//a, b 아직 청소하지 않은 공간 존재
			if (!visited[nextX][nextY]&&!graph[nextX][nextY]) {
				visited[nextX][nextY] = true;
				dfs(nextD, nextX, nextY, cnt+1);
			}
		}
	}
	//바라보는 방향 유지한 채로 한 칸 후진
	int backD = (d + 2) % 4;
	int backX = r + dx[backD];
	int backY = c + dy[backD];
	if (backX >= 0 && backX < N && backY >= 0 && backY < M) {
		//뒤가 벽일 때
		if (graph[backX][backY]) {
			cout << cnt;
			exit(0);
		}
		else dfs(d, backX, backY, cnt);
	}
}
int main() {
	cin >> N >> M;
	graph.assign(N+1, vector<int>(M+1, 0));
	visited.assign(N+1, vector<bool>(M+1, false));
	int r, c, d;
	//d=0:북 d=1:동 d=2:남 d=3:서
	cin >> r >> c >> d;
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < M; j++) {
			cin >> graph[i][j];
		}
	}
	visited[r][c] = true;
	dfs(d, r, c, 1);
	return 0;
}