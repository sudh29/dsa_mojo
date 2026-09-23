# Convert Binary Tree to Sum Tree
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

    def to_sum_tree(mut self, root: Int) -> Int:
        if root == -1:
            return 0

        var old_val = self.nodes[root].val

        var left_sum = self.to_sum_tree(self.nodes[root].left)
        var right_sum = self.to_sum_tree(self.nodes[root].right)

        self.nodes[root].val = left_sum + right_sum

        return old_val + self.nodes[root].val

    def inorder(self, root: Int, mut res: List[Int]):
        if root == -1:
            return
        self.inorder(self.nodes[root].left, res)
        res.append(self.nodes[root].val)
        self.inorder(self.nodes[root].right, res)

def main():
    var arena = TreeArena()
    # Tree:
    #         10
    #       /    \
    #     -2      6
    #    /  \    / \
    #   8   -4  7   5
    var n8 = arena.add_node(8)
    var n_neg4 = arena.add_node(-4)
    var n_neg2 = arena.add_node(-2, n8, n_neg4)
    var n7 = arena.add_node(7)
    var n5 = arena.add_node(5)
    var n6 = arena.add_node(6, n7, n5)
    var root = arena.add_node(10, n_neg2, n6)

    _ = arena.to_sum_tree(root)

    var res = List[Int]()
    arena.inorder(root, res)
    print("Inorder of converted Sum Tree:", end=" [")
    for i in range(len(res)):
        print(res[i], end=", " if i < len(res) - 1 else "")
    print("]")
