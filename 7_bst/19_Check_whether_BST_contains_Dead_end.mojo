# Check whether BST Contains Dead End
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

    def has_dead_end_util(self, root: Int, min_val: Int, max_val: Int) -> Bool:
        if root == -1:
            return False

        if min_val == max_val:
            return True

        var v = self.nodes[root].val
        var left_dead = self.has_dead_end_util(self.nodes[root].left, min_val, v - 1)
        var right_dead = self.has_dead_end_util(self.nodes[root].right, v + 1, max_val)

        return left_dead or right_dead

    def has_dead_end(self, root: Int) -> Bool:
        return self.has_dead_end_util(root, 1, 2147483647)

def main():
    var arena = TreeArena()
    # Tree 1 with dead end:
    #         8
    #       /   \
    #      5     9
    #     / \
    #    2   7
    #   /
    #  1
    var root = arena.add_node(8)
    _ = arena.insert(root, 5)
    _ = arena.insert(root, 9)
    _ = arena.insert(root, 2)
    _ = arena.insert(root, 7)
    _ = arena.insert(root, 1)

    print("Tree has dead end:", arena.has_dead_end(root))
