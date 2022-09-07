import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var genreGroup: [String:[Int:Int]] = [:]
    
    // [Genre:[id:plays]]로 정리
    // genreGroup = ["classic": [3: 800, 0: 500, 2: 150], "pop": [4: 2500, 1: 600]]
    for id in 0...genres.count-1 {
        
        if genreGroup[genres[id]] == nil {
            genreGroup[genres[id]] = [id:plays[id]]
        } else {
            genreGroup[genres[id]]![id] = plays[id]
        }
    }
    
    // [Genre: 장르 총 재생횟수]로 정리
    // genreSum = ["pop": 3100, "classic": 1450]
    var genreSum: [String:Int] = [:]
    for genre in genreGroup {
        var sum = 0
        for music in genre.value {
            sum += music.value
        }
        genreSum[genre.key] = sum
    }
    
    // 장르 총 재생횟수에 따라 정렬
    // genreRank = [(key: "pop", value: 3100), (key: "classic", value: 1450)]
    let genreRank = genreSum.sorted {
        $0.1 > $1.1
    }

    // 재생 횟수가 많은 장르부터, 가장 많이 재생된 곡 2개 append
    var result: [Int] = []
    for genre in genreRank {
        
        let sortedId = genreGroup[genre.key]!.sorted { $0.0 < $1.0 }.sorted { $0.1 > $1.1 }
        if sortedId.count > 0 { result.append(sortedId[0].key) }
        if sortedId.count > 1 { result.append(sortedId[1].key) }
    }

    return result
}
