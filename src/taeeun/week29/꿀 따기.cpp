#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int main() {
	ios::sync_with_stdio(false);
	cin.tie(0);
	int n;
	cin >> n;
	vector <int> honey(n+1);
	vector<int> sum(n+1);
	for (int i = 1; i <=n; i++) {
		cin >> honey[i];
		sum[i] = sum[i - 1] + honey[i];
	}
	int answer = 0;		
	//벌-꿀-벌
	for (int i = 2; i < n; i++) {
		//벌 위치는 고정
		int temp = (sum[i] - sum[1]) + (sum[n - 1] - sum[i - 1]);
		answer = max(answer, temp);
	}

	//벌-벌-꿀
	for (int i = 2; i < n; i++) {
		//벌 1마리와 꿀 위치 고정
		int temp = (sum[n] - sum[1] - honey[i]) + (sum[n] - sum[i]);
		answer = max(answer, temp);
	}

	//꿀-벌-벌
	for (int i = 2; i < n; i++) {
		//벌 1마리와 꿀 위치 고정
		int temp = (sum[n - 1] - honey[i]) + sum[i - 1];
		answer = max(answer, temp);
	}

	cout << answer;

}