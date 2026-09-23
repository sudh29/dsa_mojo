# Clone a Graph

struct Node(Movable):
    var val: Int
    var neighbors: List[Int]

    def __init__(out self, val: Int):
        self.val = val
        self.neighbors = List[Int]()

struct GraphArena(Movable):
    var nodes: List[Node]

    def __init__(out self):
        self.nodes = List[Node]()

    def add_node(mut self, val: Int) -> Int:
        self.nodes.append(Node(val))
        return len(self.nodes) - 1

    def add_neighbor(mut self, u: Int, v: Int):
        self.nodes[u].neighbors.append(v)

def clone_graph(arena: GraphArena, n: Int) -> GraphArena:
    var cloned = GraphArena()
    for i in range(n):
        _ = cloned.add_node(arena.nodes[i].val)
        
    for i in range(n):
        for j in range(len(arena.nodes[i].neighbors)):
            var neigh = arena.nodes[i].neighbors[j]
            cloned.add_neighbor(i, neigh)
            
    return cloned^

def main():
    var arena = GraphArena()
    var n0 = arena.add_node(1)
    var n1 = arena.add_node(2)
    var n2 = arena.add_node(3)
    var n3 = arena.add_node(4)
    
    arena.add_neighbor(n0, n1); arena.add_neighbor(n0, n3)
    arena.add_neighbor(n1, n0); arena.add_neighbor(n1, n2)
    arena.add_neighbor(n2, n1); arena.add_neighbor(n2, n3)
    arena.add_neighbor(n3, n0); arena.add_neighbor(n3, n2)
    
    var cloned = clone_graph(arena, 4)
    print("Original nodes count:", len(arena.nodes))
    print("Cloned nodes count:", len(cloned.nodes))
    for i in range(len(cloned.nodes)):
        print("Node", cloned.nodes[i].val, "neighbors count:", len(cloned.nodes[i].neighbors))
