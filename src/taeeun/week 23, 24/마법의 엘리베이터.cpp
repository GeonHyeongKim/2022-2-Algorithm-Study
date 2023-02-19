#include <string>
#include <vector>

using namespace std;

int solution(int storey) {
    int answer = 0;
    while (storey) {
        int remain = storey%10;
        int next=(storey/10)%10;

        if (remain>5) {
            answer+=(10-remain);
            storey+=10;
        }
        else if (remain<5) {
            answer+=remain;
        }
        else if (remain==5) {
            answer+=remain;
            storey+=next>=5?10:0;
        }
        storey/=10;
    }

    return answer;
}