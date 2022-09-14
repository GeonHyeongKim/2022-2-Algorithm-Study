#include <string>
#include <vector>
#include <iostream>
#include <queue>
using namespace std;


bool visited[1<<17];

struct Node {
    int sheep;
    int wolf;
    int route;
    Node(int _sheep, int _wolf, int _route): sheep(_sheep), wolf(_wolf), route(_route) {};
};

int solution(vector<int> info, vector<vector<int>> edges) {
    int n=info.size();
    int answer=1;
	vector<vector<int>> graph(n, vector<int>(0));
    vector<int> next_node;
    
    for (int i=0; i<edges.size(); i++) {
        int a=edges[i][0];
        int b=edges[i][1];
        graph[a].push_back(b);
    }
    
    queue<Node*> q;
    q.push(new Node(1, 0, (1<<0)));
    visited[(1<<0)]=true;

    while (!q.empty()) {
        Node *cur=q.front();
        q.pop();
        
        int sheep=cur->sheep;
        int wolf=cur->wolf;
        int route=cur->route;
        
        for (int i=0; i<n; i++) {
            if (!(route & (1<<i))) continue; //현재 위치에서 갈 수 있는 길이 있는지
            for (auto next: graph[i]) {
                int next_route=route | (1<<next);

                if (info[next]==0) {
                    if (visited[next_route]) continue;
                    answer=max(answer, sheep+1);
                    visited[next_route]=true;
                    q.push(new Node(sheep+1, wolf, next_route));
                }
                else {
                    if (wolf+1>=sheep) continue;
                    if (visited[next_route]) continue;

                    visited[next_route]=true;
                    q.push(new Node(sheep, wolf+1, next_route));
                }
            }
        }
    }

    return answer;
}
