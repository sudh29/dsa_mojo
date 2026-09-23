# Find Minimum and Maximum Value in BST
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

    def min_value(self, root: Int) -> Int:
        if root == -1:
            return -1
        var curr = root
        while self.nodes[curr].left != -1:
            curr = self.nodes[curr].left
        return self.nodes[curr].val

    def max_value(self, root: Int) -> Int:
        if root == -1:
            return -1
        var curr = root
        while self.nodes[curr].right != -1:
            curr = self.nodes[curr].right
        return self.nodes[curr].val

def main():
    var arena = TreeArena()
    var root = arena.add_node(20)
    _ = arena.insert(root, 8)
    _ = arena.insert(root, 22)
    _ = arena.insert(root, 4)
    _ = arena.insert(root, 12)
    _ = arena.insert(root, 10)
    _ = arena.insert(root, 14)

    print("Min value in BST:", arena.min_value(root))
    print("Max value in BST:", arena.max_value(root))
