#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;
struct box {
	int from, to, cnt;
};

bool cmp(box& a, box& b) {
	if (a.to != b.to) return a.to < b.to;
	return a.from < b.from;
}

int main() {
	int n, c, m;
	cin >> n >> c >> m;

	vector<box> v;
	vector<int> town(n + 1);

	for (int i = 0; i < m; i++) {
		int from, to, cnt;
		cin >> from >> to >> cnt;
		v.push_back({ from, to, cnt });
	}
	sort(v.begin(), v.end(), cmp);
	int answer = 0;
	for (int i = 0; i < m; i++) {
		int max_cnt = 0;
		int send_box = v[i].cnt;
		for (int j = v[i].from; j < v[i].to; j++) {
			//남은 자리>보내려는 박스인지
			if (c - town[j] < send_box) send_box = c - town[j];
		}
		for (int j = v[i].from; j < v[i].to; j++) {
			town[j] += send_box;
		}
		answer += send_box;
	}
	
	cout << answer;
}

