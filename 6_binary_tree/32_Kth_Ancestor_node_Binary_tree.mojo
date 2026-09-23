# Kth Ancestor of a Node in Binary Tree
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

    def find_ancestors(
        self,
        root: Int,
        target: Int,
        mut current_path: List[Int],
        mut result_ancestors: List[Int]
    ):
        if root == -1:
            return

        if self.nodes[root].val == target:
            for i in range(len(current_path)):
                result_ancestors.append(current_path[i])
            return

        current_path.append(self.nodes[root].val)

        self.find_ancestors(self.nodes[root].left, target, current_path, result_ancestors)
        self.find_ancestors(self.nodes[root].right, target, current_path, result_ancestors)

        _ = current_path.pop(len(current_path) - 1)

    def kth_ancestor(self, root: Int, k: Int, node_val: Int) -> Int:
        var current_path = List[Int]()
        var ancestors = List[Int]()

        self.find_ancestors(root, node_val, current_path, ancestors)

        var count = len(ancestors)
        if k > count or k <= 0:
            return -1

        return ancestors[count - k]

def main():
    var arena = TreeArena()
    # Tree:
    #         1
    #       /   \
    #      2     3
    #     / \
    #    4   5
    var n4 = arena.add_node(4)
    var n5 = arena.add_node(5)
    var n2 = arena.add_node(2, n4, n5)
    var n3 = arena.add_node(3)
    var root = arena.add_node(1, n2, n3)

    print("1st ancestor of 4:", arena.kth_ancestor(root, 1, 4))
    print("2nd ancestor of 4:", arena.kth_ancestor(root, 2, 4))
    print("3rd ancestor of 4:", arena.kth_ancestor(root, 3, 4))
