#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>
#include <cstring>

using namespace std;
bool circle[3001]={false};
bool visited[3001]={false};

void dfs(int cur, int start, int cnt, vector<vector<int>> &graph) {
    visited[cur]=true;
    for (int i=0; i<graph[cur].size(); i++) {
        int next=graph[cur][i];
        if (!visited[next]) dfs(next, start, cnt+1, graph);
        else if (visited[next] && next==start && cnt>=2) {
            circle[start]=true;
            return;
        }
    }
}

int bfs(int node, int n, vector<vector<int>> &graph) {
    queue<pair<int, int>> q;
    q.push({node, 1});
    vector<bool> visited(n+1, false);
    visited[node]=true;

    while (!q.empty()) {
        int cur=q.front().first;
        int cnt=q.front().second;
        q.pop();

        for (int i=0; i<graph[cur].size(); i++) {
            int next=graph[cur][i];
            if (circle[next]) {
                return cnt;
            }
            if (visited[next]) continue;
            q.push({next, cnt+1});
            visited[next]=true;
        }
    }
    return 0;
}

int main()
{
    int n;
    cin >> n;
    vector<vector<int>> graph(n+1);
    vector<int> answer(n+1, 0);
    for (int i=0; i<n; i++) {
        int a, b;
        cin >>a >> b;
        graph[a].push_back(b);
        graph[b].push_back(a);
    }

    for (int i=1; i<=n; i++) {
        memset(visited, false, sizeof(visited));
        dfs(i, i, 0, graph);
    }

    for (int i=1; i<=n; i++) {
        if (circle[i]) continue;
        answer[i]=bfs(i, n, graph);
    }

    for (int i=1; i<=n; i++) {
        cout << answer[i] <<" ";
    }
}