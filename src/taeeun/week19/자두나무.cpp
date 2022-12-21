#include <iostream>
#include <vector>

using namespace std;

int main()
{
    int t, w;
    cin >> t >> w;
    vector<int> tree(t+1);
    for (int i=1; i<=t; i++) {
        cin >> tree[i]; //i초에 tree[i]번 나무에 자두가 떨어짐
    }
    

    int dp[31][3][1001]; //이동 횟수, 현재 위치, 시간


    for (int i=0; i<=w; i++) {
        for (int j=1; j<=t; j++) {
            //가장 처음 위치는 1번 나무
            if (i==0) {
                dp[0][1][j]+=dp[0][1][j-1];
                if (tree[j]==1) dp[0][1][j]+=1;
                continue;
            }
            
            dp[i][1][j]=max(dp[i][1][j-1]+(tree[j]==1), dp[i-1][2][j-1]+(tree[j]==1));
            dp[i][2][j]=max(dp[i][2][j-1]+(tree[j]==2), dp[i-1][1][j-1]+(tree[j]==2));
        }
    }
    
    int answer=0;

    for (int i=0; i<=w; i++) {
        for (int j=1; j<=2; j++) {
            answer=max(answer, dp[i][j][t]);
        }
    }
    
    cout << answer;
}
