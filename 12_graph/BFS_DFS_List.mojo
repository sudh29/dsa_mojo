# Adjacency List Graph with BFS and DFS

struct ListGraph:
    var names: List[String]
    var adj: List[List[Int]]

    def __init__(out self, var names: List[String]):
        self.adj = List[List[Int]]()
        for _ in range(len(names)):
            self.adj.append(List[Int]())
        self.names = names^

    def get_index(self, name: String) -> Int:
        for i in range(len(self.names)):
            if self.names[i] == name:
                return i
        return -1

    def add_edge(mut self, u_name: String, v_name: String):
        var u = self.get_index(u_name)
        var v = self.get_index(v_name)
        if u != -1 and v != -1:
            self.adj[u].append(v)
            self.adj[v].append(u)

    def print_graph(self):
        for i in range(len(self.names)):
            print(self.names[i], ":", end=" ")
            for j in range(len(self.adj[i])):
                print(self.names[self.adj[i][j]], end=" ")
            print()

    def dfs(self, source_name: String) -> List[String]:
        var res = List[String]()
        var source = self.get_index(source_name)
        if source == -1:
            return res^
            
        var visited = List[Bool]()
        for _ in range(len(self.names)):
            visited.append(False)
            
        var stack = List[Int]()
        stack.append(source)
        visited[source] = True
        
        while len(stack) > 0:
            var v = stack.pop()
            res.append(self.names[v])
            for j in range(len(self.adj[v])):
                var neighbor = self.adj[v][j]
                if not visited[neighbor]:
                    visited[neighbor] = True
                    stack.append(neighbor)
                    
        return res^

    def bfs(self, source_name: String) -> List[String]:
        var res = List[String]()
        var source = self.get_index(source_name)
        if source == -1:
            return res^
            
        var visited = List[Bool]()
        for _ in range(len(self.names)):
            visited.append(False)
            
        var q = List[Int]()
        var head = 0
        q.append(source)
        visited[source] = True
        
        while head < len(q):
            var v = q[head]
            head += 1
            res.append(self.names[v])
            for j in range(len(self.adj[v])):
                var neighbor = self.adj[v][j]
                if not visited[neighbor]:
                    visited[neighbor] = True
                    q.append(neighbor)
                    
        return res^

def main():
    var names = List[String]()
    names.append("A"); names.append("B"); names.append("C"); names.append("D"); names.append("E"); names.append("F")
    var g = ListGraph(names^)
    
    g.add_edge("A", "B")
    g.add_edge("A", "C")
    g.add_edge("B", "D")
    g.add_edge("C", "E")
    g.add_edge("E", "B")
    g.add_edge("D", "E")
    g.add_edge("D", "F")
    g.add_edge("E", "F")
    
    print("Graph:")
    g.print_graph()
    
    var dfs_path = g.dfs("A")
    print("DFS from A:", end=" ")
    for i in range(len(dfs_path)):
        print(dfs_path[i], end=" ")
    print()
    
    var bfs_path = g.bfs("A")
    print("BFS from A:", end=" ")
    for i in range(len(bfs_path)):
        print(bfs_path[i], end=" ")
    print()
