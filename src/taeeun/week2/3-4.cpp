#include <string>
#include <vector>
#include <iostream>
using namespace std;
vector<bool> visited;
typedef pair<int, int> pi;

pi dfs(vector<vector<int>> &graph, int node) {
    visited[node]=true;
    pi light={1, 0}; //현재 등을 킨 경우, 현재 등을 끈 경우
    for (int i=0; i<graph[node].size(); i++) {
        int next=graph[node][i];
        if (visited[next]) continue;
        pi child=dfs(graph, next);
        light.first+=min(child.first, child.second); //현재 등이 켜져있으면 child는 상관 없음
        light.second+=child.first; //현재 등이 꺼져있을 때 반드시 child는 켜져있어야 함
    }
    return light;
}

int solution(int n, vector<vector<int>> lighthouse) {
    vector<vector<int>> graph(n+1, vector<int>(0));
    for (int i=0; i<lighthouse.size(); i++) {
        int a=lighthouse[i][0];
        int b=lighthouse[i][1];
        graph[a].push_back(b);
        graph[b].push_back(a);
    }
    visited.assign(n+1, false);

    //root node를 1로 설정
    pi answer=dfs(graph,1);
    
    return min(answer.first, answer.second);
}
