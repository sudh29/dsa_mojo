# DFS and BFS using explicit Stack and Queue

def bfs(graph: List[List[Int]], start: Int, n: Int) -> List[Int]:
    var res = List[Int]()
    var visited = List[Bool]()
    for _ in range(n):
        visited.append(False)
        
    var q = List[Int]()
    var head = 0
    q.append(start)
    visited[start] = True
    
    while head < len(q):
        var vertex = q[head]
        head += 1
        res.append(vertex)
        for i in range(len(graph[vertex])):
            var neighbor = graph[vertex][i]
            if not visited[neighbor]:
                visited[neighbor] = True
                q.append(neighbor)
                
    return res^

def dfs(graph: List[List[Int]], start: Int, n: Int) -> List[Int]:
    var res = List[Int]()
    var visited = List[Bool]()
    for _ in range(n):
        visited.append(False)
        
    var stack = List[Int]()
    stack.append(start)
    visited[start] = True
    
    while len(stack) > 0:
        var vertex = stack.pop()
        res.append(vertex)
        for i in range(len(graph[vertex])):
            var neighbor = graph[vertex][i]
            if not visited[neighbor]:
                visited[neighbor] = True
                stack.append(neighbor)
                
    return res^

def main():
    var n = 5
    var graph = List[List[Int]]()
    for _ in range(n):
        graph.append(List[Int]())
        
    # 0: 1, 2
    graph[0].append(1); graph[0].append(2)
    # 1: 0, 3, 4
    graph[1].append(0); graph[1].append(3); graph[1].append(4)
    # 2: 0, 4
    graph[2].append(0); graph[2].append(4)
    # 3: 1, 4
    graph[3].append(1); graph[3].append(4)
    # 4: 1, 2, 3
    graph[4].append(1); graph[4].append(2); graph[4].append(3)
    
    var bfs_res = bfs(graph, 0, n)
    print("BFS:", end=" ")
    for i in range(len(bfs_res)):
        print(bfs_res[i], end=" ")
    print()
    
    var dfs_res = dfs(graph, 0, n)
    print("DFS:", end=" ")
    for i in range(len(dfs_res)):
        print(dfs_res[i], end=" ")
    print()
