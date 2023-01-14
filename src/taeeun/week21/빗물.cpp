#include <iostream>
#include<algorithm>
#include <vector>

using namespace std;
int main() {
	int W, H;
	int rain = 0;
	cin >> H >> W;
	vector <int> block(W);
	for (int i = 0; i < W; i++) {
		cin >> block[i];
	}
	for (int i = 1; i < W - 1; i++) {
		// i는 현재 열
		int leftMax = 0, rightMax = 0;
		//왼쪽 열 중의 최대 값
		for (int j = 0; j < i; j++) {
			leftMax = max(block[j], leftMax);
		}
		//오른쪽 열 중의 최대 값
		for (int j = i + 1; j < W; j++) {
			rightMax = max(block[j], rightMax);
		}
		if (min(leftMax, rightMax)-block[i]>0) rain+= min(leftMax, rightMax) - block[i];
	}
	cout << rain;

}