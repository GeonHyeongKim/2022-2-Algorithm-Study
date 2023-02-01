#include <string>
#include <vector>
#include <algorithm>
#include <iostream>

using namespace std;
typedef pair<int, int> pi;

struct employee {
    int a,b, idx;
};

bool cmp(employee x, employee y) {
    return x.a>y.a;
}

bool cmp2(pi a, pi b) {
    if (a.first==b.first) return a.second < b.second;
    return a.first>b.first;
}

int solution(vector<vector<int>> scores) {
    int answer = 0;
    int wonho=scores[0][0]+scores[0][1];
    vector<employee> v;
    for (int i=0; i<scores.size(); i++) {
        if (scores[i][0]>scores[0][0] && scores[i][1]>scores[0][1]) return -1;
        if (scores[i][0]+scores[i][1]<wonho) continue;
        v.push_back({scores[i][0], scores[i][1], i});
    }
    sort(v.begin(), v.end(), cmp);
    vector<pi> result;
    result.push_back({v[0].a+v[0].b, v[0].idx});
    for (int i=1; i<v.size(); i++) {
        employee cur=v[i];
        bool flag=false;
        for (int j=0; j<i; j++) {
            employee prev=v[j];
            if (cur.a==prev.a) continue;
            if (cur.b<prev.b) {
                flag=true;
                break;
            }
        }
        if (flag) continue;
        result.push_back({cur.a+cur.b, cur.idx});
    }
    sort(result.begin(), result.end(), cmp2);
    for (int i=0; i<result.size(); i++) {
        if (result[i].second==0) return i+1;
    }
    return -1;
}