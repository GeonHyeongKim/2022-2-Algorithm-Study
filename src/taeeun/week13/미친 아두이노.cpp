#include <iostream>
#include <algorithm>
#include <vector>
#include<string>

using namespace std;
typedef pair<int, int> pi;
const int INF = 10e9;
int dx[9] = { 1, 1, 1, 0, 0, 0, -1, -1,-1 };
int dy[9] = { -1, 0, 1,-1, 0, 1, -1,  0, 1 };
int r, c;

void check(vector<vector<int>>& board) {
	for (int i = 0; i < r; i++) {
		for (int j = 0; j < c; j++) {
			if (board[i][j] > 1) {
				board[i][j] = 0;
			}
		}
	}
}

bool moveArduino(int currentX, int currentY, vector<vector<int>> &board) {
	vector<vector<int>> temp = board;
	for (int i = 0; i < r; i++) {
		for (int j = 0; j < c; j++) {
			if (board[i][j] == 0 || board[i][j]==-1) continue;
			int min_dist = INF;
			int dir = 0;

			temp[i][j]--;

			for (int d = 0; d < 9; d++) {
				int nextX = i + dx[d];
				int nextY = j + dy[d];
				if (nextX < 0 || nextX >= r || nextY < 0 || nextY >= c) continue;

				int dist = abs(currentX - nextX) + abs(currentY - nextY);
				if (min_dist > dist) {
					dir = d;
					min_dist = dist;
				}
			}
			int arduinoX = i + dx[dir];
			int arduinoY = j + dy[dir];

			if (board[arduinoX][arduinoY]==-1) return false;

			temp[arduinoX][arduinoY]++;

		}
	}
	board = temp;

	return true;
}


int main() {

	cin >> r >> c;
	vector<vector<int>> board(r, vector<int>(c, 0));
	vector<pi> arduino;
	int currentX=0, currentY=0;
	for (int i = 0; i < r; i++) {
		for (int j = 0; j < c; j++) {
			char c;
			cin >> c;
			if (c == 'I') {
				currentX = i;
				currentY = j;
				board[i][j] = -1;
			}
			else if (c == 'R') {
				arduino.push_back({ i, j });
				board[i][j] += 1;
			}
			else {
				board[i][j] = 0;
			}
		}
	}
	string dir;
	cin >> dir;

	for (int i = 0; i < dir.length(); i++) {
		board[currentX][currentY] = 0;
		int d = dir[i] - '0';

		int nextX = currentX + dx[d - 1];
		int nextY = currentY + dy[d - 1];

		if (board[nextX][nextY] > 0) {
			cout << "kraj " << i + 1;
			return 0;
		}
		board[nextX][nextY] = -1;
		currentX = nextX;
		currentY = nextY;

		if (!moveArduino(nextX, nextY, board)) {
			cout << "kraj " << i+1;
			return 0;
		}

		check(board);

	}


	for (int i = 0; i < r; i++) {
		for (int j = 0; j < c; j++) {
			if (board[i][j] == -1) cout << "I";
			else if (board[i][j] == 1) cout << "R";
			else cout << ".";
		}
		cout << "\n";
	}
}

