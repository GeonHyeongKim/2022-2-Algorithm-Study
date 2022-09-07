// 파일명을 HEAD, NUMBER, TAIL로 분리
func split(_ fileName: String) -> [String] {
    
    var result = ["", "", ""]   // [head, number, tail]
    var index = 0
    
    fileName.forEach {
        
        let letter = String($0)
        
        if (index == 0 && Int(letter) != nil) || (index == 1 && Int(letter) == nil) {
            index += 1
        }
        
        result[index] += letter
    }
    
    return result
}

func solution(_ files:[String]) -> [String] {
    
    var fileNames = files.map { split($0) }
    fileNames.sort {
        
        if $0[0].lowercased() != $1[0].lowercased() {
            return $0[0].lowercased() < $1[0].lowercased()
        }
        
        if Int($0[1])! != Int($1[1]) {
            return Int($0[1])! < Int($1[1])!
        }
        
        return false
    }
    
    
    
    return fileNames.map { $0.joined(separator: "") }
}
