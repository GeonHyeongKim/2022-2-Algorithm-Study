/*
*  방금 그곡.swift
*  Question Link: https://school.programmers.co.kr/learn/courses/30/lessons/17683
*  Primary idea:   <key-value>
*                   1. 
*
*  걸린 시간 : 
*  Time Complexity : O()
*  Space Complexity : O()
*  Runtime:  ms
*  Memory Usage:  MB
*/

let convert = ["A#": "a", "B#": "b", "C#": "c", "D#": "d", "E#": "e", "F#": "f", "G#": "g"]

func parsing(music: String) -> (Int,String,String) {

    let m = music.split(separator: ",").map{String($0)}
    var (start, end, title, code) = (m[0], m[1], m[2], m[3]) // 시작, 끝, 제목, 악보

    let s = start.split(separator: ":").map{Int(String($0))!}
    let e = end.split(separator: ":").map{Int(String($0))!}
    let time = (e[0] * 60 + e[1]) - (s[0] * 60 + s[1])

    for (key,value) in convert {
        code = code.replacingOccurrences(of: key, with: value)
    }

    let (div, rem) = (time / code.count, time % code.count) // 몫, 나머지

    code = String(repeating: code, count: div) + String(code[code.startIndex ..< code.index(code.startIndex, offsetBy: rem)])
    return (time,title,code)
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var answer: (title: String, len: Int) = ("(None)", 0)

    var _m = m
    for (k, v) in convert {
        _m = _m.replacingOccurrences(of: k, with: v)
    }

    for music in musicinfos {
        let (len, title, code) = parsing(music: music)
      
        if code.contains(_m) {
            if len > answer.len {
                answer = (title, len)
            }
        }
    }

    return answer.title
}
