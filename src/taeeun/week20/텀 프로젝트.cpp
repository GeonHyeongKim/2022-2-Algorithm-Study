#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
vector<int> visited;
vector<bool> cycle;
int cnt;

void dfs(vector<int> &stud, int node) {
	if (cycle[node] || visited[node] == -1) return;

	if (visited[node]) {
		cycle[node] = true;
		cnt++;
	}
	visited[node] = true;
	int next = stud[node];
	dfs(stud, next);
	visited[node] = -1;
}

int main() {
	int t;
	cin >> t;
	while (t--) {
		int n;
		cin >> n;
		vector<int> stud(n+1);
		visited.assign(n + 1, false);
		cycle.assign(n + 1, false);
		cnt = 0;

		for (int i = 1; i <= n; i++) {
			cin >> stud[i];
		}
		for (int i = 1; i <= n; i++) {
			if (!visited[i]) {
				dfs(stud, i);
			}
		}
		cout << n - cnt << "\n";
	}
}