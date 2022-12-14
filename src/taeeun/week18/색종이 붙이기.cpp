#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
const int INF = 1e9;
vector<vector<int>> v(10, vector<int>(10));
vector<int>paper(5, 5);
int answer = INF;
bool isStickable(int x, int y, int n) {
	for (int i = x; i < x + n; i++) {
		for (int j = y; j < y + n; j++) {
			if (v[i][j] == 0) return false;
		}
	}
	return true;
}
void stick(int x, int y, int n, int attached) {
	for (int i = x; i < x + n; i++) {
		for (int j = y; j < y + n; j++) {
			v[i][j] = attached;
		}
	}
}
void backtracking(int x, int y, int cnt) {
	//종료조건
	//더이상 최소값이 나올 수 없을 때
	if (cnt > answer) return;
	if (x > 9) {
		answer = min(answer, cnt);
		return;
	}
	//옆으로 더 탐색할 수 없을 때
	if (y > 9) {
		backtracking(x + 1, 0, cnt);
		return;
	}

	if (v[x][y] == 0) {
		backtracking(x, y + 1, cnt);
		return;
	}

	if (v[x][y] == 1) {
		for (int i = 1; i <= 5; i++) {
			if (x + i > 10 || y + i > 10 || paper[i - 1] == 0) continue;
			if (isStickable(x, y, i)) {
				stick(x, y, i, 0);
				paper[i - 1]--;
				backtracking(x, y + 1, cnt+1);
				stick(x, y, i, 1);
				paper[i - 1]++;
			}
		}
	}

}
int main() {
	int cnt = 0;
	for (int i = 0; i < 10; i++) {
		for (int j = 0; j < 10; j++) {
			cin >> v[i][j];
		}
	}
	backtracking(0, 0, 0);
	if (answer == INF) cout << -1;
	else cout << answer;
}
