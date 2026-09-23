# Check if All Leaves are at Same Level
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

    def check_level(self, root: Int, level: Int, mut leaf_level: Int) -> Bool:
        if root == -1:
            return True

        if self.nodes[root].left == -1 and self.nodes[root].right == -1:
            if leaf_level == -1:
                leaf_level = level
                return True
            return leaf_level == level

        var left_ok = self.check_level(self.nodes[root].left, level + 1, leaf_level)
        var right_ok = self.check_level(self.nodes[root].right, level + 1, leaf_level)

        return left_ok and right_ok

    def check_leaves_same_level(self, root: Int) -> Bool:
        var leaf_level = -1
        return self.check_level(root, 0, leaf_level)

def main():
    var arena = TreeArena()
    # Tree 1:
    #       12
    #      /  \
    #     5    7
    #    /      \
    #   3        1
    var n3 = arena.add_node(3)
    var n5 = arena.add_node(5, n3, -1)
    var n1 = arena.add_node(1)
    var n7 = arena.add_node(7, -1, n1)
    var root1 = arena.add_node(12, n5, n7)

    print("Tree 1 leaves at same level:", arena.check_leaves_same_level(root1))

    # Add extra level to tree
    var n10 = arena.add_node(10)
    arena.nodes[n3].left = n10
    print("Tree 1 (after adding node) leaves at same level:", arena.check_leaves_same_level(root1))
