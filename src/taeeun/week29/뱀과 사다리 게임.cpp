#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>

using namespace std;
typedef pair<int, int> pi;

void bfs(int start, vector<int> &board) {
	vector<bool> visited(101, false);
	queue<pi> q;

	q.push({ start, 0 });
	visited[start] = true;

	while (!q.empty()) {
		int cur = q.front().first;
		int cnt = q.front().second;
		q.pop();
		for (int i = 1; i <= 6; i++) {
			int next = cur + i;
			if (next == 100) {
				cout << cnt + 1;
				return;
			}
			if (next > 100) continue;
			if (board[next]) next = board[next];
			if (visited[next]) continue;
			visited[next] = true;
			q.push({ next, cnt + 1 });
		}
	}
}

int main() {
	ios::sync_with_stdio(false);
	cin.tie(0);
	int n, m;
	cin >> n >> m;
	vector<int> board(101);
	for (int i = 0; i < n+m; i++) {
		int a, b;
		cin >> a >> b;
		board[a] = b;
	}
	bfs(1, board);
}