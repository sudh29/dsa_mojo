# Find Lowest Common Ancestor (LCA) in BST
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

    def lca_bst(self, root: Int, n1: Int, n2: Int) -> Int:
        var curr = root
        while curr != -1:
            if self.nodes[curr].val > n1 and self.nodes[curr].val > n2:
                curr = self.nodes[curr].left
            elif self.nodes[curr].val < n1 and self.nodes[curr].val < n2:
                curr = self.nodes[curr].right
            else:
                return curr
        return -1

def main():
    var arena = TreeArena()
    # Construct BST:
    #         20
    #        /  \
    #       8    22
    #      / \
    #     4  12
    #        / \
    #       10 14
    var root = arena.add_node(20)
    _ = arena.insert(root, 8)
    _ = arena.insert(root, 22)
    _ = arena.insert(root, 4)
    _ = arena.insert(root, 12)
    _ = arena.insert(root, 10)
    _ = arena.insert(root, 14)

    var lca1 = arena.lca_bst(root, 10, 14)
    print("LCA(10, 14):", arena.nodes[lca1].val)

    var lca2 = arena.lca_bst(root, 14, 8)
    print("LCA(14, 8):", arena.nodes[lca2].val)

    var lca3 = arena.lca_bst(root, 10, 22)
    print("LCA(10, 22):", arena.nodes[lca3].val)
