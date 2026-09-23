# Minimum time taken by each job to be completed given by a Directed Acyclic Graph

def minimum_time(n: Int, m: Int, edges: List[List[Int]]) -> List[Int]:
    var adj = List[List[Int]]()
    for _ in range(n + 1):
        adj.append(List[Int]())
        
    for i in range(m):
        var u = edges[i][0]
        var v = edges[i][1]
        adj[u].append(v)
        
    var indegree = List[Int]()
    for _ in range(n + 1):
        indegree.append(0)
        
    for i in range(1, n + 1):
        for j in range(len(adj[i])):
            indegree[adj[i][j]] += 1
            
    var q = List[Int]()
    var head = 0
    var ans = List[Int]()
    for _ in range(n + 1):
        ans.append(0)
        
    for i in range(1, n + 1):
        if indegree[i] == 0:
            q.append(i)
            ans[i] = 1
            
    while head < len(q):
        var node = q[head]
        head += 1
        for j in range(len(adj[node])):
            var val = adj[node][j]
            indegree[val] -= 1
            if indegree[val] == 0:
                q.append(val)
                ans[val] = ans[node] + 1
                
    var res = List[Int]()
    for i in range(1, n + 1):
        res.append(ans[i])
    return res^

def main():
    var n = 10
    var m = 13
    var edges = List[List[Int]]()
    # 1 3, 1 4, 1 5, 2 3, 2 8, 2 9, 3 6, 4 6, 4 8, 5 8, 6 7, 7 8, 8 10
    var e_raw = List[Int]()
    e_raw.append(1); e_raw.append(3)
    e_raw.append(1); e_raw.append(4)
    e_raw.append(1); e_raw.append(5)
    e_raw.append(2); e_raw.append(3)
    e_raw.append(2); e_raw.append(8)
    e_raw.append(2); e_raw.append(9)
    e_raw.append(3); e_raw.append(6)
    e_raw.append(4); e_raw.append(6)
    e_raw.append(4); e_raw.append(8)
    e_raw.append(5); e_raw.append(8)
    e_raw.append(6); e_raw.append(7)
    e_raw.append(7); e_raw.append(8)
    e_raw.append(8); e_raw.append(10)
    
    var idx = 0
    while idx < len(e_raw):
        var edge = List[Int]()
        edge.append(e_raw[idx])
        edge.append(e_raw[idx + 1])
        edges.append(edge^)
        idx += 2
        
    var times = minimum_time(n, m, edges)
    print("Minimum time for each job:")
    for i in range(len(times)):
        print("Job", i + 1, ":", times[i])
