# Detect Cycle in an Undirected Graph

def dfs_cycle_undirected(val: Int, adj: List[List[Int]], mut visited: List[Bool], parent: Int) -> Bool:
    visited[val] = True
    for i in range(len(adj[val])):
        var neighbor = adj[val][i]
        if not visited[neighbor]:
            if dfs_cycle_undirected(neighbor, adj, visited, val):
                return True
        elif neighbor != parent:
            return True
    return False

def is_cycle_undirected(v: Int, adj: List[List[Int]]) -> Bool:
    var visited = List[Bool]()
    for _ in range(v):
        visited.append(False)
        
    for i in range(v):
        if not visited[i]:
            if dfs_cycle_undirected(i, adj, visited, -1):
                return True
                
    return False

def main():
    var v = 5
    var adj = List[List[Int]]()
    for _ in range(v):
        adj.append(List[Int]())
        
    # 0 - 1 - 2 - 0 (cycle)
    adj[0].append(1); adj[1].append(0)
    adj[1].append(2); adj[2].append(1)
    adj[2].append(0); adj[0].append(2)
    adj[2].append(3); adj[3].append(2)
    
    print("Is undirected graph cyclic:", is_cycle_undirected(v, adj))
