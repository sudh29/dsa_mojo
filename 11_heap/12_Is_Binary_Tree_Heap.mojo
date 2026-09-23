# Check if a Binary Tree is a Max-Heap (Complete tree + Heap property)
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

    def count_nodes(self, root: Int) -> Int:
        if root == -1:
            return 0
        return 1 + self.count_nodes(self.nodes[root].left) + self.count_nodes(self.nodes[root].right)

    def is_complete_util(self, root: Int, index: Int, total_count: Int) -> Bool:
        if root == -1:
            return True
        if index >= total_count:
            return False
        return self.is_complete_util(self.nodes[root].left, 2 * index + 1, total_count) and self.is_complete_util(self.nodes[root].right, 2 * index + 2, total_count)

    def is_heap_util(self, root: Int) -> Bool:
        if self.nodes[root].left == -1 and self.nodes[root].right == -1:
            return True

        if self.nodes[root].right == -1:
            return self.nodes[root].val >= self.nodes[self.nodes[root].left].val
        else:
            var left_ok = self.nodes[root].val >= self.nodes[self.nodes[root].left].val and self.is_heap_util(self.nodes[root].left)
            var right_ok = self.nodes[root].val >= self.nodes[self.nodes[root].right].val and self.is_heap_util(self.nodes[root].right)
            return left_ok and right_ok

    def is_binary_tree_heap(self, root: Int) -> Bool:
        if root == -1:
            return True
        var total_count = self.count_nodes(root)
        return self.is_complete_util(root, 0, total_count) and self.is_heap_util(root)

def main():
    var arena = TreeArena()

    # Tree 1: Valid Max Heap
    #        10
    #       /  \
    #      9    8
    #     / \
    #    7   6
    var n7 = arena.add_node(7)
    var n6 = arena.add_node(6)
    var n9 = arena.add_node(9, n7, n6)
    var n8 = arena.add_node(8)
    var root1 = arena.add_node(10, n9, n8)

    print("Tree 1 is Max-Heap?", arena.is_binary_tree_heap(root1))

    # Tree 2: Violates heap property
    #        5
    #       / \
    #      10  2
    var m10 = arena.add_node(10)
    var m2 = arena.add_node(2)
    var root2 = arena.add_node(5, m10, m2)

    print("Tree 2 is Max-Heap?", arena.is_binary_tree_heap(root2))
