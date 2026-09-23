# Create Graph representation

def print_graph(v: Int, edges: List[List[Int]]) -> List[List[Int]]:
    var res = List[List[Int]]()
    for _ in range(v):
        res.append(List[Int]())
        
    for i in range(len(edges)):
        var u = edges[i][0]
        var w = edges[i][1]
        res[u].append(w)
        res[w].append(u)
        
    return res^

def main():
    var v = 5
    var edges = List[List[Int]]()
    
    var e0 = List[Int](); e0.append(0); e0.append(1); edges.append(e0^)
    var e1 = List[Int](); e1.append(0); e1.append(4); edges.append(e1^)
    var e2 = List[Int](); e2.append(1); e2.append(2); edges.append(e2^)
    var e3 = List[Int](); e3.append(1); e3.append(3); edges.append(e3^)
    var e4 = List[Int](); e4.append(1); e4.append(4); edges.append(e4^)
    var e5 = List[Int](); e5.append(2); e5.append(3); edges.append(e5^)
    var e6 = List[Int](); e6.append(3); e6.append(4); edges.append(e6^)
    
    var adj = print_graph(v, edges)
    for i in range(v):
        print(i, ":", end=" ")
        for j in range(len(adj[i])):
            print(adj[i][j], end=" ")
        print()
