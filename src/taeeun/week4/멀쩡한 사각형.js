function solution(w, h) {
    var answer = 1;
    
    const gcd=(a, b)=>{
        const mod=a%b;
        if (mod===0) return b;
        return gcd(b, mod);
    }

    return w*h-(w+h-gcd(w,h));
}
