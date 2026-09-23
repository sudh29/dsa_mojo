# Path of Length Greater than or Equal to K
# Reference: https://mojolang.org/docs/manual/get-started/

struct Edge:
    var dest: Int
    var weight: Int

    def __init__(out self, dest: Int, weight: Int):
        self.dest = dest
        self.weight = weight

def dfs_path(
    u: Int,
    k: Int,
    path_len: Int,
    graph: List[List[Edge]],
    mut visited: List[Bool]
) -> Bool:
    if path_len >= k:
        return True

    visited[u] = True

    for i in range(len(graph[u])):
        var v = graph[u][i].dest
        var w = graph[u][i].weight

        if not visited[v]:
            if dfs_path(v, k, path_len + w, graph, visited):
                return True

    visited[u] = False
    return False

def path_more_than_k(v: Int, k: Int, edges_arr: List[Int]) -> Bool:
    var graph = List[List[Edge]]()
    for _ in range(v):
        graph.append(List[Edge]())

    var i = 0
    while i < len(edges_arr):
        var src = edges_arr[i]
        var dest = edges_arr[i + 1]
        var weight = edges_arr[i + 2]
        graph[src].append(Edge(dest, weight))
        graph[dest].append(Edge(src, weight))
        i += 3

    var visited = List[Bool]()
    for _ in range(v):
        visited.append(False)

    return dfs_path(0, k, 0, graph, visited)

def main():
    var v = 9
    var k = 60
    # Graph edges: [src, dest, weight, ...]
    var edges = List[Int]()
    edges.append(0); edges.append(1); edges.append(4)
    edges.append(0); edges.append(7); edges.append(8)
    edges.append(1); edges.append(2); edges.append(8)
    edges.append(1); edges.append(7); edges.append(11)
    edges.append(2); edges.append(3); edges.append(7)
    edges.append(2); edges.append(8); edges.append(2)
    edges.append(2); edges.append(5); edges.append(4)
    edges.append(3); edges.append(4); edges.append(9)
    edges.append(3); edges.append(5); edges.append(14)
    edges.append(4); edges.append(5); edges.append(10)
    edges.append(5); edges.append(6); edges.append(2)
    edges.append(6); edges.append(7); edges.append(1)
    edges.append(6); edges.append(8); edges.append(6)
    edges.append(7); edges.append(8); edges.append(7)

    print("Path >= 60 exists:", path_more_than_k(v, k, edges))
    print("Path >= 70 exists:", path_more_than_k(v, 70, edges))
