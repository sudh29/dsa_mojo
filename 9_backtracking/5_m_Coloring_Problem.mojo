# m-Coloring Problem (Graph Coloring)
# Reference: https://mojolang.org/docs/manual/get-started/

def is_safe_color(
    node: Int,
    color_choice: Int,
    color: List[Int],
    graph: List[List[Int]],
    v: Int
) -> Bool:
    for i in range(v):
        if graph[node][i] == 1 and color[i] == color_choice:
            return False
    return True

def graph_coloring_util(
    node: Int,
    m: Int,
    mut color: List[Int],
    graph: List[List[Int]],
    v: Int
) -> Bool:
    if node == v:
        return True

    for c in range(1, m + 1):
        if is_safe_color(node, c, color, graph, v):
            color[node] = c
            if graph_coloring_util(node + 1, m, color, graph, v):
                return True
            color[node] = 0

    return False

def graph_coloring(graph: List[List[Int]], m: Int, v: Int) -> Bool:
    var color = List[Int]()
    for _ in range(v):
        color.append(0)

    return graph_coloring_util(0, m, color, graph, v)

def main():
    var v = 4
    var m = 3
    var graph = List[List[Int]]()
    for _ in range(v):
        var row = List[Int]()
        for _ in range(v):
            row.append(0)
        graph.append(row^)

    # 4-node graph:
    # (0)-(1), (1)-(2), (2)-(3), (3)-(0), (0)-(2)
    graph[0][1] = 1; graph[1][0] = 1
    graph[1][2] = 1; graph[2][1] = 1
    graph[2][3] = 1; graph[3][2] = 1
    graph[3][0] = 1; graph[0][3] = 1
    graph[0][2] = 1; graph[2][0] = 1

    var can_color = graph_coloring(graph, m, v)
    print("Can 4-node graph be colored with", m, "colors:", can_color)
