# Check if Binary Tree is Sum Tree
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

    def is_sum_tree_util(self, root: Int, mut is_valid: Bool) -> Int:
        if root == -1:
            return 0

        # Leaf node is considered a SumTree
        if self.nodes[root].left == -1 and self.nodes[root].right == -1:
            return self.nodes[root].val

        var ls = self.is_sum_tree_util(self.nodes[root].left, is_valid)
        var rs = self.is_sum_tree_util(self.nodes[root].right, is_valid)

        if ls + rs != self.nodes[root].val:
            is_valid = False

        return ls + rs + self.nodes[root].val

    def is_sum_tree(self, root: Int) -> Bool:
        if root == -1:
            return True
        if self.nodes[root].left == -1 and self.nodes[root].right == -1:
            return True

        var is_valid = True
        _ = self.is_sum_tree_util(root, is_valid)
        return is_valid

def main():
    var arena = TreeArena()
    # Tree:
    #         26
    #        /  \
    #       10   3
    #      /  \   \
    #     4    6   3
    var n4 = arena.add_node(4)
    var n6 = arena.add_node(6)
    var n10 = arena.add_node(10, n4, n6)
    var n3_leaf = arena.add_node(3)
    var n3_right = arena.add_node(3, -1, n3_leaf)
    var root = arena.add_node(26, n10, n3_right)

    print("Is Sum Tree:", arena.is_sum_tree(root))

    # Modify to make it invalid
    arena.nodes[n4].val = 5
    print("Is Sum Tree (after modification):", arena.is_sum_tree(root))
