#include <iostream>
#include <vector>
#include <queue>
#include <algorithm>
#define MAX 100001
using namespace std;
int N, K;
vector <bool> visited;
queue <pair <int, int>> q;
int answer = 0;
int cnt = 0;
int bfs() {
	q.push({ N, 0 });
	visited[N] = true;
	while (!q.empty()) {
		int current = q.front().first;
		int time = q.front().second;
		q.pop();
		if (current == K) 
			return time;
		if (current * 2 < MAX && !visited[current * 2]) {
			q.push({ current * 2, time });
			visited[current*2] = true;
		}		
		if (current - 1 >= 0 && !visited[current - 1]) {
			q.push({ current - 1, time + 1 });
			visited[current-1] = true;
		}
		if (current + 1 < MAX && !visited[current + 1]) {
			q.push({ current + 1, time + 1 });
			visited[current+1] = true;
		}
	}
}
int main() {
	cin >> N >> K;
	visited.assign(MAX, false);
	cout << bfs();
}
