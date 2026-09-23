# Create Graph and Print Adjacency List

struct Edge(ImplicitlyCopyable, Movable):
    var v: Int
    var dist: Int

    def __init__(out self, v: Int, dist: Int):
        self.v = v
        self.dist = dist

    def __init__(out self, *, copy: Edge):
        self.v = copy.v
        self.dist = copy.dist

struct Graph:
    var adj: List[List[Edge]]
    var size: Int

    def __init__(out self, size: Int):
        self.size = size
        self.adj = List[List[Edge]]()
        for _ in range(size):
            self.adj.append(List[Edge]())

    def add_edge(mut self, u: Int, v: Int, dist: Int, bidirec: Bool = True):
        self.adj[u].append(Edge(v, dist))
        if bidirec:
            self.adj[v].append(Edge(u, dist))

    def print_adj(self):
        for u in range(self.size):
            print(u, ":", end=" ")
            for i in range(len(self.adj[u])):
                var edge = self.adj[u][i]
                print("(", edge.v, ",", edge.dist, ")", end=" ")
            print()

def main():
    var g = Graph(9)
    g.add_edge(0, 1, 4, False)
    g.add_edge(0, 7, 8, False)
    g.add_edge(1, 7, 11, False)
    g.add_edge(1, 2, 8, False)
    g.add_edge(7, 8, 7, False)
    g.add_edge(2, 8, 2, False)
    g.add_edge(8, 6, 6, False)
    g.add_edge(2, 5, 4, False)
    g.add_edge(6, 5, 2, False)
    g.add_edge(2, 3, 7, False)
    g.add_edge(3, 4, 9, False)
    g.add_edge(5, 4, 10, False)
    g.add_edge(7, 6, 1, False)
    g.print_adj()
