# Largest BST in a Binary Tree
# Reference: https://mojolang.org/docs/manual/get-started/

struct TreeNode:
    var val: Int
    var left: Int
    var right: Int

    def __init__(out self, val: Int, left: Int = -1, right: Int = -1):
        self.val = val
        self.left = left
        self.right = right

struct BSTInfo:
    var is_bst: Bool
    var size: Int
    var min_val: Int
    var max_val: Int

    def __init__(out self, is_bst: Bool, size: Int, min_val: Int, max_val: Int):
        self.is_bst = is_bst
        self.size = size
        self.min_val = min_val
        self.max_val = max_val

struct TreeArena:
    var nodes: List[TreeNode]

    def __init__(out self):
        self.nodes = List[TreeNode]()

    def add_node(mut self, val: Int, left: Int = -1, right: Int = -1) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(TreeNode(val, left, right))
        return idx

    def largest_bst_util(self, root: Int, mut max_size: Int) -> BSTInfo:
        if root == -1:
            return BSTInfo(True, 0, 2147483647, -2147483648)

        var left_info = self.largest_bst_util(self.nodes[root].left, max_size)
        var right_info = self.largest_bst_util(self.nodes[root].right, max_size)

        var val = self.nodes[root].val

        if left_info.is_bst and right_info.is_bst and left_info.max_val < val and val < right_info.min_val:
            var curr_size = 1 + left_info.size + right_info.size
            if curr_size > max_size:
                max_size = curr_size

            var mn = val if left_info.min_val > val else left_info.min_val
            var mx = val if right_info.max_val < val else right_info.max_val

            return BSTInfo(True, curr_size, mn, mx)

        return BSTInfo(False, 0, 0, 0)

    def largest_bst(self, root: Int) -> Int:
        var max_size = 0
        _ = self.largest_bst_util(root, max_size)
        return max_size

def main():
    var arena = TreeArena()
    # Tree:
    #       50
    #      /  \
    #     30   60
    #    /  \  / \
    #   5  20 45 70
    #            / \
    #           65 80
    var n5 = arena.add_node(5)
    var n20 = arena.add_node(20)
    var n30 = arena.add_node(30, n5, n20)
    var n45 = arena.add_node(45)
    var n65 = arena.add_node(65)
    var n80 = arena.add_node(80)
    var n70 = arena.add_node(70, n65, n80)
    var n60 = arena.add_node(60, n45, n70)
    var root = arena.add_node(50, n30, n60)

    print("Size of largest BST in binary tree:", arena.largest_bst(root))
