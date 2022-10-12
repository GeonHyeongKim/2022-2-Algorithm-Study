#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

int dx[8] = { -1,-1, 0,1,1,1,0,-1 };
int dy[8] = { 0,1, 1, 1,0,-1, -1, -1 };
struct ball {
	int x, y, w, s, d;
};
vector<ball> graph[51][51];


bool isDirSame(int x, int y) {
	bool isEven = false;
	bool isOdd = false;
	for (int i = 0; i < graph[x][y].size(); i++) {
		if (graph[x][y][i].d % 2 != 0) isOdd = true;
		else isEven = true;
	}
	if (isOdd && !isEven) return true;
	if (isEven && !isOdd) return true;
	return false;
}

void initGraph(int n) {
	for (int i = 1; i <= n; i++) {
		for (int j = 1; j <= n; j++) {
			graph[i][j].clear();
		}
	}
}

void moveBall(int n, vector<ball> &fireball) {
	for (int i = 0; i < fireball.size(); i++) {
		int nextX = (fireball[i].x + dx[fireball[i].d] * fireball[i].s) % n;
		int nextY = (fireball[i].y + dy[fireball[i].d] * fireball[i].s) % n;

		if (nextX <= 0) nextX += n;
		if (nextY <= 0) nextY += n;

		fireball[i].x = nextX;
		fireball[i].y = nextY;
	}

	for (int i = 0; i < fireball.size(); i++) {
		int x = fireball[i].x;
		int y = fireball[i].y;
		graph[x][y].push_back(fireball[i]);
	}
}

vector<ball> splitBall(int n) {
	vector<ball> fireball;
	for (int i = 1; i <= n; i++) {
		for (int j = 1; j <= n; j++) {
			if (graph[i][j].size() == 0) continue;
			if (graph[i][j].size() == 1) {
				fireball.push_back(graph[i][j][0]);
				continue;
			}

			int w_sum = 0;
			int s_sum = 0;
			for (int k = 0; k < graph[i][j].size(); k++) {
				w_sum += graph[i][j][k].w;
				s_sum += graph[i][j][k].s;
			}
			int next_w = w_sum / 5;
			int next_s = s_sum / graph[i][j].size();

			if (next_w == 0) continue;

			if (isDirSame(i, j)) {
				for (int d = 0; d <= 6; d += 2) {
					fireball.push_back({ i, j, next_w, next_s, d });
				}
			}
			else {
				for (int d = 1; d <= 7; d += 2) {
					fireball.push_back({ i, j, next_w, next_s, d });
				}
			}
		}
	}
	return fireball;
}


int main() {
	int n, m, k;
	cin >> n >> m >> k;
	vector<ball> fireball;
	for (int i = 0; i < m; i++) {
		int x, y, w, s, d;
		cin >> x >> y >> w >> s >> d;
		fireball.push_back({ x, y, w, s, d });
	}

	while (k--) {
		initGraph(n);

		//1. 이동
		moveBall(n, fireball);

		//2개 이상의 파이어볼이 있는지 확인
		fireball = splitBall(n);

	}
	int cnt = 0;
	for (int i = 0; i < fireball.size(); i++) {
		cnt += fireball[i].w;
	}
	cout << cnt;


}

