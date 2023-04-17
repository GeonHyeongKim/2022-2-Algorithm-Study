#include <vector>
#include <algorithm>
#include <iostream>

using namespace std;
//상, 좌, 하, 우
int dx[4]={-1, 0, 1, 0};
int dy[4]={0, 1, 0, -1};
int n, m;
int getMaxCrossSize(int x, int y, vector<vector<char>> &graph){
    int size=0;
    while (true) {
        bool flag=true;
        for (int i=0; i<4; i++) {
            int nextX=x+dx[i]*size;
            int nextY=y+dy[i]*size;
            if (nextX<0 ||nextX>=n || nextY<0 || nextY>=m ||graph[nextX][nextY]!='#') {
                flag=false; break;
            }
        }
        if (flag) size++;
        else break;
    }
    return size-1;
}

vector<vector<char>> makeCross(int x, int y, int size, vector<vector<char>> &graph, char val) {
    vector<vector<char>> copy=graph;
    for (int j=0; j<=size; j++){
        for (int i=0; i<4; i++) {
            int nextX=x+dx[i]*j;
            int nextY=y+dy[i]*j;
            copy[nextX][nextY]=val;
        }
    }
    return copy;
}


int main() {
    cin >> n >> m;
    vector<vector<char>>graph(n, vector<char>(m));
    for (int i=0; i<n; i++) {
        for (int j=0; j<m; j++) {
            cin >> graph[i][j];
        }
    }
    int answer=0;
    for (int i=0; i<n; i++) {
        for (int j=0; j<m; j++) {
            if (graph[i][j]!='#') continue;
            int firstSize=getMaxCrossSize(i,j,graph);
            for (int k=0; k<=firstSize; k++) {
                graph=makeCross(i, j, k, graph, '*');

                for (int a=0; a<n; a++) {
                    for (int b=0; b<m; b++) {
                        if (graph[a][b]!='#') continue;
                        int secondSize=getMaxCrossSize(a, b, graph);
                        int width1=4*k+1;
                        int width2=4*secondSize+1;
                        answer=max(answer,width1*width2);
                    }
                }
                graph=makeCross(i, j, k, graph, '#');
            }
        }
    }
    cout << answer;
}