#include <string>
#include <vector>
#include <stack>
#include <iostream>

using namespace std;

int solution(vector<int> order) {
    int answer = 0;
    stack<int> st; //보조컨테이너
    vector<int> container; //실제 컨테이너
    int box=1;
    for (int i=0; i<order.size(); i++) {
        while (box<=order[i]) {
            st.push(box);
            box++;
        }
        if (st.top()>order[i]) break;
        if (st.top()==order[i]) st.pop();
        container.push_back(order[i]);
    }
    answer=container.size();
    return answer;
}
