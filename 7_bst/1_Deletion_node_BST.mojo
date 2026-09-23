# Deletion of Node in Binary Search Tree
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

    def min_value_node(self, node: Int) -> Int:
        var curr = node
        while curr != -1 and self.nodes[curr].left != -1:
            curr = self.nodes[curr].left
        return curr

    def delete_node(mut self, root: Int, key: Int) -> Int:
        if root == -1:
            return -1

        if key < self.nodes[root].val:
            var l = self.delete_node(self.nodes[root].left, key)
            self.nodes[root].left = l
        elif key > self.nodes[root].val:
            var r = self.delete_node(self.nodes[root].right, key)
            self.nodes[root].right = r
        else:
            # Case 1 & 2: 0 or 1 child
            if self.nodes[root].left == -1:
                return self.nodes[root].right
            elif self.nodes[root].right == -1:
                return self.nodes[root].left

            # Case 3: 2 children
            var succ = self.min_value_node(self.nodes[root].right)
            var succ_val = self.nodes[succ].val
            self.nodes[root].val = succ_val
            var r = self.delete_node(self.nodes[root].right, succ_val)
            self.nodes[root].right = r

        return root

    def inorder(self, root: Int, mut res: List[Int]):
        if root == -1:
            return
        self.inorder(self.nodes[root].left, res)
        res.append(self.nodes[root].val)
        self.inorder(self.nodes[root].right, res)

def main():
    var arena = TreeArena()
    # Construct BST: 50, 30, 20, 40, 70, 60, 80
    var root = arena.add_node(50)
    _ = arena.insert(root, 30)
    _ = arena.insert(root, 20)
    _ = arena.insert(root, 40)
    _ = arena.insert(root, 70)
    _ = arena.insert(root, 60)
    _ = arena.insert(root, 80)

    var before = List[Int]()
    arena.inorder(root, before)
    print("Inorder before deletion:", end=" [")
    for i in range(len(before)):
        print(before[i], end=", " if i < len(before) - 1 else "")
    print("]")

    # Delete 20 (leaf)
    root = arena.delete_node(root, 20)
    # Delete 30 (1 child)
    root = arena.delete_node(root, 30)
    # Delete 50 (2 children)
    root = arena.delete_node(root, 50)

    var after = List[Int]()
    arena.inorder(root, after)
    print("Inorder after deleting 20, 30, 50:", end=" [")
    for i in range(len(after)):
        print(after[i], end=", " if i < len(after) - 1 else "")
    print("]")
