#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>
#include <set>

int dx[4] = { -1, 1, 0, 0 };
int dy[4] = { 0, 0, -1, 1 };
using namespace std;


int bfs(string str, string result) {
	queue<pair<string, int>> q;
	set<string> visited;

	q.push({ str, 0 });
	visited.insert(str);

	while (!q.empty()) {
		string cur = q.front().first;
		int cnt = q.front().second;
		q.pop();

		if (result.compare(cur)==0) return cnt;

		int pos = cur.find("0");
		int curX = pos / 3;
		int curY = pos % 3;

		for (int i = 0; i < 4; i++) {
			int nextX = curX + dx[i];
			int nextY = curY + dy[i];
			if (nextX < 0 || nextX >= 3 || nextY < 0 || nextY >= 3) continue;

			string temp = cur;

			swap(temp[curX*3+curY], temp[nextX * 3 + nextY]);
			if (visited.find(temp) != visited.end()) continue;
			visited.insert(temp);
			q.push({ temp, cnt + 1 });
			
		}
	}

	return -1;
}

int main() {
	string str;
	string result = "123456780";
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			char ch;
			cin >> ch;
			str += ch;
		}
	}

	cout << bfs(str, result);
}
