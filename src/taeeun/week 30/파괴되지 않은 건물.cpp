#include <string>
#include <vector>
#include <iostream>

using namespace std;

int solution(vector<vector<int>> board, vector<vector<int>> skill) {
    int answer = 0;
    int n=board.size();
    int m=board[0].size();
    
    vector<vector<int>> graph(n+1, vector<int>(m+1, 0)); //누적합을 담을 배열

    for (auto s: skill) {
        int type =s[0];
        int r1 =s[1];
        int c1=s[2];
        int r2=s[3];
        int c2=s[4];
        int degree=s[5];
        
        if (type==1) degree=-degree;
        
        graph[r1][c1]+=degree;
        graph[r1][c2+1]-=degree;
        graph[r2+1][c1]-=degree;
        graph[r2+1][c2+1]+=degree;
    }
    
    //가로로 누적합
    for (int i=0; i<n; i++) {
        for (int j=1; j<m; j++) {
            graph[i][j]+=graph[i][j-1];
        }
    }
    
    //세로로 누적합
    for (int i=1; i<n; i++) {
        for (int j=0; j<m; j++) {
            graph[i][j]+=graph[i-1][j];
        }
    }
    
    for (int i=0; i<n; i++) {
        for (int j=0; j<m; j++) {
            cout << graph[i][j] << " ";
        }
        cout << "\n";
    }    
    
    for (int i=0; i<n; i++) {
        for (int j=0; j<m; j++) {
            board[i][j]+=graph[i][j];
            if (board[i][j]>0) answer++;
        }
    }    
    
    
    return answer;
}