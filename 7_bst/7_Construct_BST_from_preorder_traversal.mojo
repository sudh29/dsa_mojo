# Construct BST from Preorder Traversal
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

    def insert(mut self, root: Int, val: Int) -> Int:
        if root == -1:
            return self.add_node(val)
        if val < self.nodes[root].val:
            var l = self.insert(self.nodes[root].left, val)
            self.nodes[root].left = l
        elif val > self.nodes[root].val:
            var r = self.insert(self.nodes[root].right, val)
            self.nodes[root].right = r
        return root

    def bst_from_preorder(mut self, preorder: List[Int]) -> Int:
        if len(preorder) == 0:
            return -1

        var root = self.add_node(preorder[0])
        for i in range(1, len(preorder)):
            _ = self.insert(root, preorder[i])

        return root

    def inorder(self, root: Int, mut res: List[Int]):
        if root == -1:
            return
        self.inorder(self.nodes[root].left, res)
        res.append(self.nodes[root].val)
        self.inorder(self.nodes[root].right, res)

def main():
    var arena = TreeArena()
    var preorder = List[Int]()
    preorder.append(10)
    preorder.append(5)
    preorder.append(1)
    preorder.append(7)
    preorder.append(40)
    preorder.append(50)

    var root = arena.bst_from_preorder(preorder)

    var res = List[Int]()
    arena.inorder(root, res)
    print("Inorder of constructed BST (should be sorted):", end=" [")
    for i in range(len(res)):
        print(res[i], end=", " if i < len(res) - 1 else "")
    print("]")
