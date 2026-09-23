# M-Coloring Problem

def is_color_valid(node: Int, graph: List[List[Int]], color: List[Int], c: Int, v: Int) -> Bool:
    for i in range(v):
        if graph[node][i] == 1 and color[i] == c:
            return False
    return True

def solve_coloring(node: Int, m: Int, mut color: List[Int], graph: List[List[Int]], v: Int) -> Bool:
    if node == v:
        return True
        
    for c in range(1, m + 1):
        if is_color_valid(node, graph, color, c, v):
            color[node] = c
            if solve_coloring(node + 1, m, color, graph, v):
                return True
            color[node] = 0
            
    return False

def graph_coloring(graph: List[List[Int]], m: Int, v: Int) -> Int:
    var color = List[Int]()
    for _ in range(v):
        color.append(0)
        
    if solve_coloring(0, m, color, graph, v):
        return 1
    return 0

def main():
    var v = 4
    var m = 3
    var graph = List[List[Int]]()
    for _ in range(v):
        var row = List[Int]()
        for _ in range(v):
            row.append(0)
        graph.append(row^)
        
    # (0,1), (1,2), (2,3), (3,0), (0,2)
    graph[0][1] = 1; graph[1][0] = 1
    graph[1][2] = 1; graph[2][1] = 1
    graph[2][3] = 1; graph[3][2] = 1
    graph[3][0] = 1; graph[0][3] = 1
    graph[0][2] = 1; graph[2][0] = 1
    
    print("Graph 3-colorable:", graph_coloring(graph, m, v))
