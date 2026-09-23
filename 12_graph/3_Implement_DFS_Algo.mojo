# DFS Traversal of Graph

def solve_dfs(val: Int, mut visited: List[Bool], adj: List[List[Int]], mut ans: List[Int]):
    visited[val] = True
    ans.append(val)
    for i in range(len(adj[val])):
        var neighbor = adj[val][i]
        if not visited[neighbor]:
            solve_dfs(neighbor, visited, adj, ans)

def dfs_of_graph(v: Int, adj: List[List[Int]]) -> List[Int]:
    var res = List[Int]()
    if v < 1:
        return res^
    var visited = List[Bool]()
    for _ in range(v):
        visited.append(False)
    solve_dfs(0, visited, adj, res)
    return res^

def main():
    var v = 5
    var adj = List[List[Int]]()
    for _ in range(v):
        adj.append(List[Int]())
        
    adj[0].append(2); adj[0].append(3); adj[0].append(1)
    adj[1].append(0)
    adj[2].append(0); adj[2].append(4)
    adj[3].append(0)
    adj[4].append(2)
    
    var traversal = dfs_of_graph(v, adj)
    print("DFS Traversal:", end=" ")
    for i in range(len(traversal)):
        print(traversal[i], end=" ")
    print()
