# Canonical Binary Tree implementation in Mojo 1.1

struct TreeNode(ImplicitlyCopyable, Movable):
    var val: Int
    var left: Int
    var right: Int

    def __init__(out self, val: Int, left: Int = -1, right: Int = -1):
        self.val = val
        self.left = left
        self.right = right

    def __init__(out self, *, copy: TreeNode):
        self.val = copy.val
        self.left = copy.left
        self.right = copy.right

struct TreeArena(Movable):
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
        self.preorder(self.nodes[root].left, res)
        res.append(self.nodes[root].val)
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
