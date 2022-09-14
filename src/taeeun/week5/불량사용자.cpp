#include <string>
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
bool check(string user, string banned){
    for (int i=0; i<banned.length(); i++){
        if (banned[i]=='*') continue;
        if (banned[i]!=user[i]) return false;
    }
    return true;
}

bool isSame(vector<string> users, vector<string>banned){
    int len=banned.size();
    sort(users.begin(), users.end());
    
    do{
        bool flag=false;
        for (int i=0; i<len; i++) {
            if (banned[i].length()!=users[i].length() || !check(users[i], banned[i])) {
                flag=true;
                break;
            }
        }
        if (!flag) return true;
    }while (next_permutation(users.begin(), users.end()));
    
    return false;
}

int solution(vector<string> user_id, vector<string> banned_id) {
    int answer = 0;
    //banned_id 배열과 같은 길이를 가진 배열을 다 만들고 조건에 부합하는지 확인
    vector<bool>temp(user_id.size(), false);
    for (int i=0; i<banned_id.size(); i++) {
        temp[i]=true;
    }
    
    sort(temp.begin(), temp.end()); //next_permutation을 사용하기 위해서는 무조건 정렬되어있어야 함

    vector<vector<string>> combinations;
    do{
        vector<string> users;

        for (int i=0; i<temp.size(); i++){
            if (temp[i]) users.push_back(user_id[i]);
        }
        
        //combinations 배열에 user 조합 저장
        combinations.push_back(users);
    } while (next_permutation(temp.begin(), temp.end()));

    for (int i=0; i<combinations.size(); i++){
        if (isSame(combinations[i], banned_id)) answer++;
    }
    return answer;
}
