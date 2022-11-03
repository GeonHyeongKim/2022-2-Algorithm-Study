#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
int dx[4] = { 0,0,-1,1 };
int dy[4] = { -1,1,0,0 };	

vector<vector<char>>graph(12, vector<char>(6));		
vector<vector<bool>>visited;
vector<pair<int, int>> temp;
int cnt = 0;
void dfs(int x, int y) {
	for (int i = 0; i < 4; i++) {
		int next_x = x + dx[i];
		int next_y = y + dy[i];
		if (next_x < 0 || next_x >= 12 || next_y < 0 || next_y >= 6) continue;
		if (graph[next_x][next_y] == '.' || visited[next_x][next_y] || graph[x][y]!=graph[next_x][next_y]) continue;
		cnt++;
		visited[next_x][next_y] = true;
		temp.push_back({ next_x, next_y });
		dfs(next_x, next_y);
	}
}
void changeDot() {
	for (int i = 0; i < 12; i++) {
		for (int j = 0; j < 6; j++) {
			if (visited[i][j]) {
				graph[i][j] = '.';
			}
		}
	}
}
void redraw() {
	for (int i = 10; i >= 0; i--) {
		for (int j = 0; j < 6; j++) {
			if (graph[i][j] == '.') continue;
			int current_y = i; //현재 높이
			while (true) {
				//가장 밑바닥 도착하거나 바로 밑 블록이 알파벳이면 탐색할 필요x
				if (current_y == 11 || graph[current_y + 1][j] != '.') break;
				graph[current_y + 1][j] = graph[current_y][j];
				graph[current_y][j] = '.';
				current_y++;
			}
		}
	}
}
int main() {
	int answer = 0;
	for (int i = 0; i < 12; i++) {
		for (int j = 0; j < 6; j++) {
			cin >> graph[i][j];
		}
	}
	while (true) {
		bool flag = false;
		visited.assign(12, vector<bool>(6, false));
		for (int i = 0; i < 12; i++) {
			for (int j = 0; j < 6; j++) {
				cnt = 1;
				if (graph[i][j] == '.' || visited[i][j]) continue;
				visited[i][j] = true;
				temp.push_back({ i,j });
				dfs(i, j);
				//연쇄됨
				if (cnt >= 4) {
					flag = true;
				}
				//연쇄되지 않았다면 방문 취소
				else {
					for (int i = 0; i < temp.size(); i++) {
						visited[temp[i].first][temp[i].second] = false;
					}
				}
				temp.clear();
			}
		}
		
		//더 터질 곳이 없다면 while문 탈출
		if (!flag) break;
		else answer++;

		//연쇄된 곳을 .으로 바꿔준다
		changeDot();

		//붕 떠있는 블록이 있다면 밑으로 내려줘야함
		redraw();
	}
	cout << answer;
}
