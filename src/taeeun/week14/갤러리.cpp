#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;
int dx[4] = { 1, -1, 0, 0 };
int dy[4] = { 0, 0, -1, 1 };
int m, n;
int cnt = 0;

void hasPicture(int x, int y, vector<vector<int>> &map, vector<vector<vector<bool>>> &visited) {
	for (int i = 0; i < 4; i++) {
		int nextX = x + dx[i];
		int nextY = y + dy[i];

		if (!map[nextX][nextY]) continue;

		if (i <= 1) {
			//위아래로 그림을 배치할 수 있을 때
			for (int j = 2; j < 4; j++) {
				int sideX = x + dx[j];
				int sideY = y + dy[j];
				int nextSideX = nextX + dx[j];
				int nextSideY = nextY + dy[j];
				if (map[sideX][sideY] || map[nextSideX][nextSideY]) continue; //옆이 벽인지 확인
				if (visited[sideX][sideY][5-j] || visited[nextSideX][nextSideY][5-j]) continue; //이미 그림이 걸려있는지 확인
				cnt++;
				visited[sideX][sideY][5-j] = true;
				visited[nextSideX][nextSideY][5-j] = true;
			}
		}
		else {
			for (int j = 0; j < 2; j++) {
				int sideX = x + dx[j];
				int sideY = y + dy[j];
				int nextSideX = nextX + dx[j];
				int nextSideY = nextY + dy[j];
				if (map[sideX][sideY] || map[nextSideX][nextSideY]) continue;
				if (visited[sideX][sideY][1-j] || visited[nextSideX][nextSideY][1-j]) continue;
				cnt++;
				visited[sideX][sideY][1-j] = true;
				visited[nextSideX][nextSideY][1-j] = true;
			}
		}
	}

}

int main() {
	cin >> m >> n;
	vector<vector<int>> map(m, vector<int>(n, 0));
	vector<vector<vector<bool>>> visited(m, vector<vector<bool>>(n, vector<bool>(4, false)));
	for (int i = 0; i < m; i++) {
		for (int j = 0; j < n; j++) {
			char c;
			cin >> c;
			if (c == '.') map[i][j] = 1;
		}
	}

	if (m == 1 || n == 1) {
		cout << 0;
		return 0;
	}
	
	//가장자리는 무조건 벽이므로 검사 x
	for (int i = 1; i < m-1; i++) {
		for (int j = 1; j <n-1; j++) {
			if (!map[i][j]) continue;
			hasPicture(i, j, map, visited);
		}
	}
	cout << cnt;
}

