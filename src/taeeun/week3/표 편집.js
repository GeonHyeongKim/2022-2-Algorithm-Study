function solution(n, k, cmd) {
    let answer=new Array(n).fill('O');
    
    const Node = function(idx, prev) {
        this.idx=idx;
        this.prev=prev;
        this.next=null;
    }
    
    let prevNode= new Node(0);
    let current=prevNode;
    
    //연결리스트 생성
    for (let i=1; i<n; i++) {
        const nextNode = new Node(i, prevNode);
        prevNode.next=nextNode;
        prevNode=nextNode;
        if (i===k) current=nextNode;
    }
    
    const deletedNodes=[];
    
    const deleteNode=()=>{
        const prev=current.prev;
        const next=current.next;
        
        deletedNodes.push(current);
        
        current = next ? next : prev;
        if (prev) prev.next=next;
        if (next) next.prev=prev;
    }
    
    const recoverNode=()=>{
        const recoveredNode = deletedNodes.pop();
        const prev = recoveredNode.prev;
        const next = recoveredNode.next;
        
        if (prev) prev.next=recoveredNode;
        if (next) next.prev=recoveredNode;
    }
    
    for (const c of cmd) {
        const [command, num] = c.split(' ');
        let i=0;
        switch(command) {
            case 'U':
                while (i<num && current.prev) {
                    i++;
                    current=current.prev;
                }
                break;
            case 'D':
                while (i<num && current.next) {
                    i++;
                    current=current.next;
                }
                break;
            case 'Z':
                recoverNode();
                break;
            case 'C': 
                deleteNode(); 
                break;
        }
    }
    
    deletedNodes.map((node)=>answer[node.idx]='X');

    return answer.join('');
}
