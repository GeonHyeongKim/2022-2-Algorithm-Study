#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
const int INF = 1e9;


int main() {
	ios::sync_with_stdio(false);
	cin.tie(0);
	int n, m;
	cin >> n >> m;
	vector<vector<int>> road(n, vector<int>(n, INF));
	for (int i = 0; i < m; i++) {
		int u, v, b;
		cin >> u >> v >> b;
		road[u-1][v-1] = 0;
		if (b == 0) {
			road[v - 1][u - 1] = 1;
		}
		else {
			road[v-1][u-1] = 0;
		}
	}
	for (int a = 0; a < n; a++) {
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				if (i == j) road[i][j] = 0;
				road[i][j] = min(road[i][j], road[i][a] + road[a][j]);
			}
		}
	}


	int k;
	cin >> k;
	while (k--) {
		int a, b;
		cin >> a >> b;
		cout << road[a-1][b-1] << "\n";
	}
}