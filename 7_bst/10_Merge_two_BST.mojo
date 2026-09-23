# Merge Two BSTs into a Single Sorted Array / Balanced BST
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

    def merge_sorted(self, a: List[Int], b: List[Int]) -> List[Int]:
        var res = List[Int]()
        var i = 0
        var j = 0
        while i < len(a) and j < len(b):
            if a[i] <= b[j]:
                res.append(a[i])
                i += 1
            else:
                res.append(b[j])
                j += 1
        while i < len(a):
            res.append(a[i])
            i += 1
        while j < len(b):
            res.append(b[j])
            j += 1
        return res^

    def merge_bsts(self, root1: Int, root2: Int) -> List[Int]:
        var l1 = List[Int]()
        var l2 = List[Int]()
        self.inorder(root1, l1)
        self.inorder(root2, l2)
        return self.merge_sorted(l1, l2)

def main():
    var arena = TreeArena()
    # BST 1:
    #     5
    #    / \
    #   3   6
    #  / \
    # 2   4
    var n2 = arena.add_node(2)
    var n4 = arena.add_node(4)
    var n3 = arena.add_node(3, n2, n4)
    var n6 = arena.add_node(6)
    var root1 = arena.add_node(5, n3, n6)

    # BST 2:
    #     2
    #    / \
    #   1   3
    #        \
    #         7
    #        /
    #       6
    var b_n1 = arena.add_node(1)
    var b_n6 = arena.add_node(6)
    var b_n7 = arena.add_node(7, b_n6, -1)
    var b_n3 = arena.add_node(3, -1, b_n7)
    var root2 = arena.add_node(2, b_n1, b_n3)

    var merged = arena.merge_bsts(root1, root2)
    print("Merged BSTs:", end=" [")
    for i in range(len(merged)):
        print(merged[i], end=", " if i < len(merged) - 1 else "")
    print("]")
