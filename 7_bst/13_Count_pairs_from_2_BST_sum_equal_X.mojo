# Count Pairs from 2 BSTs whose Sum equals X
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

    def count_pairs(self, root1: Int, root2: Int, x: Int) -> Int:
        var r1 = List[Int]()
        var r2 = List[Int]()
        self.inorder(root1, r1)
        self.inorder(root2, r2)

        var i = 0
        var j = len(r2) - 1
        var count = 0

        while i < len(r1) and j >= 0:
            var current_sum = r1[i] + r2[j]
            if current_sum == x:
                count += 1
                i += 1
                j -= 1
            elif current_sum < x:
                i += 1
            else:
                j -= 1

        return count

def main():
    var arena = TreeArena()
    # BST 1:
    #       5
    #      / \
    #     3   7
    #    / \ / \
    #   2  4 6  8
    var root1 = arena.add_node(5)
    _ = arena.insert(root1, 3)
    _ = arena.insert(root1, 7)
    _ = arena.insert(root1, 2)
    _ = arena.insert(root1, 4)
    _ = arena.insert(root1, 6)
    _ = arena.insert(root1, 8)

    # BST 2:
    #       10
    #      /  \
    #     6    15
    #    / \  /  \
    #   3  8 11  18
    var root2 = arena.add_node(10)
    _ = arena.insert(root2, 6)
    _ = arena.insert(root2, 15)
    _ = arena.insert(root2, 3)
    _ = arena.insert(root2, 8)
    _ = arena.insert(root2, 11)
    _ = arena.insert(root2, 18)

    var x = 16
    var ans = arena.count_pairs(root1, root2, x)
    print("Pairs from BST1 and BST2 summing to", x, ":", ans)
