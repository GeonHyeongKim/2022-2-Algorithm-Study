#include <string>
#include <vector>
#include <iostream>

using namespace std;
typedef vector<vector<int>> vi;
int n, m;

//key를 회전시키는 함수
vi rotate(vi &key) {
    vi copy(m, vector<int>(m));
    for (int i=0; i<m; i++) {
        for (int j=0; j<m; j++) {
            copy[i][j]=key[m-j-1][i];
        }
    }
    return copy;
}

//열쇠와 자물쇠를 합치는 함수
vi combine(vi &key, vi &lock, int x, int y) {
    //너비가 m+n+m인 사각형이 나온다
    vi board(n+2*m, vector<int>(n+2*m));
    //lock의 위치는 고정
    for (int i=m; i<n+m; i++) {
        for (int j=m; j<n+m; j++) {
            board[i][j]=lock[i-m][j-m];
        }
    }
    //key는 (x,y)만큼 이동
    for (int i=x; i<x+m; i++) {
        for (int j=y; j<y+m; j++) {
            board[i][j]+=key[i-x][j-y];
        }
    }
    
    return board;
}

bool check(vi &key, vi&lock, int x, int y) {
    vi board=combine(key, lock, x, y);
    for (int i=m; i<n+m; i++) {
        for (int j=m; j<n+m; j++) {
            if (board[i][j]!=1) return false;
        }
    }
    return true;
}

bool solution(vector<vector<int>> key, vector<vector<int>> lock) {
    bool answer = true;
    m=key.size();
    n=lock.size();
    
    //key가 lock 상하좌우로 붙을 수 있음
    for (int i=0; i<n+m; i++) {
        for (int j=0; j<n+m; j++) {
            //4번 돌려볼 수 있음
            for (int k=0; k<4; k++) {
                key=rotate(key);
                if (check(key, lock,i, j)) return true;
            }
        }
    }
    return false;
}
