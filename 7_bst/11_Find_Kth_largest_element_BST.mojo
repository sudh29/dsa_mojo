# Find Kth Largest Element in BST
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

    def kth_largest_util(self, root: Int, mut k: Int, mut result: Int):
        if root == -1 or k == 0:
            return

        self.kth_largest_util(self.nodes[root].right, k, result)

        k -= 1
        if k == 0:
            result = self.nodes[root].val
            return

        self.kth_largest_util(self.nodes[root].left, k, result)

    def kth_largest(self, root: Int, k: Int) -> Int:
        var curr_k = k
        var result = -1
        self.kth_largest_util(root, curr_k, result)
        return result

def main():
    var arena = TreeArena()
    # BST: 4, 2, 9
    var root = arena.add_node(4)
    _ = arena.insert(root, 2)
    _ = arena.insert(root, 9)

    print("1st largest:", arena.kth_largest(root, 1))
    print("2nd largest:", arena.kth_largest(root, 2))
    print("3rd largest:", arena.kth_largest(root, 3))
