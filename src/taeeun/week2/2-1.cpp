#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int solution(vector<int> number) {
    int answer = 0;
    int n=number.size();
    vector<bool> temp(n, false);
    for (int i=0; i<3; i++) {
        temp[i]=true;
    }
    sort(temp.begin(), temp.end());
    do {
        int cnt=0;
        for (int i=0; i<n; i++) {
            if (temp[i]) cnt+=number[i];
        }
        if (cnt==0) answer++;
    }while (next_permutation(temp.begin(), temp.end()));

    return answer;
}
