#include <string>
#include <vector>
#include <map>
#include <iostream>

using namespace std;

int solution(vector<int> topping) {
    int answer = 0;
    map<int, int> a;
    map<int, int> b;
    a[topping[0]]++;
    for (int i=1; i<topping.size(); i++) {
       b[topping[i]]++;
    }
    for (int i=1; i<topping.size()-1; i++) {
        if (a.size()==b.size()) answer++;
        a[topping[i]]++;
        b[topping[i]]--;
        if (b[topping[i]]==0) b.erase(topping[i]);
    }
    return answer;
}
