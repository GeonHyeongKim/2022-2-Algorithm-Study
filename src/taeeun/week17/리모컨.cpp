#include <iostream>
#include <algorithm>
#include <vector>
#include <string>

using namespace std;
const int MAX = 1000000;

bool check(int number, vector<bool> numbers) {
	string str = to_string(number);
	for (int i = 0; i < str.length(); i++) {
		int idx = str[i] - '0';
		if (!numbers[idx]) return false;
	}
	return true;
}


int main() {
	int n, m;
	cin >> n >> m;
	vector<bool> numbers(10, true);
	for (int i = 0; i < m; i++) {
		int num;
		cin >> num;
		numbers[num] = false;
	}

	int answer = abs(n - 100);

	for (int i = 0; i <= MAX; i++) {
		if (!check(i, numbers)) continue;
		int click = to_string(i).length() + abs(n - i);
		answer = min(answer, click);
	}
	cout << answer;

}

