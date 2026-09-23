# Boundary Traversal of Binary Tree
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

    def is_leaf(self, node: Int) -> Bool:
        return self.nodes[node].left == -1 and self.nodes[node].right == -1

    def print_left_boundary(self, root: Int, mut res: List[Int]):
        var curr = self.nodes[root].left
        while curr != -1:
            if not self.is_leaf(curr):
                res.append(self.nodes[curr].val)
            if self.nodes[curr].left != -1:
                curr = self.nodes[curr].left
            else:
                curr = self.nodes[curr].right

    def print_leaves(self, node: Int, mut res: List[Int]):
        if node == -1:
            return
        if self.is_leaf(node):
            res.append(self.nodes[node].val)
            return
        if self.nodes[node].left != -1:
            self.print_leaves(self.nodes[node].left, res)
        if self.nodes[node].right != -1:
            self.print_leaves(self.nodes[node].right, res)

    def print_right_boundary(self, root: Int, mut res: List[Int]):
        var curr = self.nodes[root].right
        var stack = List[Int]()
        while curr != -1:
            if not self.is_leaf(curr):
                stack.append(self.nodes[curr].val)
            if self.nodes[curr].right != -1:
                curr = self.nodes[curr].right
            else:
                curr = self.nodes[curr].left

        # Add in reverse (bottom-up)
        for i in range(len(stack) - 1, -1, -1):
            res.append(stack[i])

    def boundary_traversal(self, root: Int) -> List[Int]:
        var res = List[Int]()
        if root == -1:
            return res^

        if not self.is_leaf(root):
            res.append(self.nodes[root].val)

        self.print_left_boundary(root, res)
        self.print_leaves(root, res)
        self.print_right_boundary(root, res)

        return res^

def main():
    var arena = TreeArena()
    # Tree:
    #         20
    #        /  \
    #       8    22
    #      / \     \
    #     4  12     25
    #        / \
    #       10 14
    var n4 = arena.add_node(4)
    var n10 = arena.add_node(10)
    var n14 = arena.add_node(14)
    var n12 = arena.add_node(12, n10, n14)
    var n8 = arena.add_node(8, n4, n12)
    var n25 = arena.add_node(25)
    var n22 = arena.add_node(22, -1, n25)
    var root = arena.add_node(20, n8, n22)

    var boundary = arena.boundary_traversal(root)
    print("Boundary Traversal:", end=" [")
    for i in range(len(boundary)):
        print(boundary[i], end=", " if i < len(boundary) - 1 else "")
    print("]")
