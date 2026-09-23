# Topological Sort using DFS

def dfs_topo(v: Int, mut visited: List[Bool], mut stack: List[Int], adj: List[List[Int]]):
    visited[v] = True
    for i in range(len(adj[v])):
        var neighbor = adj[v][i]
        if not visited[neighbor]:
            dfs_topo(neighbor, visited, stack, adj)
    stack.append(v)

def topological_sort(v: Int, adj: List[List[Int]]) -> List[Int]:
    var visited = List[Bool]()
    for _ in range(v):
        visited.append(False)
        
    var stack = List[Int]()
    for i in range(v):
        if not visited[i]:
            dfs_topo(i, visited, stack, adj)
            
    var res = List[Int]()
    var idx = len(stack) - 1
    while idx >= 0:
        res.append(stack[idx])
        idx -= 1
        
    return res^

def main():
    var v = 6
    var adj = List[List[Int]]()
    for _ in range(v):
        adj.append(List[Int]())

    adj[5].append(2)
    adj[5].append(0)
    adj[4].append(0)
    adj[4].append(1)
    adj[2].append(3)
    adj[3].append(1)

    var order = topological_sort(v, adj)
    print("Topological Sort Order:", end=" ")
    for i in range(len(order)):
        print(order[i], end=" ")
    print()
