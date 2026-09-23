# Find Kth Smallest Element in BST
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

    def kth_smallest_util(self, root: Int, mut k: Int, mut result: Int):
        if root == -1 or k == 0:
            return

        self.kth_smallest_util(self.nodes[root].left, k, result)

        k -= 1
        if k == 0:
            result = self.nodes[root].val
            return

        self.kth_smallest_util(self.nodes[root].right, k, result)

    def kth_smallest(self, root: Int, k: Int) -> Int:
        var curr_k = k
        var result = -1
        self.kth_smallest_util(root, curr_k, result)
        return result

def main():
    var arena = TreeArena()
    # BST: 20, 8, 22, 4, 12, 10, 14
    var root = arena.add_node(20)
    _ = arena.insert(root, 8)
    _ = arena.insert(root, 22)
    _ = arena.insert(root, 4)
    _ = arena.insert(root, 12)
    _ = arena.insert(root, 10)
    _ = arena.insert(root, 14)

    print("1st smallest:", arena.kth_smallest(root, 1))
    print("3rd smallest:", arena.kth_smallest(root, 3))
    print("5th smallest:", arena.kth_smallest(root, 5))
