# Preorder Traversal of a Binary Tree (Root, Left, Right)
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

    def preorder_helper(self, root: Int, mut res: List[Int]):
        if root != -1:
            res.append(self.nodes[root].val)
            self.preorder_helper(self.nodes[root].left, res)
            self.preorder_helper(self.nodes[root].right, res)

    def preorder_traversal(self, root: Int) -> List[Int]:
        var res = List[Int]()
        self.preorder_helper(root, res)
        return res^

def main():
    var arena = TreeArena()

    # Tree:
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

    var res = arena.preorder_traversal(root)
    print("Preorder traversal:", end=" [")
    for i in range(len(res)):
        print(res[i], end=", " if i < len(res) - 1 else "")
    print("]")
