# Postorder Traversal of a Binary Tree (Left, Right, Root)
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

    def postorder_helper(self, root: Int, mut res: List[Int]):
        if root != -1:
            self.postorder_helper(self.nodes[root].left, res)
            self.postorder_helper(self.nodes[root].right, res)
            res.append(self.nodes[root].val)

    def postorder_traversal(self, root: Int) -> List[Int]:
        var res = List[Int]()
        self.postorder_helper(root, res)
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

    var res = arena.postorder_traversal(root)
    print("Postorder traversal:", end=" [")
    for i in range(len(res)):
        print(res[i], end=", " if i < len(res) - 1 else "")
    print("]")
