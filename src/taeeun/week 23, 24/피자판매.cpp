#include <iostream>
#include <vector>
#include <algorithm>
#include <map>

using namespace std;

vector<int> getSum(int len, vector<int> &arr) {
	int sum = 0;
	vector<int> sumArr;
	for (int i = 0; i < len; i++) {
		for (int j = i; j < i+len-1; j++) {
			sum += arr[j%len];
			sumArr.push_back(sum);
			//cout << sum << "\n";
		}
		sum = 0;
	}
	for (int i = 0; i < len; i++) {
		sum += arr[i];
	}
	sumArr.push_back(0);
	sumArr.push_back(sum);
	return sumArr;
}


int main() {
	int pizza;
	cin >> pizza;
	int m, n;
	cin >> m >> n;
	vector<int>A(m);
	vector<int>B(n);
	for (int i = 0; i < m; i++) {
		cin >> A[i];
	}
	for (int i = 0; i < n; i++) {
		cin >> B[i];
	}

	vector<int> sumA = getSum(m, A);
	vector<int> sumB = getSum(n, B);

	map<int, int> mapA;
	map<int, int> mapB;
	for (int i = 0; i < sumA.size(); i++) {
		mapA[sumA[i]] += 1;
	}

	for (int i = 0; i < sumB.size(); i++) {
		mapB[sumB[i]] += 1;
	}

	int answer = 0;

	for (int i = 0; i <= pizza; i++) {
		int cntA = mapA[i];
		int cntB = mapB[pizza - i];
		answer += cntA * cntB;
	}
	cout << answer;

}