# Populate Inorder Successor for all nodes
# Reference: https://mojolang.org/docs/manual/get-started/

struct TreeNode:
    var val: Int
    var left: Int
    var right: Int
    var next: Int

    def __init__(out self, val: Int, left: Int = -1, right: Int = -1, next: Int = -1):
        self.val = val
        self.left = left
        self.right = right
        self.next = next

struct TreeArena:
    var nodes: List[TreeNode]

    def __init__(out self):
        self.nodes = List[TreeNode]()

    def add_node(mut self, val: Int, left: Int = -1, right: Int = -1) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(TreeNode(val, left, right, -1))
        return idx

    # Reverse inorder traversal: Right -> Node -> Left
    def populate_next_util(mut self, root: Int, mut next_ptr: Int):
        if root == -1:
            return

        self.populate_next_util(self.nodes[root].right, next_ptr)

        self.nodes[root].next = next_ptr
        next_ptr = root

        self.populate_next_util(self.nodes[root].left, next_ptr)

    def populate_next(mut self, root: Int):
        var next_ptr = -1
        self.populate_next_util(root, next_ptr)

    def get_leftmost(self, root: Int) -> Int:
        var curr = root
        while curr != -1 and self.nodes[curr].left != -1:
            curr = self.nodes[curr].left
        return curr

def main():
    var arena = TreeArena()
    # Tree:
    #        10
    #       /  \
    #      8   12
    #     /
    #    3
    var n3 = arena.add_node(3)
    var n8 = arena.add_node(8, n3, -1)
    var n12 = arena.add_node(12)
    var root = arena.add_node(10, n8, n12)

    arena.populate_next(root)

    # Print in order of successor pointers starting from leftmost node
    var curr = arena.get_leftmost(root)
    print("Inorder successor chain:", end=" [")
    while curr != -1:
        print(arena.nodes[curr].val, end="")
        curr = arena.nodes[curr].next
        if curr != -1:
            print(" -> ", end="")
    print("]")
