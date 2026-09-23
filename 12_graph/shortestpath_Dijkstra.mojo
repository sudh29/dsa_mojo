# Dijkstra's Shortest Path to Destination

struct Edge(ImplicitlyCopyable, Movable):
    var to: Int
    var cost: Int

    def __init__(out self, to: Int, cost: Int):
        self.to = to
        self.cost = cost

    def __init__(out self, *, copy: Edge):
        self.to = copy.to
        self.cost = copy.cost

def shortest_path_dijkstra(v: Int, adj: List[List[Edge]], src: Int, dest: Int) -> Int:
    var inf = 1000000000
    var dist = List[Int]()
    var visited = List[Bool]()
    for _ in range(v):
        dist.append(inf)
        visited.append(False)

    dist[src] = 0
    for _ in range(v):
        var min_d = inf
        var u = -1
        for i in range(v):
            if not visited[i] and dist[i] < min_d:
                min_d = dist[i]
                u = i
        if u == -1:
            break
        if u == dest:
            return dist[dest]
        visited[u] = True
        for j in range(len(adj[u])):
            var edge = adj[u][j]
            var to_node = edge.to
            var w = edge.cost
            if not visited[to_node] and dist[u] + w < dist[to_node]:
                dist[to_node] = dist[u] + w

    return dist[dest]

def main():
    # Map nodes: a=0, b=1, c=2, d=3, e=4, f=5
    var v = 6
    var adj = List[List[Edge]]()
    for _ in range(v):
        adj.append(List[Edge]())

    adj[0].append(Edge(1, 4)) # a -> b (4)
    adj[0].append(Edge(2, 2)) # a -> c (2)
    adj[1].append(Edge(2, 5)) # b -> c (5)
    adj[1].append(Edge(3, 10))# b -> d (10)
    adj[2].append(Edge(4, 3)) # c -> e (3)
    adj[3].append(Edge(5, 11))# d -> f (11)
    adj[4].append(Edge(3, 4)) # e -> d (4)

    var cost = shortest_path_dijkstra(v, adj, 0, 3) # a to d
    print("Shortest path cost from a to d:", cost)
