#include <string>
#include <vector>
#include <queue>
#include <iostream>
const int INF=1e8;

using namespace std;
typedef pair<int,int> pi;

vector<int> bfs(int n, vector<vector<int>> &graph, int start) {
    vector<int> visited(n+1, 0); //start에서 i번째 노드까지의 거리를 담는 배열
    queue<pi> q;

    visited[start]=0;
    q.push({start, 0});

    while (!q.empty()){
        int current=q.front().first;
        int dist=q.front().second;
        q.pop();

        for (int i=0; i<graph[current].size(); i++) {
            int next=graph[current][i];
            if (visited[next]>0) continue; //이미 방문
            visited[next]=dist+1;
            q.push({next, dist+1});
        }
    }
    return visited;
}

vector<int> solution(int n, vector<vector<int>> roads, vector<int> sources, int destination) {
    vector<int> answer;
    vector<vector<int>> graph(n+1, vector<int>(0));

    for (int i=0; i<roads.size(); i++) {
        int a=roads[i][0];
        int b=roads[i][1];
        graph[a].push_back(b);
        graph[b].push_back(a);
    }

    vector<int> visited=bfs(n, graph, destination);

    for (int i=0; i<sources.size(); i++) {
        int t = visited[sources[i]];
        if (t==0) answer.push_back(-1);
        else if (sources[i]==destination) answer.push_back(0);
        else answer.push_back(t);
    }
    return answer;
}
