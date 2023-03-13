#include <iostream>
#include <vector>	
using namespace std;
int main() {
	int N, K;
	cin >> N >>K;
	vector <int> coin(N);
	vector<int> DP(10001);
	DP[0] = 1;
	for (int i = 0; i < N; i++) {
		cin >> coin[i];
	}
	for (int i = 0; i < N; i++) {
		for (int j = coin[i]; j <= K; j++) {
			DP[j]+= DP[j - coin[i]];
		}
	}
	cout << DP[K];

}