#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;
const int INF = 1e9;


int main() {
	string str;
	cin >> str;
	int n = str.length();
	vector<vector<bool>> palindrome(n+1, vector<bool>(n+1, false));

	for (int i = 0; i < n; i++) {
		for (int j = 1; j + i <= n; j++) {
			if (str[j-1] != str[j + i-1]) continue;
			//길이가 1일때
			if (i == 0) {
				palindrome[j][j] = true;
				continue;
			}
			//길이가 2일때
			if (i == 1) {
				palindrome[j][j + i] = true;
				continue;
			}
			//길이가 3이상일때 
			if (palindrome[j + 1][j + i - 1]) {
				palindrome[j][j + i] = true;
			}
		}
	}

	vector<int> dp(n+1, INF);
	dp[0] = 0;

	for (int i = 1; i <= n; i++) {
		for (int j = 1; j <= i; j++) {
			if (!palindrome[j][i]) continue;
			dp[i] = min(dp[i], dp[j - 1] + 1);
		}
	}

	cout << dp[n];

}

