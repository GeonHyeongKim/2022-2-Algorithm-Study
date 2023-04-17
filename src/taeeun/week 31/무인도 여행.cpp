#include <string>
#include <vector>
#include <queue>
#include <algorithm>
#include <iostream>

using namespace std;
typedef pair<int, int> pi;
int dx[4]={-1, 1, 0, 0};
int dy[4]={0, 0, -1, 1};
int n, m;

int bfs(int x, int y, vector<string> &maps, vector<vector<bool>> &visited) {
    visited[x][y]=true;
    queue<pi> q;
    q.push({x, y});
    int cnt=maps[x][y]-'0';

    while (!q.empty()) {
        int curX=q.front().first;
        int curY=q.front().second;
        q.pop();
        for (int i=0; i<4; i++) {
            int nextX=curX+dx[i];
            int nextY=curY+dy[i];
            if (nextX<0 || nextX>=n || nextY<0 || nextY>=m) continue;
            if (visited[nextX][nextY] || maps[nextX][nextY]=='X') continue;
            visited[nextX][nextY]=true;
            q.push({nextX, nextY});
            cnt+=maps[nextX][nextY]-'0';
        }
    }
    return cnt;
}


vector<int> solution(vector<string> maps) {
    vector<int> answer;
    n=maps.size();
    m=maps[0].size();
    vector<vector<bool>> visited(n, vector<bool>(m, false));

    for (int i=0; i<n; i++) {
        for (int j=0; j<m; j++) {
            if (maps[i][j]=='X' || visited[i][j]) continue;
            answer.push_back(bfs(i, j, maps, visited));
        }
    }
    sort(answer.begin(), answer.end());
    if (answer.size()==0) answer.push_back(-1);
    return answer;
}