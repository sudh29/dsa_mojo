# Sum of Nodes on the Longest Path from Root to Leaf Node
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

    def solve(
        self,
        root: Int,
        level: Int,
        curr_sum: Int,
        mut max_len: Int,
        mut max_sum: Int
    ):
        if root == -1:
            if level > max_len:
                max_len = level
                max_sum = curr_sum
            elif level == max_len:
                if curr_sum > max_sum:
                    max_sum = curr_sum
            return

        var node_sum = curr_sum + self.nodes[root].val
        self.solve(self.nodes[root].left, level + 1, node_sum, max_len, max_sum)
        self.solve(self.nodes[root].right, level + 1, node_sum, max_len, max_sum)

    def sum_of_longest_path(self, root: Int) -> Int:
        if root == -1:
            return 0
        var max_len = 0
        var max_sum = -1000000000
        self.solve(root, 0, 0, max_len, max_sum)
        return max_sum

def main():
    var arena = TreeArena()
    # Tree:
    #         4
    #        / \
    #       2   5
    #      / \  / \
    #     7  1 2   3
    #       /
    #      6
    var n6 = arena.add_node(6)
    var n1 = arena.add_node(1, n6, -1)
    var n7 = arena.add_node(7)
    var n2_left = arena.add_node(2, n7, n1)
    var n2_right = arena.add_node(2)
    var n3 = arena.add_node(3)
    var n5 = arena.add_node(5, n2_right, n3)
    var root = arena.add_node(4, n2_left, n5)

    var res = arena.sum_of_longest_path(root)
    print("Sum of nodes on longest path:", res)
