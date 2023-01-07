#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
vector<vector<long long>> dp(31, vector<long long>(31, 0));
long long eat(int w, int h) {	
	//한 조각이 없을 때는 무조건 반 알
	if (w == 0) return 1;
	if (dp[w][h]) return dp[w][h];

	if (w > 0) {
		dp[w][h] += eat(w - 1, h + 1);
	}
	if (h > 0) {
		dp[w][h] += eat(w, h - 1);
	}
	return dp[w][h];
}

int main() {
	while (true) {
		int n;
		cin >> n;
		if (n == 0) break;
		cout << eat(n, 0) <<"\n";
	}
}