# Height of a Binary Tree
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

    def height(self, root: Int) -> Int:
        if root == -1:
            return 0

        var lh = self.height(self.nodes[root].left)
        var rh = self.height(self.nodes[root].right)

        return 1 + max(lh, rh)

def main():
    var arena = TreeArena()

    # Construct Tree:
    #       1
    #      / \
    #     2   3
    #    /
    #   4
    var n4 = arena.add_node(4)
    var n2 = arena.add_node(2, n4, -1)
    var n3 = arena.add_node(3)
    var root = arena.add_node(1, n2, n3)

    print("Height of binary tree:", arena.height(root))
