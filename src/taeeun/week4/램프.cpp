#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int findZero(string str) {
	int cnt = 0;
	for (int i = 0; i < str.length(); i++) {
		if (str[i] == '0') cnt++;
	}
	return cnt;
}

int main() {
	int n, m, k;
	int answer = 0;
	cin >> n >> m;
	vector<string> lamp(n);
	for (int i = 0; i < n; i++) {
		cin >> lamp[i];
	}
	cin >> k;
	for (int i = 0; i < n; i++) {
		int cnt = 0;
		int zero = findZero(lamp[i]);
		if (zero % 2 == k % 2 && zero <= k) {
			for (int j = 0; j < n; j++) {
				if (lamp[i] == lamp[j]) cnt++;
			}
		}
		answer = max(answer, cnt);
	}
	cout << answer;
}

