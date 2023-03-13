#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>

using namespace std;
typedef pair<int, int> pi;
typedef pair<pi, int> ppi;
int dx[4]={-1, 1, 0, 0};
int dy[4]={0, 0, -1, 1};
int r, c;

bool isInRange(int x, int y) {
    if (x<0 || x>=r || y<0 || y>=c) return false;
    return true;
}

void waterBFS(vector<vector<char>> &graph, vector<vector<int>> &water, queue<pi> waterQ){
    int t=0;

    while (!waterQ.empty()) {
        int x=waterQ.front().first;
        int y=waterQ.front().second;
        waterQ.pop();

        for (int i=0; i<4; i++) {
            int nextX=x+dx[i];
            int nextY=y+dy[i];
            if (!isInRange(nextX, nextY)) continue;
            if (graph[nextX][nextY]=='.' && water[nextX][nextY]==-1) {
                water[nextX][nextY]=water[x][y]+1;
                waterQ.push({nextX, nextY});
            }
        }
    }
}

void move(vector<vector<char>> &graph, vector<vector<int>> water, pi start, pi end){
    queue<ppi> graphQ;
    vector<vector<bool>> visited(r, vector<bool>(c, false));
    graphQ.push({{start.first, start.second}, 0});
    visited[start.first][start.second]=true;

    while (!graphQ.empty()) {
        int x=graphQ.front().first.first;
        int y=graphQ.front().first.second;
        int t=graphQ.front().second;
        graphQ.pop();

        for (int i=0; i<4; i++) {
            int nextX=x+dx[i];
            int nextY=y+dy[i];
            if (!isInRange(nextX, nextY)) continue;
            if (graph[nextX][nextY]=='D') {
                cout << t+1;
                return;
            }
            if (visited[nextX][nextY]) continue; //이미 방문
            if (graph[nextX][nextY]=='X') continue; //돌
            if (water[nextX][nextY]>0 && water[nextX][nextY]<=t+1) continue; //물

            visited[nextX][nextY]=true;
            graphQ.push({{nextX, nextY}, t+1});
        }
    }
    cout << "KAKTUS";

}

int main()
{
    cin >> r >>c;
    vector<vector<char>> graph(r, vector<char>(c));
    vector<vector<int>> water(r, vector<int>(c, -1));

    queue<pi> waterQ;
    pi start;
    pi end;

    for (int i=0; i<r; i++) {
        for (int j=0; j<c; j++) {
            char ch;
            cin >> graph[i][j];
            if (graph[i][j]=='D') {
                end={i, j};
            }
            if (graph[i][j]=='S') {
                start={i, j};
            }
            if (graph[i][j]=='*') {
                water[i][j]=0;
                waterQ.push({i, j});
            }
        }
    }
    waterBFS(graph, water, waterQ);
    move(graph, water, start, end);
}