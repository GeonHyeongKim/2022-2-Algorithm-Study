/*
*  문자열 압축.py
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/60057
*  Primary idea:   <key-value>
*                   1. 
*
*  걸린 시간 : 05:10, 34:11
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

def solution(s):
    len_list = []
    res = ""

    if len(s) == 1:
        return 1
    
    for cut in range(1, len(s) // 2 + 1):
        cnt = 1
        str_by_cut = s[:cut]
        
        for i in range(cut, len(s), cut):
            if s[i:i+cut] == str_by_cut:
                cnt += 1
            else:
                if cnt == 1:
                    cnt = ""
                res += str(cnt) + str_by_cut
                str_by_cut = s[i:i+cut]
                cnt = 1
    
        if cnt == 1:
            cnt = ""
        res += str(cnt) + str_by_cut
        len_list.append(len(res))
        res = ""

    return min(len_list)
