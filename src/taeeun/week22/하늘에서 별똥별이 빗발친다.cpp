#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
typedef pair<int, int> pi;


int main() {
	int n, m, l, k;
	cin >> n >> m >> l >> k;
	vector<pi> stars(k);
	for (int i = 0; i < k; i++) {
		cin >> stars[i].first >> stars[i].second;
	}

	int answer = 0;

	for (int i = 0; i < k; i++) {

		int x = stars[i].first;
		for (int j = 0; j < k; j++) {
			int cnt = 0;
			int y = stars[j].second;
			for (int t = 0; t < k; t++) {
				int curX = stars[t].first;
				int curY = stars[t].second;
				if (x <= curX && curX <= x + l && y <= curY && curY <= y + l) {
					cnt++;
				}
			}
			answer = max(answer, cnt);
		}
	}
	cout << k - answer;
}