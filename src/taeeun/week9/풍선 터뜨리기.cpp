#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int solution(vector<int> a) {
    int answer = 0;
    int n=a.size();
    vector<int> left(n);
    vector<int> right(n);
    left[0]=a[0];
    for (int i=1; i<n-1; i++) {
        left[i]=min(left[i-1], a[i]);
    }
    right[n-1]=a[n-1];
    for (int i=n-2; i>0; i--) {
        right[i]=min(right[i+1], a[i]);
    }
    
    for (int i=0; i<n; i++) {
        if (i==0 || i==n-1) {
            answer++;
            continue;
        }
        if (a[i]<left[i-1] || a[i]<right[i+1]) answer++;
    }
    
    return answer;
}
