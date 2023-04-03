#include <string>
#include <vector>
#include <queue>
#include <iostream>

using namespace std;
typedef pair<int,int> pi;
const int INF=1e9;

int dx[4]={-1, 1, 0, 0};
int dy[4]={0, 0, -1, 1};

int bfs(vector<string> &board, pi start, pi end, int n, int m) {
    vector<vector<bool>> visited(n, vector<bool>(m, false));
    vector<vector<int>> dist(n, vector<int>(m, INF));
    queue<pi> q;

    visited[start.first][start.second]=true;
    q.push({start.first, start.second});
    dist[start.first][start.second]=0;

    while (!q.empty()) {
        int x = q.front().first;
        int y = q.front().second;
        q.pop();

        for (int i=0; i<4; i++) {
            int nextX=x;
            int nextY=y;
            while (true) {
                nextX+=dx[i];
                nextY+=dy[i];
                if (nextX<0 || nextX>=n || nextY<0 || nextY>=m || board[nextX][nextY]=='D') {
                    nextX-=dx[i];
                    nextY-=dy[i];
                    break;
                }
            }
            if (visited[nextX][nextY]) continue;
            q.push({nextX, nextY});
            dist[nextX][nextY]=min(dist[nextX][nextY], dist[x][y]+1);
            visited[nextX][nextY]=true;

        }
    }


    if (dist[end.first][end.second]==INF) return -1;
    return dist[end.first][end.second];
}

int solution(vector<string> board) {
    int answer = 0;
    int n = board.size();
    int m= board[0].size();
    pi start, end;

    for (int i=0; i<n; i++) {
        for (int j=0; j<m; j++) {
            if (board[i][j]=='R') {
                start={i, j};
            }
            if (board[i][j]=='G') {
                end={i, j};
            }
        }
    }

    answer = bfs(board, start, end, n, m);

    return answer;
}