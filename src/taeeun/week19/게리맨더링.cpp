#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>

using namespace std;
const int INF = 1000;
vector<vector<int>> graph;
vector<int> people;
int n;
int answer = INF;
bool isConnected(vector<int> &town) {
	queue<int> q;
	vector<bool> visited(n, false);
	q.push(town[0]);
	visited[town[0]] = true;

	while (!q.empty()) {
		int cur = q.front();
		q.pop();
		for (int i = 0; i < graph[cur].size(); i++) {
			int next = graph[cur][i];

			//이어져있지 않음
			if (find(town.begin(), town.end(), next) == town.end()) {
				continue;
			}

			if (visited[next]) {
				continue;
			}
			visited[next] = true;
			q.push(next);
		}
	}

	for (int i = 0; i < town.size(); i++) {
		if (!visited[town[i]]) return false;
	}
	return true;
}

void calc(vector<bool> &temp) {
	vector<int> red;
	vector<int> blue;
	for (int i = 0; i < n; i++) {
		if (temp[i]) red.push_back(i);
		else blue.push_back(i);
	}
	if (!isConnected(red) || !isConnected(blue)) return;

	int redCnt = 0;
	int blueCnt = 0;
	for (int i = 0; i < red.size(); i++) {
		redCnt += people[red[i]];
	}
	for (int i = 0; i < blue.size(); i++) {
		blueCnt += people[blue[i]];
	}
	int diff = abs(redCnt - blueCnt);
	answer = min(answer, diff);
}

int main() {
	//1. 선거구를 두 개로 나누기
	//2. 각 선거구가 연결되었는지 확인
	//3. 차이의 최소값 계산

	cin >> n;
	people.assign(n, 0);
	for (int i = 0; i <n; i++) {
		cin >> people[i];
	}

	graph.assign(n, vector<int>());
	for (int i = 0; i <n; i++) {
		int num = 0;
		cin >> num;
		while (num--) {
			int a;
			cin >> a;
			graph[i].push_back(a-1);
		}
	}

	for (int i = 1; i < n; i++) {
		vector<bool> temp(n, false);
		for (int j = 0; j < i; j++) {
			temp[j] = true;
		}
		sort(temp.begin(), temp.end());
		do {
			calc(temp);
		} while (next_permutation(temp.begin(), temp.end()));
	}

	if (answer == INF) cout << -1;
	else cout << answer;
}