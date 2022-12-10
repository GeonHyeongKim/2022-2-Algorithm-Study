
#include <iostream>
#include <vector>
#include <algorithm>
#include <tuple>
#include <queue>

using namespace std;
typedef tuple<int, int, int> ti;
const int INF=1e9;
int dx[4]={-1, 1, 0, 0};
int dy[4]={0, 0, -1, 1};

vector<vector<int>> dijkstra(int n, vector<vector<int>> &graph){
    vector<vector<int>> dist(n, vector<int>(n, INF));
    dist[0][0]=graph[0][0];
    priority_queue<ti, vector<ti>, greater<>> pq;
    pq.push({graph[0][0], 0, 0});
    while (!pq.empty()) {
        int cost=get<0>(pq.top());
        int curX=get<1>(pq.top());
        int curY=get<2>(pq.top());
        pq.pop();
        for (int i=0; i<4; i++) {
            int nextX=curX+dx[i];
            int nextY=curY+dy[i];
            if (nextX<0 || nextX>=n || nextY<0 || nextY>=n) continue;
            if (dist[nextX][nextY]>cost+graph[nextX][nextY]) {
                dist[nextX][nextY]=cost+graph[nextX][nextY];
                pq.push({dist[nextX][nextY], nextX, nextY});
            }
        }
    }
    return dist;
}

int main()
{
    int cnt=1;
    while (true) {
        int n; 
        cin >> n;
        if (n==0) break;
        vector<vector<int>> graph(n, vector<int>(n, 0));
        for (int i=0; i<n; i++) {
            for (int j=0; j<n; j++) {
                cin >> graph[i][j];
            }
        }
        vector<vector<int>> dist=dijkstra(n, graph);
        cout << "Problem " << cnt << ": " <<dist[n-1][n-1] << "\n";
        cnt++;
    }
}
