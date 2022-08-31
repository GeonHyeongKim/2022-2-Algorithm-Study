#include <string>
#include <vector>
#include <map>
#include <iostream>

using namespace std;

int solution(vector<string> want, vector<int> number, vector<string> discount) {
    int answer = 0;
    int days=discount.size()-10;
    map <string, int> products;
    for (int i=0; i<10; i++) {
        products[discount[i]]++;
    }
    for (int i=0; i<=days; i++) {
        bool flag=true;
        for (int j=0; j<want.size(); j++) {
            string want_product=want[j];
            int want_num=number[j];
            if (products[want_product] < want_num) {
                flag=false;
                break;
            }
        }
        if (flag) {
            answer++;
        }
        if (10+i<discount.size()) {
            products[discount[i]]--;
            products[discount[10+i]]++;
        }
    }

    return answer;
}
