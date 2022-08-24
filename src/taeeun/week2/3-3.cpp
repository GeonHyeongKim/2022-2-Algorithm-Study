#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int solution(int distance, vector<vector<int>> scope, vector<vector<int>> times) {
    int answer = distance;
    for (int i=0; i<scope.size(); i++) {
        sort(scope[i].begin(), scope[i].end()); //scope는 정렬되어있지 않을 수 있음..!
        int start=scope[i][0];
        int end=scope[i][1];

        int work=times[i][0];
        int rest=times[i][1];

        for (int j=start; j<=end; j++) {
            //주기가 work+rest만큼 돌아오는데 근무->휴식이므로 나머지가 더 작으면 들킴
            if (j%(work+rest)<=work && j%(work+rest)!=0) {
                answer=min(answer, j);
            }
        }

    }
    return answer;
}
