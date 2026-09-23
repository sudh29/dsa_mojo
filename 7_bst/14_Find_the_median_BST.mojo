# Find Median of BST
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

    def inorder(self, root: Int, mut res: List[Int]):
        if root == -1:
            return
        self.inorder(self.nodes[root].left, res)
        res.append(self.nodes[root].val)
        self.inorder(self.nodes[root].right, res)

    def find_median(self, root: Int) -> Float64:
        var vals = List[Int]()
        self.inorder(root, vals)
        var n = len(vals)
        if n == 0:
            return 0.0

        var mid = n // 2
        if n % 2 != 0:
            return Float64(vals[mid])
        else:
            return Float64(vals[mid] + vals[mid - 1]) / 2.0

def main():
    var arena = TreeArena()
    # Odd number of nodes: 6, 3, 8, 1, 4, 7, 9
    var root = arena.add_node(6)
    _ = arena.insert(root, 3)
    _ = arena.insert(root, 8)
    _ = arena.insert(root, 1)
    _ = arena.insert(root, 4)
    _ = arena.insert(root, 7)
    _ = arena.insert(root, 9)

    print("Median (odd size):", arena.find_median(root))

    # Even number of nodes (insert 2)
    _ = arena.insert(root, 2)
    print("Median (even size):", arena.find_median(root))
