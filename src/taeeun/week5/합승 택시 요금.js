function solution(n, s, a, b, fares) {
    var answer = 0;
    let dp= Array.from(Array(201), () => new Array(201));
    for (let i=1; i<=n;i++){
        for (let j=1; j<=n; j++){
            if (i==j) dp[i][j]=0;
            else dp[i][j]=Number.MAX_SAFE_INTEGER;
        }
    }
    fares.forEach(([v1, v2, distance])=>{
        dp[v1][v2] = distance;
        dp[v2][v1] = distance;
    })
    for (let k=1; k<=n; k++){
        for (let i=1; i<=n; i++){
            for (let j=1; j<=n;j++){
                dp[i][j]=Math.min(dp[i][j], dp[i][k]+dp[k][j]);
            }
        }
    }
    answer=Number.MAX_SAFE_INTEGER;
    for(let i=1; i<=n;i++){
        answer = Math.min(answer,dp[s][i]+dp[i][a]+dp[i][b]);
    }
    return answer;
}
