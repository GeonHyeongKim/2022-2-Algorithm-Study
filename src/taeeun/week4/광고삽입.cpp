#include <string>
#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;
int getHour(string a) {return stoi(a.substr(0, 2));}
int getMin(string a) {return stoi(a.substr(3, 2));}
int getSec(string a) {return stoi(a.substr(6, 2));}

int convertTime(string time) {
    return getHour(time)*3600+getMin(time)*60+getSec(time);
}

string toString(int time) {
    string s;
    
    int hour=time/3600;
    int min=(time/60) %60;
    int sec=time%60;
    
    if (hour < 10) s+='0';
    s+=to_string(hour)+':';
    if (min < 10) s+='0';
    s+=to_string(min)+':';
    if (sec<10) s+='0';
    s+=to_string(sec);
    
    return s;
}

string solution(string play_time, string adv_time, vector<string> logs) {
    string answer = "";
    int play=convertTime(play_time);
    int adv=convertTime(adv_time);
    
    vector<long long> arr(play, 0);
    
    for (int i=0; i<logs.size(); i++) {
        string s=logs[i].substr(0, 8);
        string e=logs[i].substr(9, 8);
        
        int start= convertTime(s);
        int end=convertTime(e);
        
        for (int i=start; i<end; i++) {
            arr[i]++;
        }
        
    }
    
    //슬라이딩 윈도우 사용
    //윈도우의 크기는 adv
    
    //윈도우 초기화
    long long max_sum=0;
    for (int i=0; i<adv; i++) {
        max_sum+=arr[i];
    }
    long long sum=max_sum;
    long long  temp=0;
    for (int i=adv; i<play; i++) {
        sum-=arr[i-adv];
        sum+=arr[i];
        if (sum>max_sum) {
            max_sum=sum;
            temp=i-adv+1;
        }
    }
    return toString(temp);
}
