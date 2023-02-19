#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

int main() {
	int n, k;
	cin >> n >>k;
	vector <int> arr(n);
	for (int i = 0; i < n; i++) {
		cin >> arr[i];
	}

	sort(arr.begin(), arr.end());

	vector<int> dist;
	for (int i = 0; i < n - 1; i++) {
		dist.push_back(arr[i + 1] - arr[i]);
	}

	sort(dist.begin(), dist.end());

	int answer = 0;

	for (int i = 0; i <n-k; i++) {
		answer += dist[i];
	}
	cout << answer;

}