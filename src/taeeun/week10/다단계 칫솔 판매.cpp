#include <string>
#include <vector>
#include <map>
#include <iostream>

using namespace std;
map<string, int>m;
vector<int>parent;
vector<int> money;

void giveMoney(int seller, int amount) {
    if (seller<0) return;
    int p=0; int m=0;

    //만약 배분할 금액이 있다면 절사하지 않음
    if (amount*0.1==0) p=amount;
    else p=amount*0.1;
    
    m=amount-p;
    money[seller]+=m;
    
    //부모로 전달
    giveMoney(parent[seller], p);
}

vector<int> solution(vector<string> enroll, vector<string> referral, vector<string> seller, vector<int> amount) {
    vector<int> answer;
    int n = enroll.size();
    parent.assign(n, -1);
    money.assign(n, 0);
    
    for (int i=0; i<n; i++) {
        //사람 이름을 int형으로 바꿔 저장
        m[enroll[i]]=i;
    }
    
    for (int i=0; i<n; i++) {
        if (referral[i]=="-") continue;
        parent[m[enroll[i]]]=m[referral[i]];
    }
    
    for (int i=0; i<seller.size(); i++) {
        giveMoney(m[seller[i]], amount[i]*100);
    }

    
    return money;
}
