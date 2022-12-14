#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
bool check(int idx, int N, vector<int>&v) {
	int left = 0;
	int right = N - 1;
	while (left < right) {
		int sum = v[left] + v[right];
		//자기 자신을 더해서 자기 자신이 되는 경우 예외처리
		if (right == idx) {
			right--; 
			continue;
		}
		if (left == idx) {
			left++; 
			continue;
		}
		if (sum == v[idx]) return true;
		if (sum > v[idx]) right--;
		else left++;
		
	}
	return false;
}
int main() {
	int N;
	cin >> N;
	vector<int> v(N);
	for (int i = 0; i < N; i++) {
		cin >> v[i];
	}
	sort(v.begin(), v.end());
	int cnt = 0;
	for (int i = 0; i < N; i++) {
		if (check(i, N, v)) cnt++;
	}
	cout << cnt;
}