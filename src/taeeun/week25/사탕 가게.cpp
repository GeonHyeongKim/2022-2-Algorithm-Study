#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
typedef pair<int, int> pi;


int main() {
	while (true) {
		int n;
		double m;
		cin >> n >> m;
		if (n == 0 && m == 0) break;
		int money = m * 100;
		vector<pi> candy;
		for (int i = 0; i < n; i++) {
			int c;
			double p;
			cin >> c >> p;
			candy.push_back({ c, (int) (p*100+0.5) });
		}
		sort(candy.begin(), candy.end());
		vector<int>dp(10001);
		for (int i = 0; i < n; i++) {
			for (int j = candy[i].second; j <= money; j++) {
				dp[j] = max(dp[j], dp[j - candy[i].second] + candy[i].first);
			}
		}
		int answer = 0;
		for (int i = 0; i <= money; i++) {
			answer = max(answer, dp[i]);
		}
		cout << answer << "\n";
	}

}