#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

//NESW
int dx[4] = { -1, 0, 1, 0 };
int dy[4] = { 0, 1, 0, -1 };

int a, b, n, m;

struct robot {
	int idx, x, y, dir;
};

bool isInside(int x, int y) {
	if (x < 0 || x >= b || y < 0 || y >= a) return false;
	return true;
}

int main() {
	cin >> a >> b;
	cin >> n >> m;
	vector<robot> robots;
	vector<vector<robot>> map(b, vector<robot>(a));
	for (int i = 0; i < n; i++) {
		int x, y;
		char dir;
		int new_dir;
		cin >> y >> x >> dir;
		x = b - x;
		y = y - 1;

		if (dir == 'N') new_dir = 0;
		else if (dir == 'E') new_dir = 1;
		else if (dir == 'S') new_dir = 2;
		else new_dir = 3;

		map[x][y] = { i+1, x, y, new_dir };
		robots.push_back({ i+1, x, y, new_dir });
	}
	while (m--) {
		int num, repeat;
		char command;
		cin >> num >> command >> repeat;
		robot r = robots[num - 1];

		if (command == 'L') {
			r.dir = (r.dir + 3*repeat) % 4;
		}
		else if (command == 'R') {
			r.dir = (r.dir + 1*repeat) % 4;
		}
		else {
			while (repeat--) {
				map[r.x][r.y] = {};
				int nextX = r.x + dx[r.dir];
				int nextY = r.y + dy[r.dir];
				if (!isInside(nextX, nextY)) {
					cout << "Robot " << num << " crashes into the wall";
					return 0;
				}
				if (map[nextX][nextY].idx>0) {
					cout << "Robot " << num << " crashes into robot " << map[nextX][nextY].idx;
					return 0;
				}
				r.x += dx[r.dir];
				r.y += dy[r.dir];
				map[r.x][r.y] = { r.idx, r.x, r.y, r.dir };
			}
		}
		robots[num - 1] = r;
	}
	cout << "OK";

}

