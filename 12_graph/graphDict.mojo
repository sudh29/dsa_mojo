# Graph representation using Adjacency List

struct Graph:
    var adj: List[List[Int]]
    var size: Int

    def __init__(out self, size: Int):
        self.size = size
        self.adj = List[List[Int]]()
        for _ in range(size):
            self.adj.append(List[Int]())

    def add_edge(mut self, u: Int, v: Int):
        self.adj[u].append(v)

    def print_v(self, u: Int):
        print(u, ":", end=" ")
        for i in range(len(self.adj[u])):
            print(self.adj[u][i], end=" ")
        print()

def main():
    var g = Graph(4)
    g.add_edge(0, 1)
    g.add_edge(0, 2)
    g.add_edge(1, 2)
    g.add_edge(2, 0)
    g.add_edge(2, 3)
    g.add_edge(3, 3)

    for i in range(4):
        g.print_v(i)
