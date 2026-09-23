# Diagonal Traversal of Binary Tree
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

    def diagonal_traversal(self, root: Int) -> List[Int]:
        var res = List[Int]()
        if root == -1:
            return res^

        var left_q = List[Int]()
        var q_head = 0
        var curr = root

        while curr != -1 or q_head < len(left_q):
            if curr == -1:
                curr = left_q[q_head]
                q_head += 1

            while curr != -1:
                res.append(self.nodes[curr].val)
                if self.nodes[curr].left != -1:
                    left_q.append(self.nodes[curr].left)
                curr = self.nodes[curr].right

        return res^

def main():
    var arena = TreeArena()
    # Tree:
    #         8
    #       /   \
    #      3     10
    #     / \      \
    #    1   6      14
    #       / \     /
    #      4   7   13
    var n1 = arena.add_node(1)
    var n4 = arena.add_node(4)
    var n7 = arena.add_node(7)
    var n6 = arena.add_node(6, n4, n7)
    var n3 = arena.add_node(3, n1, n6)
    var n13 = arena.add_node(13)
    var n14 = arena.add_node(14, n13, -1)
    var n10 = arena.add_node(10, -1, n14)
    var root = arena.add_node(8, n3, n10)

    var diag = arena.diagonal_traversal(root)
    print("Diagonal Traversal:", end=" [")
    for i in range(len(diag)):
        print(diag[i], end=", " if i < len(diag) - 1 else "")
    print("]")
