#include <string>
#include <vector>
#include <algorithm>

using namespace std;
typedef pair<int, int> pi;
vector<pi> tree;
vector<pi> coord;

struct Node{
    int x, y, num;
};

bool cmp(Node &a, Node &b) {
    if (a.y!=b.y) return a.y>b.y;
    return a.x>b.x;
}

void create_tree(int cur, Node next){
    //왼쪽 자식
    if (coord[cur].first>next.x) {
        if (tree[cur].first==cur) {
            tree[cur].first=next.num;
            return;
        }
        else {
            create_tree(tree[cur].first, next);
        }
    }
    //오른쪽 자식
    else {
        if (tree[cur].second==cur) {
            tree[cur].second=next.num;
            return;
        }
        else {
            create_tree(tree[cur].second, next);
        }
    }
}

void preorder(vector<int> &result, int cur){
    result.push_back(cur);
    if (tree[cur].first!=cur) {
        preorder(result, tree[cur].first);
    }
    if (tree[cur].second!=cur) {
        preorder(result, tree[cur].second);
    }
}

void postorder(vector<int> &result, int cur) {
    if (tree[cur].first!=cur) {
        postorder(result, tree[cur].first);
    }
    if (tree[cur].second!=cur) {
        postorder(result, tree[cur].second);
    }
    result.push_back(cur);
}

vector<vector<int>> solution(vector<vector<int>> nodeinfo) {
    vector<vector<int>> answer;
    int n=nodeinfo.size();
    vector<Node> graph;
    coord.resize(n+1);
    tree.resize(n+1);
    
    for (int i=1; i<=n; i++) {
        tree[i]={i, i};
        coord[i]={nodeinfo[i-1][0], nodeinfo[i-1][1]};
    }
    
    for (int i=0; i<nodeinfo.size(); i++) {
        //x, y, num
        graph.push_back({nodeinfo[i][0], nodeinfo[i][1], i+1});
    }
    
    sort(graph.begin(), graph.end(), cmp);
    
    int root=graph[0].num;
    for (int i=1; i<=n; i++) {
        create_tree(root, graph[i-1]);
    }
    
    vector<int> result;
    preorder(result, root);
    answer.push_back(result);
    result.clear();
    
    postorder(result, root);
    answer.push_back(result);
    
    return answer;
}
