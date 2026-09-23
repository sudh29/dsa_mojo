# Number of Operations to Make Network Connected

def solve_dfs(val: Int, adj: List[List[Int]], mut visited: List[Bool]):
    visited[val] = True
    for i in range(len(adj[val])):
        var neighbor = adj[val][i]
        if not visited[neighbor]:
            solve_dfs(neighbor, adj, visited)

def make_connected(n: Int, connections: List[List[Int]]) -> Int:
    var m = len(connections)
    if m < n - 1:
        return -1
        
    var graph = List[List[Int]]()
    for _ in range(n):
        graph.append(List[Int]())
        
    for i in range(m):
        var u = connections[i][0]
        var v = connections[i][1]
        graph[u].append(v)
        graph[v].append(u)
        
    var visited = List[Bool]()
    for _ in range(n):
        visited.append(False)
        
    var components = 0
    for i in range(n):
        if not visited[i]:
            components += 1
            solve_dfs(i, graph, visited)
            
    return components - 1

def main():
    var n = 4
    var conns = List[List[Int]]()
    var c0 = List[Int](); c0.append(0); c0.append(1); conns.append(c0^)
    var c1 = List[Int](); c1.append(0); c1.append(2); conns.append(c1^)
    var c2 = List[Int](); c2.append(1); c2.append(2); conns.append(c2^)
    print("Min operations to connect network:", make_connected(n, conns))
