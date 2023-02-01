#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>
#include <string>

using namespace std;
typedef pair<int, int> pi;
const int MAX = 100000;

int clickB(int cur) {
	cur *= 2;
	if (cur >= MAX) {
		return MAX;
	}
	string next = to_string(cur);
	for (int i = 0; i < next.length(); i++) {
		if (next[i] == '0') continue;
		int num = next[i] - '0';
		num -= 1;
		next[i] = num + '0';
		break;
	}
	return stoi(next);
}

int main() {
	int n, t, g;
	cin >> n >> t >> g;
	vector<int> visited(MAX, false);
	queue<pi> q;

	visited[n] = true;
	q.push({ n, 0 });

	while (!q.empty()) {
		int cur = q.front().first;
		int cnt = q.front().second;
		q.pop();

		if (cur == g) {
			cout << cnt;
			return 0;
		}
		if (cnt >= t) continue;

		//A버튼
		int nextA = cur + 1;
		if (nextA < MAX && !visited[nextA]) {
			q.push({ nextA, cnt + 1 });
			visited[nextA] = true;
		}

		//B버튼
		if (cur == 0) continue;
		int nextB = clickB(cur);
		if (nextB >= MAX || visited[nextB]) continue;
		q.push({ nextB, cnt + 1 });
		visited[nextB] = true;

	}
	cout << "ANG";
}