#include <string>
#include <vector>
#include <sstream>
#include <queue>
#include <stack>
#include <iostream>

using namespace std;

struct subject {
    string name;
    int start, playtime;
};

struct cmp {
	bool operator()(const subject &a, const subject &b) {
		return a.start > b.start;
	}
};

vector<string> split (string str){
    stringstream ss(str);
    char delim = ':';
    vector<string> v;
    string temp;
    while (getline(ss, temp, delim)) {
		v.push_back(temp);
	}
    return v;
}

int changeTime(string time) {
    int hour=stoi(split(time)[0]);
    int min=stoi(split(time)[1]);
    return hour*60+min;
}

vector<string> solution(vector<vector<string>> plans) {
    vector<string> answer;
    //1. 우선순위: 새로 시작하는 과제 > 잠시 멈춰둔 과제
    //2. 가장 최근에 멈춘 과제부터 시작
    priority_queue<subject, vector<subject>, cmp>pq;
    for (int i=0; i<plans.size(); i++) {
        pq.push({plans[i][0], changeTime(plans[i][1]), stoi(plans[i][2])});
    }
    
    int curTime = 0; //현재 시간
    stack<subject> st; //미뤄둔 과제
    
    while (!pq.empty()) {
        subject cur = pq.top();
        //미뤄둔 과제가 있는 경우
        if (!st.empty()) {
            subject remain=st.top();
            st.pop();
            //미뤄둔 과제 진행 가능
            if (cur.start > curTime) {
                pq.push({remain.name, curTime, remain.playtime});
                continue;
            }
            //진행 불가능하면 start만 갱신
            st.push({remain.name, curTime, remain.playtime});
        }

        pq.pop();
        
        curTime = cur.start+cur.playtime;
        subject next = pq.top();
        
        if (curTime <= next.start) {
            answer.push_back(cur.name);
        }
        else {
            curTime = next.start;
            st.push({cur.name, cur.start, cur.playtime - (next.start-cur.start)});
        }
    }
    
    while (!st.empty()) {
        answer.push_back(st.top().name);
        st.pop();
    }
    
    return answer;
}