# Dijkstra's Shortest Path Algorithm

struct Edge(ImplicitlyCopyable, Movable):
    var to: Int
    var weight: Int

    def __init__(out self, to: Int, weight: Int):
        self.to = to
        self.weight = weight

    def __init__(out self, *, copy: Edge):
        self.to = copy.to
        self.weight = copy.weight

def dijkstra(v: Int, adj: List[List[Edge]], s: Int) -> List[Int]:
    var inf = 1000000000
    var dist = List[Int]()
    var visited = List[Bool]()
    for _ in range(v):
        dist.append(inf)
        visited.append(False)
        
    dist[s] = 0
    
    for _ in range(v):
        var min_d = inf
        var u = -1
        for i in range(v):
            if not visited[i] and dist[i] < min_d:
                min_d = dist[i]
                u = i
                
        if u == -1:
            break
            
        visited[u] = True
        
        for i in range(len(adj[u])):
            var edge = adj[u][i]
            var to_node = edge.to
            var w = edge.weight
            if not visited[to_node] and dist[u] + w < dist[to_node]:
                dist[to_node] = dist[u] + w
                
    return dist^

def main():
    var v = 3
    var adj = List[List[Edge]]()
    for _ in range(v):
        adj.append(List[Edge]())
        
    adj[0].append(Edge(1, 1))
    adj[0].append(Edge(2, 6))
    adj[1].append(Edge(2, 3))
    adj[1].append(Edge(0, 1))
    adj[2].append(Edge(1, 3))
    adj[2].append(Edge(0, 6))
    
    var distances = dijkstra(v, adj, 2)
    print("Distances from source 2:")
    for i in range(v):
        print("To node", i, ":", distances[i])
