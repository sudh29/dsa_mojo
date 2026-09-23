# Inorder Traversal of a Binary Tree (Left, Root, Right)
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

    def inorder_helper(self, root: Int, mut res: List[Int]):
        if root != -1:
            self.inorder_helper(self.nodes[root].left, res)
            res.append(self.nodes[root].val)
            self.inorder_helper(self.nodes[root].right, res)

    def inorder_traversal(self, root: Int) -> List[Int]:
        var res = List[Int]()
        self.inorder_helper(root, res)
        return res^

def main():
    var arena = TreeArena()

    # Tree:
    #       1
    #        \
    #         2
    #        /
    #       3
    var n3 = arena.add_node(3)
    var n2 = arena.add_node(2, n3, -1)
    var root = arena.add_node(1, -1, n2)

    var res = arena.inorder_traversal(root)
    print("Inorder traversal:", end=" [")
    for i in range(len(res)):
        print(res[i], end=", " if i < len(res) - 1 else "")
    print("]")
