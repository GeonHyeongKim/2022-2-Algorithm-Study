#include <string>
#include <vector>
#include <tuple>
#include <queue>
#include <iostream>

using namespace std;
const int INF=1e9;
typedef tuple<int, int, int> ti;

//왼위오아
int dx[4]={0, -1, 0, 1};
int dy[4]={-1, 0, 1, 0};

struct node {
    int x, y, dir, cost;
};

int solution(vector<vector<int>> board) {
    int answer = INF;
    int n=board.size();
    
    //X, Y, 자신이 온 방향
    int dp[25][25][4];
    for (int i=0; i<25; i++) {
        for (int j=0; j<25; j++) {
            for (int k=0; k<4; k++) {
                dp[i][j][k]=INF;
            }
        }
    }
    
    queue<node> q;
    q.push({0, 0, 0, 0});
    
    for (int i=0; i<2; i++) {
        dp[0][0][i]=0;
    }
    
    while (!q.empty()) {
        int currentX=q.front().x;
        int currentY=q.front().y;
        int currentDir=q.front().dir;
        int currentCost=q.front().cost;
        
        q.pop();
        
        for (int i=0; i<4; i++) {
            int nextX=currentX+dx[i];
            int nextY=currentY+dy[i];
            int nextDir=i%2;
            int nextCost=currentCost;
            
            if (nextX<0 || nextX>=n || nextY<0 || nextY>=n) continue;
            if (board[nextX][nextY]) continue; //벽으로 막혀있는 경우
            
            nextCost+=100; //직선 도로 비용
            
            if (currentX==0 && currentY==0) currentDir=nextDir; //출발지점에서는 어디로 가든 100원만 추가되게
            if (currentDir!=nextDir) {
                nextCost+=500; //코너의 경우 +500
            }
            if (nextCost> dp[nextX][nextY][nextDir]) continue;
            
            dp[nextX][nextY][nextDir]=nextCost;
            q.push({nextX, nextY, nextDir, nextCost});
            
        }
    }
    
    for (int i=0; i<2; i++) {
        answer=min(answer, dp[n-1][n-1][i]);
    }
    
    return answer;
}
