# Largest Independent Set Problem (Tree DP)

struct Node(ImplicitlyCopyable, Movable):
    var val: Int
    var left: Int
    var right: Int

    def __init__(out self, val: Int, left: Int = -1, right: Int = -1):
        self.val = val
        self.left = left
        self.right = right

    def __init__(out self, *, copy: Node):
        self.val = copy.val
        self.left = copy.left
        self.right = copy.right

struct TreeArena:
    var nodes: List[Node]

    def __init__(out self):
        self.nodes = List[Node]()

    def add_node(mut self, val: Int, left: Int = -1, right: Int = -1) -> Int:
        self.nodes.append(Node(val, left, right))
        return len(self.nodes) - 1

def liss(arena: TreeArena, root: Int) -> Int:
    if root == -1:
        return 0
    var node = arena.nodes[root]
    var size_excl = liss(arena, node.left) + liss(arena, node.right)
    var size_incl = 1
    if node.left != -1:
        var l = arena.nodes[node.left]
        size_incl += liss(arena, l.left) + liss(arena, l.right)
    if node.right != -1:
        var r = arena.nodes[node.right]
        size_incl += liss(arena, r.left) + liss(arena, r.right)
    return size_incl if size_incl > size_excl else size_excl

def main():
    var arena = TreeArena()
    # Tree:
    #         20
    #        /  \
    #       8    22
    #      / \     \
    #     4   12    25
    #        /  \
    #       10   14
    var n10 = arena.add_node(10)
    var n14 = arena.add_node(14)
    var n4 = arena.add_node(4)
    var n12 = arena.add_node(12, n10, n14)
    var n25 = arena.add_node(25)
    var n8 = arena.add_node(8, n4, n12)
    var n22 = arena.add_node(22, -1, n25)
    var root = arena.add_node(20, n8, n22)
    
    print("Largest Independent Set Size:", liss(arena, root))
