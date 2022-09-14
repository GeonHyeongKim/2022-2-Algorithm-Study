#include <string>
#include <vector>
#include <iostream>

using namespace std;
typedef pair<int, int> pi;

int countBlocks(vector<string> &board) {
    int cnt=0;
    for (int i=0; i<board.size(); i++) {
        for (int j=0; j<board[i].size(); j++) {
            if (board[i][j]=='0') cnt++;
        }
    }
    return cnt;
}

int solution(int m, int n, vector<string> board) {
    int answer = 0;
    

    while (true) {
        vector<pi> del_block;    
        //지울 블록 탐색
        for (int i=0; i<m-1; i++) {
            for (int j=0; j<n-1; j++) {
                if (board[i][j]=='0') continue;
                char current=board[i][j];
                char right=board[i][j+1];
                char down = board[i+1][j];
                char cross=board[i+1][j+1];
                if (current==right && current==down && current==cross) {
                    del_block.push_back({i,j});
                }
            }
        }

        //더이상 지워질 블록이 없으면 루프 탈출
        if (del_block.empty()) {
            return countBlocks(board);
        }

        //지워지는 블록 체크
        for (int i=0; i<del_block.size(); i++) {
            pi coord=del_block[i];
            int x=coord.first;
            int y=coord.second;
            board[x][y]='0';
            board[x][y+1]='0';
            board[x+1][y]='0';
            board[x+1][y+1]='0';
        }

        //공간이 비어있다면 내리기
        //맨 밑줄부터 시작
        for (int i=m-1; i>0; i--) {
            for (int j=0; j<n; j++) {
                if (board[i][j]!='0') continue; //현재 칸이 비어있을 때만 탐색
                int next_row=i-1;
                while (next_row>=0) {
                    if (board[next_row][j]!='0') { //윗 칸이 비어있지 않는다면 블록 교체
                        board[i][j]=board[next_row][j];
                        board[next_row][j]='0';
                        break;
                    }
                    next_row--;
                }
            }
        }
    }
    return 0;
}
