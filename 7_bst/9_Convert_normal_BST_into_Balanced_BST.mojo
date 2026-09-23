# Convert Normal BST into Balanced BST
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

    def inorder_extract(self, root: Int, mut vals: List[Int]):
        if root == -1:
            return
        self.inorder_extract(self.nodes[root].left, vals)
        vals.append(self.nodes[root].val)
        self.inorder_extract(self.nodes[root].right, vals)

    def build_balanced(mut self, vals: List[Int], start: Int, end: Int) -> Int:
        if start > end:
            return -1

        var mid = (start + end) // 2
        var left_child = self.build_balanced(vals, start, mid - 1)
        var right_child = self.build_balanced(vals, mid + 1, end)

        return self.add_node(vals[mid], left_child, right_child)

    def to_balanced_bst(mut self, root: Int) -> Int:
        var vals = List[Int]()
        self.inorder_extract(root, vals)
        return self.build_balanced(vals, 0, len(vals) - 1)

    def height(self, root: Int) -> Int:
        if root == -1:
            return 0
        var lh = self.height(self.nodes[root].left)
        var rh = self.height(self.nodes[root].right)
        return 1 + (lh if lh > rh else rh)

def main():
    var arena = TreeArena()
    # Unbalanced BST (skewed right):
    # 4 -> 3 -> 2 -> 1
    var n1 = arena.add_node(1)
    var n2 = arena.add_node(2, n1, -1)
    var n3 = arena.add_node(3, n2, -1)
    var root = arena.add_node(4, n3, -1)

    print("Height before balancing:", arena.height(root))

    var balanced_root = arena.to_balanced_bst(root)
    print("Height after balancing:", arena.height(balanced_root))
