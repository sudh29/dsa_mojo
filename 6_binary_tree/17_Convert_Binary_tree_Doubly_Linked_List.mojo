# Convert Binary Tree to Doubly Linked List
# Reference: https://mojolang.org/docs/manual/get-started/

struct TreeNode:
    var val: Int
    var left: Int
    var right: Int

    def __init__(out self, val: Int, left: Int = -1, right: Int = -1):
        self.val = val
        self.left = left
        self.right = right

struct TreeArena:
    var nodes: List[TreeNode]

    def __init__(out self):
        self.nodes = List[TreeNode]()

    def add_node(mut self, val: Int, left: Int = -1, right: Int = -1) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(TreeNode(val, left, right))
        return idx

    def b_to_dll_util(mut self, root: Int, mut head: Int, mut prev: Int):
        if root == -1:
            return

        self.b_to_dll_util(self.nodes[root].left, head, prev)

        if prev == -1:
            head = root
        else:
            self.nodes[root].left = prev
            self.nodes[prev].right = root

        prev = root

        self.b_to_dll_util(self.nodes[root].right, head, prev)

    def binary_tree_to_dll(mut self, root: Int) -> Int:
        var head = -1
        var prev = -1
        self.b_to_dll_util(root, head, prev)
        return head

def main():
    var arena = TreeArena()
    # Tree:
    #       10
    #      /  \
    #     12   15
    #    /  \  /
    #   25  30 36
    var n25 = arena.add_node(25)
    var n30 = arena.add_node(30)
    var n12 = arena.add_node(12, n25, n30)
    var n36 = arena.add_node(36)
    var n15 = arena.add_node(15, n36, -1)
    var root = arena.add_node(10, n12, n15)

    var head = arena.binary_tree_to_dll(root)

    print("Doubly Linked List Forward Traversal:", end=" [")
    var curr = head
    var tail = -1
    while curr != -1:
        print(arena.nodes[curr].val, end="")
        tail = curr
        curr = arena.nodes[curr].right
        if curr != -1:
            print(", ", end="")
    print("]")

    print("Doubly Linked List Backward Traversal:", end=" [")
    curr = tail
    while curr != -1:
        print(arena.nodes[curr].val, end="")
        curr = arena.nodes[curr].left
        if curr != -1:
            print(", ", end="")
    print("]")
