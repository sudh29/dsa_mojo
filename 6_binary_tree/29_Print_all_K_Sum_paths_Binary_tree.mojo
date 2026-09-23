# Print/Count all K-Sum Paths in Binary Tree
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

    def count_paths_util(
        self,
        root: Int,
        k: Int,
        mut path: List[Int],
        mut count: Int
    ):
        if root == -1:
            return

        path.append(self.nodes[root].val)

        self.count_paths_util(self.nodes[root].left, k, path, count)
        self.count_paths_util(self.nodes[root].right, k, path, count)

        var running_sum = 0
        for i in range(len(path) - 1, -1, -1):
            running_sum += path[i]
            if running_sum == k:
                count += 1

        _ = path.pop(len(path) - 1)

    def count_k_sum_paths(self, root: Int, k: Int) -> Int:
        var path = List[Int]()
        var count = 0
        self.count_paths_util(root, k, path, count)
        return count

def main():
    var arena = TreeArena()
    # Tree:
    #         1
    #       /   \
    #      3    -1
    #     / \   / \
    #    2   1 4   5
    #       / / \   \
    #      1 1   2   6
    var n1_deep = arena.add_node(1)
    var n1_child = arena.add_node(1, n1_deep, -1)
    var n2_left = arena.add_node(2)
    var n3 = arena.add_node(3, n2_left, n1_child)

    var n1_sub = arena.add_node(1)
    var n2_sub = arena.add_node(2)
    var n4 = arena.add_node(4, n1_sub, n2_sub)
    var n6 = arena.add_node(6)
    var n5 = arena.add_node(5, -1, n6)
    var n_neg1 = arena.add_node(-1, n4, n5)

    var root = arena.add_node(1, n3, n_neg1)

    var k = 5
    var total = arena.count_k_sum_paths(root, k)
    print("Total paths with sum", k, ":", total)
