# Find Value in Binary Search Tree (BST)
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

    def search(self, root: Int, x: Int) -> Bool:
        var curr = root
        while curr != -1:
            if self.nodes[curr].val == x:
                return True
            elif x < self.nodes[curr].val:
                curr = self.nodes[curr].left
            else:
                curr = self.nodes[curr].right
        return False

def main():
    var arena = TreeArena()
    # Construct BST:
    #        8
    #      /   \
    #     3     10
    #    / \      \
    #   1   6      14
    var root = arena.add_node(8)
    _ = arena.insert(root, 3)
    _ = arena.insert(root, 10)
    _ = arena.insert(root, 1)
    _ = arena.insert(root, 6)
    _ = arena.insert(root, 14)

    print("Search 6 in BST:", arena.search(root, 6))
    print("Search 7 in BST:", arena.search(root, 7))
    print("Search 14 in BST:", arena.search(root, 14))
