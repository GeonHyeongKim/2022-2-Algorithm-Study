#include <iostream>
#include <algorithm>
#include <vector>
#include <set>

using namespace std;


int main() {
	int r, c;
	cin >> r >> c;
	vector<string> v(r);
	for (int i = 0; i < r; i++) {
		cin >> v[i];
	}

	int left = 0;
	int right = r - 1;
	int answer = 0;
	while (left <= right) {
		int mid = (left + right) / 2;
		set<string> s;
		for (int i = 0; i < c; i++) {
			string str = "";
			for (int j = mid; j < r; j++) {
				str+= v[j][i];
			}
			s.insert(str);
		}

		//중복이 없으면 mid보다 더 뒤로 가서 탐색해야함
		if (s.size() == c) {
			answer = max(answer, mid);
			left = mid + 1;
		}
		else {
			right = mid - 1;
		}
	}		
	cout << answer;
}

