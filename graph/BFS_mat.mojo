# Adjacency Matrix Graph Class with BFS

struct MatrixGraph:
    var size: Int
    var data: List[List[Int]]

    def __init__(out self, size: Int):
        self.size = size
        self.data = List[List[Int]]()
        for _ in range(size):
            var row = List[Int]()
            for _ in range(size):
                row.append(0)
            self.data.append(row^)

    def add_edge(mut self, u: Int, v: Int):
        self.data[u][v] = 1

    def print_graph(self):
        for i in range(self.size):
            for j in range(self.size):
                print(self.data[i][j], end=" ")
            print()

    def bfs(self, source: Int) -> List[Int]:
        var path = List[Int]()
        var visited = List[Bool]()
        for _ in range(self.size):
            visited.append(False)
            
        var q = List[Int]()
        var head = 0
        q.append(source)
        visited[source] = True
        
        while head < len(q):
            var v = q[head]
            head += 1
            path.append(v)
            for i in range(self.size):
                if not visited[i] and self.data[v][i] == 1:
                    visited[i] = True
                    q.append(i)
                    
        return path^

def main():
    var g = MatrixGraph(8)
    g.add_edge(0, 1)
    g.add_edge(0, 2)
    g.add_edge(0, 3)
    g.add_edge(1, 4)
    g.add_edge(1, 5)
    g.add_edge(2, 6)
    g.add_edge(2, 7)
    g.add_edge(3, 7)
    
    print("Matrix Graph:")
    g.print_graph()
    
    var path = g.bfs(0)
    print("BFS Traversal:", end=" ")
    for i in range(len(path)):
        print(path[i], end=" ")
    print()
