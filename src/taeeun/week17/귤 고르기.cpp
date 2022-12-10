#include <string>
#include <vector>
#include <map>
#include <algorithm>
#include <iostream>

using namespace std;
typedef pair<int, int> pi;

bool cmp(const pi&a, const pi&b) {
    return a.second > b.second;
}

int solution(int k, vector<int> tangerine) {
    int answer = 0;
    int n=tangerine.size();
    map<int ,int> m;
    for (int i=0; i<n; i++) {
        m[tangerine[i]]++;
    }
    vector<pi> v(m.begin(), m.end());
    sort(v.begin(), v.end(), cmp);

    int cnt=0;
    for (int i=0; i<v.size(); i++) {
        if (cnt>=k) return answer;
        answer++;
        cnt+=v[i].second;
    }

}
