# Flatten BST to Sorted Linked List (in-place)
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

    def insert(mut self, root: Int, val: Int) -> Int:
        if root == -1:
            return self.add_node(val)
        if val < self.nodes[root].val:
            var l = self.insert(self.nodes[root].left, val)
            self.nodes[root].left = l
        elif val > self.nodes[root].val:
            var r = self.insert(self.nodes[root].right, val)
            self.nodes[root].right = r
        return root

    def flatten_util(mut self, curr: Int, mut prev: Int, mut head: Int):
        if curr == -1:
            return

        var right_child = self.nodes[curr].right

        self.flatten_util(self.nodes[curr].left, prev, head)

        self.nodes[curr].left = -1
        if prev != -1:
            self.nodes[prev].right = curr
        else:
            head = curr

        prev = curr

        self.flatten_util(right_child, prev, head)

    def flatten_bst(mut self, root: Int) -> Int:
        var prev = -1
        var head = -1
        self.flatten_util(root, prev, head)
        if prev != -1:
            self.nodes[prev].right = -1
        return head

def main():
    var arena = TreeArena()
    # BST:
    #       5
    #      / \
    #     3   7
    #    / \ / \
    #   2  4 6  8
    var root = arena.add_node(5)
    _ = arena.insert(root, 3)
    _ = arena.insert(root, 7)
    _ = arena.insert(root, 2)
    _ = arena.insert(root, 4)
    _ = arena.insert(root, 6)
    _ = arena.insert(root, 8)

    var head = arena.flatten_bst(root)

    print("Flattened BST sorted list:", end=" [")
    var curr = head
    while curr != -1:
        print(arena.nodes[curr].val, end="")
        curr = arena.nodes[curr].right
        if curr != -1:
            print(" -> ", end="")
    print("]")
