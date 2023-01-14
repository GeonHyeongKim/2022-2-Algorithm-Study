#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
typedef pair<long long, long long> pi;

int main() {
	int n;
	cin >> n;
	vector<pi> town(n);
	for (int i = 0; i < n; i++) {
		cin >> town[i].first >> town[i].second; //마을 위치, 사람 수
	}
	sort(town.begin(), town.end());
	vector<long long> people(n);
	people[0] = town[0].second;
	for (int i = 1; i < n; i++) {
		people[i]= people[i - 1] + town[i].second;
	}
	int left = 0;
	int right = n - 1;
	long long answer =1e9;
	while (left <= right) {
		int mid = (left + right) / 2;
		long long leftPeople = people[mid];
		long long rightPeople = people[n - 1] - people[mid];
		//왼쪽에 두는 것이 유리한지, 오른쪽에 두는 것이 유리한지
		if (leftPeople >= rightPeople) {
			right = mid - 1;
			answer = min(answer, town[mid].first);
		}
		else {
			left = mid + 1;
		}
	}
	cout << answer;

}