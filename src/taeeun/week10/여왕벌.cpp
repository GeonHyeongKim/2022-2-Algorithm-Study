#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

int main() {
	int m, n;
	cin >> m >> n;
	vector<int> bee(m * 2 - 1, 1);
	while (n--) {
		int idx = 0;
		for (int i = 0; i <= 2; i++) {
			int num;
			cin >> num;
			while (num--) {
				bee[idx++] += i;
			}
		}
	}
	for (int i = 0; i < m; i++) {
		cout << bee[m - i - 1] << " ";
		for (int j = 1; j < m; j++) {
			cout << bee[m + j - 1] << " ";
		}
		cout << "\n";
	}
}

