# Find Distance Between Two Nodes in Binary Tree
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

    def find_lca(self, root: Int, n1: Int, n2: Int) -> Int:
        if root == -1:
            return -1

        if self.nodes[root].val == n1 or self.nodes[root].val == n2:
            return root

        var left_lca = self.find_lca(self.nodes[root].left, n1, n2)
        var right_lca = self.find_lca(self.nodes[root].right, n1, n2)

        if left_lca != -1 and right_lca != -1:
            return root

        return left_lca if left_lca != -1 else right_lca

    def find_level(self, root: Int, k: Int, level: Int) -> Int:
        if root == -1:
            return -1
        if self.nodes[root].val == k:
            return level

        var d = self.find_level(self.nodes[root].left, k, level + 1)
        if d != -1:
            return d
        return self.find_level(self.nodes[root].right, k, level + 1)

    def find_distance(self, root: Int, a: Int, b: Int) -> Int:
        var lca_node = self.find_lca(root, a, b)
        if lca_node == -1:
            return -1

        var d1 = self.find_level(lca_node, a, 0)
        var d2 = self.find_level(lca_node, b, 0)

        return d1 + d2

def main():
    var arena = TreeArena()
    # Tree:
    #         1
    #       /   \
    #      2     3
    #     / \   / \
    #    4   5 6   7
    var n4 = arena.add_node(4)
    var n5 = arena.add_node(5)
    var n2 = arena.add_node(2, n4, n5)
    var n6 = arena.add_node(6)
    var n7 = arena.add_node(7)
    var n3 = arena.add_node(3, n6, n7)
    var root = arena.add_node(1, n2, n3)

    print("Distance between 4 and 5:", arena.find_distance(root, 4, 5))
    print("Distance between 4 and 6:", arena.find_distance(root, 4, 6))
    print("Distance between 3 and 4:", arena.find_distance(root, 3, 4))
