#include <string>
#include <vector>
#include <algorithm>


using namespace std;

int solution(int n, vector<int> weak, vector<int> dist) {
    int answer = 101;
    //1. 원형을 일직선으로 바꿔줌
    int m=weak.size();
    weak.resize(m*2);
    for (int i=m; i<2*m; i++) {
        weak[i]=weak[i-m]+n;
    }
    
    sort(dist.begin(), dist.end());
    
    do {
        for (int i=0; i<m; i++) {
            int start=weak[i];
            int end=weak[i+m-1];
            for (int j=0; j<dist.size(); j++) {
                start+=dist[j];
                if (start>=end) {
                    answer=min(answer,j+1);
                    break;
                }
                
                //현재 지점에서 다음 가까운 취약 지점으로 이동
                for (int k=i+1; k<m; k++) {
                    if (weak[k]>start) {
                        start=weak[k];
                        break;
                    }
                }
            }        
        }
        
    }while(next_permutation(dist.begin(), dist.end()));
    
    if (answer==101) return -1;
    
    return answer;
}