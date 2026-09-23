# Find Largest Subtree Sum in a Tree
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

    def subtree_sum(self, root: Int, mut max_sum: Int) -> Int:
        if root == -1:
            return 0

        var ls = self.subtree_sum(self.nodes[root].left, max_sum)
        var rs = self.subtree_sum(self.nodes[root].right, max_sum)

        var curr_sum = self.nodes[root].val + ls + rs
        if curr_sum > max_sum:
            max_sum = curr_sum

        return curr_sum

    def find_largest_subtree_sum(self, root: Int) -> Int:
        if root == -1:
            return 0
        var max_sum = -1000000000
        _ = self.subtree_sum(root, max_sum)
        return max_sum

def main():
    var arena = TreeArena()
    # Tree:
    #         1
    #       /   \
    #     -2     3
    #    /  \   / \
    #   4    5 -6  2
    var n4 = arena.add_node(4)
    var n5 = arena.add_node(5)
    var n_neg2 = arena.add_node(-2, n4, n5)
    var n_neg6 = arena.add_node(-6)
    var n2 = arena.add_node(2)
    var n3 = arena.add_node(3, n_neg6, n2)
    var root = arena.add_node(1, n_neg2, n3)

    var res = arena.find_largest_subtree_sum(root)
    print("Largest Subtree Sum:", res)
