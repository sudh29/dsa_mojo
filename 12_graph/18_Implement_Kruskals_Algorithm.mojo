# Kruskal's Minimum Spanning Tree Algorithm

struct Edge(ImplicitlyCopyable, Movable):
    var u: Int
    var v: Int
    var weight: Int

    def __init__(out self, u: Int, v: Int, weight: Int):
        self.u = u
        self.v = v
        self.weight = weight

    def __init__(out self, *, copy: Edge):
        self.u = copy.u
        self.v = copy.v
        self.weight = copy.weight

struct DSU:
    var parent: List[Int]
    var rank: List[Int]

    def __init__(out self, n: Int):
        self.parent = List[Int]()
        self.rank = List[Int]()
        for i in range(n):
            self.parent.append(i)
            self.rank.append(0)

    def find(mut self, i: Int) -> Int:
        var curr = i
        while self.parent[curr] != curr:
            curr = self.parent[curr]
        return curr

    def union_set(mut self, i: Int, j: Int) -> Bool:
        var root_i = self.find(i)
        var root_j = self.find(j)
        if root_i != root_j:
            if self.rank[root_i] < self.rank[root_j]:
                self.parent[root_i] = root_j
            elif self.rank[root_i] > self.rank[root_j]:
                self.parent[root_j] = root_i
            else:
                self.parent[root_j] = root_i
                self.rank[root_i] += 1
            return True
        return False

def sort_edges(mut edges: List[Edge]):
    for i in range(len(edges)):
        for j in range(i + 1, len(edges)):
            if edges[j].weight < edges[i].weight:
                var temp = edges[i]
                edges[i] = edges[j]
                edges[j] = temp

def kruskal_mst(v: Int, mut edges: List[Edge]) -> Int:
    sort_edges(edges)
    var dsu = DSU(v)
    var mst_weight = 0
    var edges_count = 0
    
    for i in range(len(edges)):
        var edge = edges[i]
        if dsu.union_set(edge.u, edge.v):
            mst_weight += edge.weight
            edges_count += 1
            if edges_count == v - 1:
                break
                
    return mst_weight

def main():
    var v = 3
    var edges = List[Edge]()
    edges.append(Edge(0, 1, 5))
    edges.append(Edge(1, 2, 3))
    edges.append(Edge(0, 2, 1))
    
    print("Kruskal's MST weight:", kruskal_mst(v, edges))
