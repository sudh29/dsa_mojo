# Check if a Binary Tree is Height Balanced (O(N) bottom-up check)
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

    def check_height(self, root: Int) -> Int:
        if root == -1:
            return 0

        var lh = self.check_height(self.nodes[root].left)
        if lh == -1:
            return -1

        var rh = self.check_height(self.nodes[root].right)
        if rh == -1:
            return -1

        if abs(lh - rh) > 1:
            return -1

        return 1 + max(lh, rh)

    def is_balanced(self, root: Int) -> Bool:
        return self.check_height(root) != -1

def main():
    var arena = TreeArena()

    # Balanced Tree:
    #       1
    #      / \
    #     2   3
    #    /
    #   4
    var n4 = arena.add_node(4)
    var n2 = arena.add_node(2, n4, -1)
    var n3 = arena.add_node(3)
    var root1 = arena.add_node(1, n2, n3)

    print("Tree 1 is balanced?", arena.is_balanced(root1))

    # Unbalanced Tree:
    #       1
    #      /
    #     2
    #    /
    #   3
    var m3 = arena.add_node(3)
    var m2 = arena.add_node(2, m3, -1)
    var root2 = arena.add_node(1, m2, -1)

    print("Tree 2 is balanced?", arena.is_balanced(root2))
