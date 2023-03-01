#include <string>
#include <vector>
#include <map>
#include <set>

using namespace std;

long long solution(vector<int> weights) {
    long long answer = 0;
    vector<int> d={2, 3, 4};
    vector<int> n={1, 2, 3};
    set<int> s;
    map<long, long> m;

    for (int i=0; i<weights.size(); i++) {
        s.insert(weights[i]);
        m[weights[i]]+=1;
    }

    for (auto weight: s) {
        //1:1 비율
        answer+=(m[weight]*(m[weight]-1))/2;

        //그외 비율
        for (int i=0; i<3; i++) {
            if (weight%n[i]) {
                continue;
            }
            answer+=m[(weight/n[i])*d[i]]*m[weight];
        }
    }

    return answer;
}