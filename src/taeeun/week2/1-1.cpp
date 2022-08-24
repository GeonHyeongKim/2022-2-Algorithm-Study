#include <string>
#include <vector>
#include <map>
#include <string>
#include <algorithm>

using namespace std;

string solution(string X, string Y) {
    string answer = "";
    map<char, int> m;
    for (auto x:X) {
        m[x]++;
    }
    vector<char> temp;
    for (auto y:Y) {
        if (m.find(y)!=m.end()) {
            temp.push_back(y);
            m[y]--;
        }
        if (m[y]==0) m.erase(y);
    }
    sort(temp.begin(), temp.end(), greater<>());
    for (auto iter: temp) {
        answer+=iter;
    }
    if (answer.length()==0) return "-1";
    if (answer[0]=='0') return "0"; //앞이 0으로 시작하면 무조건 0
    return answer; 
}
