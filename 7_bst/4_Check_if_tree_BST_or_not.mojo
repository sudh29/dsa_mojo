# Check if Binary Tree is BST or Not
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

    def is_bst_util(self, root: Int, min_val: Int, max_val: Int) -> Bool:
        if root == -1:
            return True

        var v = self.nodes[root].val
        if v <= min_val or v >= max_val:
            return False

        return self.is_bst_util(self.nodes[root].left, min_val, v) and self.is_bst_util(self.nodes[root].right, v, max_val)

    def is_bst(self, root: Int) -> Bool:
        # Min Int and Max Int limits
        return self.is_bst_util(root, -2147483648, 2147483647)

def main():
    var arena = TreeArena()
    # Tree 1 (Valid BST):
    #       4
    #      / \
    #     2   5
    #    / \
    #   1   3
    var n1 = arena.add_node(1)
    var n3 = arena.add_node(3)
    var n2 = arena.add_node(2, n1, n3)
    var n5 = arena.add_node(5)
    var root1 = arena.add_node(4, n2, n5)

    print("Tree 1 is BST:", arena.is_bst(root1))

    # Tree 2 (Invalid BST):
    # Swap 3 with 5
    var invalid_node = arena.add_node(5)
    arena.nodes[n2].right = invalid_node
    print("Tree 2 is BST:", arena.is_bst(root1))
