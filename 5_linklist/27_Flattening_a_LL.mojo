# Flattening a Linked List with next and bottom pointers
# Reference: https://mojolang.org/docs/manual/get-started/

struct FlatNode:
    var data: Int
    var next: Int
    var bottom: Int

    def __init__(out self, data: Int, next: Int = -1, bottom: Int = -1):
        self.data = data
        self.next = next
        self.bottom = bottom

struct FlatArena:
    var nodes: List[FlatNode]

    def __init__(out self):
        self.nodes = List[FlatNode]()

    def add_node(mut self, data: Int, next: Int = -1, bottom: Int = -1) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(FlatNode(data, next, bottom))
        return idx

    def merge_bottom(mut self, a: Int, b: Int) -> Int:
        if a == -1:
            return b
        if b == -1:
            return a

        var res = -1
        if self.nodes[a].data < self.nodes[b].data:
            res = a
            self.nodes[res].bottom = self.merge_bottom(self.nodes[a].bottom, b)
        else:
            res = b
            self.nodes[res].bottom = self.merge_bottom(a, self.nodes[b].bottom)

        return res^

    def flatten(mut self, root: Int) -> Int:
        if root == -1 or self.nodes[root].next == -1:
            return root

        var next_root = self.flatten(self.nodes[root].next)
        var merged = self.merge_bottom(root, next_root)
        return merged

    def print_bottom_list(self, root: Int):
        var curr = root
        print("[", end="")
        while curr != -1:
            print(self.nodes[curr].data, end="" if self.nodes[curr].bottom == -1 else " -> ")
            curr = self.nodes[curr].bottom
        print("]")

def main():
    var arena = FlatArena()

    # List 1: 5 -> 7 -> 8 -> 30
    var n30 = arena.add_node(30)
    var n8 = arena.add_node(8, -1, n30)
    var n7 = arena.add_node(7, -1, n8)
    var n5 = arena.add_node(5, -1, n7)

    # List 2: 10 -> 20
    var n20 = arena.add_node(20)
    var n10 = arena.add_node(10, -1, n20)

    # List 3: 19 -> 22 -> 50
    var n50 = arena.add_node(50)
    var n22 = arena.add_node(22, -1, n50)
    var n19 = arena.add_node(19, -1, n22)

    # List 4: 28 -> 35 -> 40 -> 45
    var n45 = arena.add_node(45)
    var n40 = arena.add_node(40, -1, n45)
    var n35 = arena.add_node(35, -1, n40)
    var n28 = arena.add_node(28, -1, n35)

    # Connect horizontally
    arena.nodes[n5].next = n10
    arena.nodes[n10].next = n19
    arena.nodes[n19].next = n28

    var flat_head = arena.flatten(n5)
    print("Flattened List:")
    arena.print_bottom_list(flat_head)
