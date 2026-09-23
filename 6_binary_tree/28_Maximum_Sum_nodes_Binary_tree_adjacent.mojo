# Maximum Sum of Non-Adjacent Nodes in a Binary Tree
# Reference: https://mojolang.org/docs/manual/get-started/

struct TreeNode:
    var val: Int
    var left: Int
    var right: Int

    def __init__(out self, val: Int, left: Int = -1, right: Int = -1):
        self.val = val
        self.left = left
        self.right = right

struct SubtreeSum:
    var incl: Int
    var excl: Int

    def __init__(out self, incl: Int, excl: Int):
        self.incl = incl
        self.excl = excl

struct TreeArena:
    var nodes: List[TreeNode]

    def __init__(out self):
        self.nodes = List[TreeNode]()

    def add_node(mut self, val: Int, left: Int = -1, right: Int = -1) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(TreeNode(val, left, right))
        return idx

    def max_sum_helper(self, root: Int) -> SubtreeSum:
        if root == -1:
            return SubtreeSum(0, 0)

        var left_res = self.max_sum_helper(self.nodes[root].left)
        var right_res = self.max_sum_helper(self.nodes[root].right)

        var incl_sum = self.nodes[root].val + left_res.excl + right_res.excl

        var max_left = left_res.incl if left_res.incl > left_res.excl else left_res.excl
        var max_right = right_res.incl if right_res.incl > right_res.excl else right_res.excl
        var excl_sum = max_left + max_right

        return SubtreeSum(incl_sum, excl_sum)

    def get_max_sum(self, root: Int) -> Int:
        if root == -1:
            return 0
        var res = self.max_sum_helper(root)
        return res^.incl if res.incl > res.excl else res.excl

def main():
    var arena = TreeArena()
    # Tree:
    #         1
    #       /   \
    #      2     3
    #     /     / \
    #    1     4   5
    var n1_leaf = arena.add_node(1)
    var n2 = arena.add_node(2, n1_leaf, -1)
    var n4 = arena.add_node(4)
    var n5 = arena.add_node(5)
    var n3 = arena.add_node(3, n4, n5)
    var root = arena.add_node(1, n2, n3)

    var ans = arena.get_max_sum(root)
    print("Maximum sum of non-adjacent nodes:", ans)
