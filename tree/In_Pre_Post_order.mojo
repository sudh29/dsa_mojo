# Inorder, Preorder, Postorder, and Level Order Traversals
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

    def inorder(self, root: Int, mut res: List[Int]):
        if root == -1:
            return
        self.inorder(self.nodes[root].left, res)
        res.append(self.nodes[root].val)
        self.inorder(self.nodes[root].right, res)

    def preorder(self, root: Int, mut res: List[Int]):
        if root == -1:
            return
        res.append(self.nodes[root].val)
        self.preorder(self.nodes[root].left, res)
        self.preorder(self.nodes[root].right, res)

    def postorder(self, root: Int, mut res: List[Int]):
        if root == -1:
            return
        self.postorder(self.nodes[root].left, res)
        self.postorder(self.nodes[root].right, res)
        res.append(self.nodes[root].val)

    def level_order(self, root: Int) -> List[Int]:
        var res = List[Int]()
        if root == -1:
            return res^

        var queue = List[Int]()
        queue.append(root)
        var head = 0

        while head < len(queue):
            var curr = queue[head]
            head += 1
            res.append(self.nodes[curr].val)

            if self.nodes[curr].left != -1:
                queue.append(self.nodes[curr].left)
            if self.nodes[curr].right != -1:
                queue.append(self.nodes[curr].right)

        return res^

def print_list(name: String, lst: List[Int]):
    print(name, end=": [")
    for i in range(len(lst)):
        print(lst[i], end=", " if i < len(lst) - 1 else "")
    print("]")

def main():
    var arena = TreeArena()
    # Tree:
    #         10
    #        /  \
    #       11   9
    #      /    / \
    #     7    15  8
    var n7 = arena.add_node(7)
    var n11 = arena.add_node(11, n7, -1)
    var n15 = arena.add_node(15)
    var n8 = arena.add_node(8)
    var n9 = arena.add_node(9, n15, n8)
    var root = arena.add_node(10, n11, n9)

    var lvl = arena.level_order(root)
    print_list("Level Order", lvl)

    var inord = List[Int]()
    arena.inorder(root, inord)
    print_list("Inorder", inord)

    var pre = List[Int]()
    arena.preorder(root, pre)
    print_list("Preorder", pre)

    var post = List[Int]()
    arena.postorder(root, post)
    print_list("Postorder", post)
