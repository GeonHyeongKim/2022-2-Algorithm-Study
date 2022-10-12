#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;
vector<int> parent;

int findParent(int x) {
	if (x == parent[x]) return x;
	return parent[x] = findParent(parent[x]);
}

void unionRoom(int x, int y) {
	int xp = findParent(x);
	int yp = findParent(y);
	if (xp == yp) return;
	parent[yp] = xp; //더 작은 번호가 부모가 될 수 있게
}


int main() {
	int n, m;
	cin >> n >> m;
	parent.assign(n, 0);
	for (int i = 0; i < n; i++) {
		parent[i] = i;
	}
	int cnt = n;
	while (m--) {
		int x, y;
		cin >> x >> y;
		--x; --y;
		while (findParent(x) != findParent(y)) {
			cnt--;
			int next = findParent(x) + 1;
			unionRoom(x, y);
			x = next;
		}
	}

	cout << cnt;

}

