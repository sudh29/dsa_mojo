# Generic Binary Tree implementation in Mojo 1.1

struct GenericTreeNode[T: AnyType](ImplicitlyCopyable, Movable) where conforms_to(T, Movable) and conforms_to(T, ImplicitlyCopyable) and conforms_to(T, Deinitable):
    var val: Self.T
    var left: Int
    var right: Int

    def __init__(out self, val: Self.T, left: Int = -1, right: Int = -1):
        self.val = val
        self.left = left
        self.right = right

    def __init__(out self, *, copy: Self):
        self.val = copy.val
        self.left = copy.left
        self.right = copy.right

struct GenericTreeArena[T: AnyType](Movable) where conforms_to(T, Movable) and conforms_to(T, ImplicitlyCopyable) and conforms_to(T, Deinitable):
    var nodes: List[GenericTreeNode[Self.T]]

    def __init__(out self):
        self.nodes = List[GenericTreeNode[Self.T]]()

    def add_node(mut self, val: Self.T, left: Int = -1, right: Int = -1) -> Int:
        var idx = len(self.nodes)
        var node = GenericTreeNode[Self.T](val, left, right)
        self.nodes.append(node^)
        return idx

    def inorder(self, root: Int, mut res: List[Self.T]):
        if root == -1:
            return
        self.inorder(self.nodes[root].left, res)
        var v = self.nodes[root].val
        res.append(v^)
        self.inorder(self.nodes[root].right, res)

    def preorder(self, root: Int, mut res: List[Self.T]):
        if root == -1:
            return
        var v = self.nodes[root].val
        res.append(v^)
        self.preorder(self.nodes[root].left, res)
        self.preorder(self.nodes[root].right, res)

    def postorder(self, root: Int, mut res: List[Self.T]):
        if root == -1:
            return
        self.postorder(self.nodes[root].left, res)
        self.postorder(self.nodes[root].right, res)
        var v = self.nodes[root].val
        res.append(v^)

    def level_order(self, root: Int) -> List[Self.T]:
        var res = List[Self.T]()
        if root == -1:
            return res^

        var queue = List[Int]()
        queue.append(root)
        var head = 0

        while head < len(queue):
            var curr = queue[head]
            head += 1
            var v = self.nodes[curr].val
            res.append(v^)

            if self.nodes[curr].left != -1:
                queue.append(self.nodes[curr].left)
            if self.nodes[curr].right != -1:
                queue.append(self.nodes[curr].right)

        return res^
