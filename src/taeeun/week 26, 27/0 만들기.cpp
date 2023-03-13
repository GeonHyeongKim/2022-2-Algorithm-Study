#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

using namespace std;
vector<string> answer;
int calculate(string res) {
    res.erase(remove(res.begin(), res.end(), ' '), res.end());
    int sum=0;
    string temp="";
    char op='+';
    for (int i=0; i<res.length(); i++){
        if (res[i]=='+' || res[i]=='-') {
            if (op=='+') sum+=stoi(temp);
            else sum-=stoi(temp);
            op=res[i];
            temp="";
        }
        else {
            temp+=res[i];
        }
    }
    if (op=='+') sum+=stoi(temp);
    else sum-=stoi(temp);
    return sum;
}


void backtracking(int cur, int n, string s) {
    if (cur==n){
        if (calculate(s)==0) {
            answer.push_back(s);
        }
        return;
    }
    backtracking(cur+1, n, s+' '+to_string(cur+1));
    backtracking(cur+1, n, s+'+'+to_string(cur+1));
    backtracking(cur+1, n, s+'-'+to_string(cur+1));
}

int main()
{
    int t;
    cin >> t;
    while (t--) {
        answer.clear();
        int n;
        cin >> n;
        backtracking(1, n, "1");
        for (int i=0; i<answer.size(); i++) {
            cout << answer[i]<<"\n";
        }
    }

    return 0;
}