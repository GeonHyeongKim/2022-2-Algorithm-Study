#include <iostream>
#include <vector>
#include <deque>
#include <algorithm>
using namespace std;	
int N, K;	
deque<bool>visited;
deque<int>A;
void moveBelt() {
	A.push_front(A.back());
	A.pop_back();
	visited.push_front(visited.back());
	visited.pop_back();
}
void moveRobot() {
	if (visited[N - 1]) visited[N - 1] = false;
	for (int i = N - 2; i >= 0; i--) {
		//current==i
		//컨베이어 벨트위에 로봇이 있고 그 다음 벨트 내구성이 1 이상이고 다음 벨트에 로봇이 없을 때
		if (visited[i] &&!visited[i+1]&& A[i + 1] >= 1) {
			visited[i] = false;
			A[i + 1]--;
			if (i != N - 2) visited[i + 1] = true;
		}
	}
}
void putRobot() {
	//놓는 자리에 로봇이 없고 내구도가 1이상
	if (!visited[0] && A[0]>=1) {
		visited[0] = true;
		A[0]--;
	}
}
int countZero() {
	int cnt = 0;
	for (auto iter : A) {
		if (iter == 0) cnt++;
	}
	return cnt;
}
int main() {
	//내구도가 0인 칸이 K개 이상이라면 종료
	cin >> N >> K;
	for (int i = 0; i < 2 * N; i++) {
		int a;
		cin >> a;
		A.push_back(a);
		visited.push_back(false);
	}
	int start = 0;
	int end = 2 * N - 1;
	int answer = 0;
	int count_zero = countZero();
	while (true) {
		//내구도가 0인 칸의 개수가 K개 이상이면 과정 종료
		if (countZero()>=K) break;
		answer++;
		//1. 컨베이어 벨트 회전
		moveBelt();
		//2. 로봇 이동
		moveRobot();
		//3. 올리는 위치의 내구도가 0이 아니라면 올리는 위치에 로봇 올림
		putRobot();
	}
	cout << answer;
}
