#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
typedef pair<long long, long long> pi;


int main() {
	long long n, t;
	cin >> n >> t;
	vector<pi>carrot;
	for (int i = 0; i < n; i++) {
		int w, p;
		cin >> w >> p;
		carrot.push_back({ p, w});
	}
	sort(carrot.begin(), carrot.end());
	long long answer = 0;

	for (int i = 0; i < n; i++) {
		long long w = carrot[i].second;
		long long p = carrot[i].first;
		answer += w + p*(i + t - n);
	}
	cout << answer;
}