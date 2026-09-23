# Convert Binary Tree into BST
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

    def inorder_fill(mut self, root: Int, vals: List[Int], mut index: Int):
        if root == -1:
            return
        self.inorder_fill(self.nodes[root].left, vals, index)
        self.nodes[root].val = vals[index]
        index += 1
        self.inorder_fill(self.nodes[root].right, vals, index)

    def binary_tree_to_bst(mut self, root: Int):
        var vals = List[Int]()
        self.inorder_extract(root, vals)

        # Sort values
        for i in range(len(vals)):
            var min_idx = i
            for j in range(i + 1, len(vals)):
                if vals[j] < vals[min_idx]:
                    min_idx = j
            if min_idx != i:
                var tmp = vals[i]
                vals[i] = vals[min_idx]
                vals[min_idx] = tmp

        var idx = 0
        self.inorder_fill(root, vals, idx)

def main():
    var arena = TreeArena()
    # Binary Tree (not a BST):
    #       10
    #      /  \
    #     2    7
    #    / \
    #   8   4
    var n8 = arena.add_node(8)
    var n4 = arena.add_node(4)
    var n2 = arena.add_node(2, n8, n4)
    var n7 = arena.add_node(7)
    var root = arena.add_node(10, n2, n7)

    var before = List[Int]()
    arena.inorder_extract(root, before)
    print("Inorder before conversion:", end=" [")
    for i in range(len(before)):
        print(before[i], end=", " if i < len(before) - 1 else "")
    print("]")

    arena.binary_tree_to_bst(root)

    var after = List[Int]()
    arena.inorder_extract(root, after)
    print("Inorder after conversion to BST:", end=" [")
    for i in range(len(after)):
        print(after[i], end=", " if i < len(after) - 1 else "")
    print("]")
