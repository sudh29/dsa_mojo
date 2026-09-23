# Diameter of a Binary Tree (Longest path between any two nodes)
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

    def height_and_diameter(self, root: Int, mut max_diameter: Int) -> Int:
        if root == -1:
            return 0

        var lh = self.height_and_diameter(self.nodes[root].left, max_diameter)
        var rh = self.height_and_diameter(self.nodes[root].right, max_diameter)

        # Diameter passing through root is lh + rh + 1 (in terms of nodes)
        if (lh + rh + 1) > max_diameter:
            max_diameter = lh + rh + 1

        return 1 + max(lh, rh)

    def diameter(self, root: Int) -> Int:
        var max_dia = 0
        _ = self.height_and_diameter(root, max_dia)
        return max_dia

def main():
    var arena = TreeArena()

    # Construct Tree:
    #       1
    #     /   \
    #    2     3
    #   / \
    #  4   5
    var n4 = arena.add_node(4)
    var n5 = arena.add_node(5)
    var n2 = arena.add_node(2, n4, n5)
    var n3 = arena.add_node(3)
    var root = arena.add_node(1, n2, n3)

    print("Diameter of binary tree (number of nodes):", arena.diameter(root))
