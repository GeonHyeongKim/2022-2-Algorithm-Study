function solution(files) {
    let head=/^\D+/;
    let num=/\d+/;
    files.sort((a, b)=>{
        //exec은 regular expression과 일치하는 배열의 정보를 담고 있음
        //가장 첫번째 원소가 일치하는 문자열
        //1. head 기준으로 정렬
        let headA=head.exec(a)[0].toLowerCase();
        let headB=head.exec(b)[0].toLowerCase();
        if (headA>headB) return 1;
        else if (headA<headB)return -1;
        //2. head가 같다면 숫자 기준으로 정렬
        else{
            let numA=a.match(num);
            let numB=b.match(num);
            return numA-numB;
        }
    })
    return files;
}
