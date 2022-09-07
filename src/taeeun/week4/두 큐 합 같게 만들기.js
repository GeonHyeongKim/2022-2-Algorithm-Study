function solution(queue1, queue2) {
    const newQueue=[...queue1, ...queue2];
    const getSum=(arr)=>arr.reduce((acc, cur)=>acc+cur);
    const targetSum = getSum(newQueue)/2;
    
    const max=queue1.length*3-2;
    let cnt=0;
    let left=0;
    let right=queue1.length;
    let currentSum=getSum(queue1);

    while(cnt<=max) {
        if (currentSum===targetSum) {
            return cnt;
        }
        if (currentSum>targetSum) {
            currentSum-=newQueue[left];
            left++;
        }
        else if (currentSum<targetSum) {
            currentSum+=newQueue[right];
            right++;
        }
        cnt++;
    }
    return -1;
}
