# BFS Traversal of Graph

def bfs_of_graph(v: Int, adj: List[List[Int]]) -> List[Int]:
    var res = List[Int]()
    if v < 1:
        return res^
        
    var visited = List[Bool]()
    for _ in range(v):
        visited.append(False)
        
    var q = List[Int]()
    var head = 0
    q.append(0)
    visited[0] = True
    
    while head < len(q):
        var value = q[head]
        head += 1
        res.append(value)
        for i in range(len(adj[value])):
            var neighbor = adj[value][i]
            if not visited[neighbor]:
                q.append(neighbor)
                visited[neighbor] = True
                
    return res^

def main():
    var v = 5
    var adj = List[List[Int]]()
    for _ in range(v):
        adj.append(List[Int]())
        
    adj[0].append(1); adj[0].append(2); adj[0].append(3)
    adj[2].append(4)
    
    var traversal = bfs_of_graph(v, adj)
    print("BFS Traversal:", end=" ")
    for i in range(len(traversal)):
        print(traversal[i], end=" ")
    print()
