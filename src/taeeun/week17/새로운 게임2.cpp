#include <iostream>
#include <vector>

using namespace std;
//우 좌 상 하
int dx[5] = { 0, 0, 0, -1, 1 };
int dy[5] = { 0, 1, -1, 0, 0 };

struct chess {
    int row, col, dir;
};
vector<int> play[13][13];
int n, k;

bool check() {
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            if (play[i][j].size() >= 4) return true;
        }
    }
    return false;
}

int reverseDir(int curDir) {
    if (curDir == 1) return 2;
    if (curDir == 2) return 1;
    if (curDir == 3) return 4;
    if (curDir == 4) return 3;
}


int main() {
    cin >> n >> k;
    //0: 흰색, 1: 빨간색, 2: 파란색
    vector<vector<int>>graph(n + 1, vector<int>(n + 1));
    for (int i = 1; i <= n; i++) {
        for (int j = 1; j <= n; j++) {
            cin >> graph[i][j];
        }
    }

    vector<chess> pieces;

    for (int i = 0; i < k; i++) {
        //행, 열, 방향
        int row, col, dir;
        cin >> row >> col >> dir;
        pieces.push_back({ row, col, dir });
        play[row][col].push_back(i);
    }

    int cnt = 0;

    while (true) {
        cnt++;
        for (int i = 0; i < k; i++) {
            int row = pieces[i].row;
            int col = pieces[i].col;
            int dir = pieces[i].dir;

            int nextR = row + dx[dir];
            int nextC = col + dy[dir];

            //범위밖으로 넘어가는지 or 파란색
            if ((nextR < 1 || nextR >n || nextC < 1 || nextC >n) || graph[nextR][nextC]==2) {
                int newDir = reverseDir(dir);
                nextR = row + dx[newDir];
                nextC = col + dy[newDir];
                pieces[i].dir = newDir;
            }

            //바꾼 후에 이동하려는 칸 체크
            if ((nextR < 1 || nextR >n || nextC < 1 || nextC >n) || graph[nextR][nextC] == 2) continue;

            vector<int> &cur = play[row][col];
            vector<int> &next = play[nextR][nextC];

            auto it = find(cur.begin(), cur.end(), i);
            int idx = it - cur.begin(); //i번 말의 위치

            if (graph[nextR][nextC] == 1) { //빨간색이라면 순서 바꿈
                reverse(it, cur.end());
            }

            for (int j = idx; j < cur.size(); j++) {
                pieces[cur[j]].row = nextR;
                pieces[cur[j]].col = nextC;
                next.push_back(cur[j]);
            }

            int a =cur.size() - idx;

            while (a--) {
                cur.pop_back();
            }

            if (check()) {
                cout << cnt;
                return 0;
            }
        }
        if (cnt >= 1000) {
           break;
        }
    }
    cout << -1;

}
