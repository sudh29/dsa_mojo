# Count BST Nodes that Lie in a Given Range
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

    def get_count_in_range(self, root: Int, low: Int, high: Int) -> Int:
        if root == -1:
            return 0

        var v = self.nodes[root].val
        if v >= low and v <= high:
            return 1 + self.get_count_in_range(self.nodes[root].left, low, high) + self.get_count_in_range(self.nodes[root].right, low, high)
        elif v < low:
            return self.get_count_in_range(self.nodes[root].right, low, high)
        else:
            return self.get_count_in_range(self.nodes[root].left, low, high)

def main():
    var arena = TreeArena()
    # BST: 10, 5, 50, 1, 40, 100
    var root = arena.add_node(10)
    _ = arena.insert(root, 5)
    _ = arena.insert(root, 50)
    _ = arena.insert(root, 1)
    _ = arena.insert(root, 40)
    _ = arena.insert(root, 100)

    var low = 5
    var high = 45
    var count = arena.get_count_in_range(root, low, high)
    print("Nodes in range [", low, ",", high, "]:", count)
