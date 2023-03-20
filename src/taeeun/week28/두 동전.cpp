#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>

using namespace std;
typedef pair<int, int> pi;

int dx[4] = { -1, 1, 0, 0 };
int dy[4] = { 0, 0, -1, 1 };
int answer = 1e9;
int n, m;
bool isInRange(int x, int y) {
	if (x < 0 || x >= n || y < 0 || y >= m) {
		return false;
	}
	return true;
}

void move(vector<vector<char>> &graph, vector<pi>& coins, int cnt) {
	if (cnt >= 10) return;
	int x1 = coins[0].first;
	int y1 = coins[0].second;
	int x2 = coins[1].first;
	int y2 = coins[1].second;
	for (int i = 0; i < 4; i++) {
		int nextX1 = x1 + dx[i];
		int nextX2 = x2 + dx[i];
		int nextY1 = y1 + dy[i];
		int nextY2 = y2 + dy[i];
		if (!isInRange(nextX1, nextY1) && !isInRange(nextX2, nextY2)) {
			//두 개 다 떨어지는 경우
			continue;
		}
		if (isInRange(nextX1, nextY1) && !isInRange(nextX2, nextY2)) {
			answer = min(answer, cnt+1);
			return;
		}
		if (!isInRange(nextX1, nextY1) && isInRange(nextX2, nextY2)) {
			answer = min(answer, cnt+1);
			return;
		}
		if (graph[nextX1][nextY1] == '#' && graph[nextX2][nextY2] == '#') {
			continue;
		}
		if (graph[nextX1][nextY1] == '#') {
			nextX1 = x1;
			nextY1 = y1;
		}
		if (graph[nextX2][nextY2] == '#') {
			nextX2= x2;
			nextY2 = y2;
		}
		coins[0] = { nextX1, nextY1 };
		coins[1] = { nextX2, nextY2 };
		move(graph, coins, cnt + 1);
	}


}


int main() {
	cin >> n >> m;
	vector<vector<char>> graph(n, vector<char>(m));
	vector<pi> coins;
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			cin >> graph[i][j];
			if (graph[i][j] == 'o') {
				coins.push_back({ i, j });
			}
		}
	}
	move(graph, coins, 0);
	if (answer == 1e9) cout << -1;
	else cout << answer;

}