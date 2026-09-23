# Find Level with Maximum Sum in Binary Tree (Iterative BFS)
# Reference: https://mojolang.org/docs/manual/get-started/

struct TreeNode:
    var val: Int
    var left: Int
    var right: Int

    def __init__(out self, val: Int, left: Int = -1, right: Int = -1):
        self.val = val
        self.left = left
        self.right = right

struct LevelSumResult:
    var max_sum: Int
    var max_level: Int

    def __init__(out self, max_sum: Int, max_level: Int):
        self.max_sum = max_sum
        self.max_level = max_level

struct TreeArena:
    var nodes: List[TreeNode]

    def __init__(out self):
        self.nodes = List[TreeNode]()

    def add_node(mut self, val: Int, left: Int = -1, right: Int = -1) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(TreeNode(val, left, right))
        return idx

    def max_sum_level(self, root: Int) -> LevelSumResult:
        if root == -1:
            return LevelSumResult(0, 0)

        var queue = List[Int]()
        queue.append(root)
        var head = 0

        var max_sum = -2147483648
        var max_level = 0
        var current_level = 1

        while head < len(queue):
            var level_size = len(queue) - head
            var level_sum = 0

            for _ in range(level_size):
                var curr = queue[head]
                head += 1
                level_sum += self.nodes[curr].val

                if self.nodes[curr].left != -1:
                    queue.append(self.nodes[curr].left)
                if self.nodes[curr].right != -1:
                    queue.append(self.nodes[curr].right)

            if level_sum > max_sum:
                max_sum = level_sum
                max_level = current_level

            current_level += 1

        return LevelSumResult(max_sum, max_level)

def main():
    var arena = TreeArena()
    # Tree:
    #         2
    #        / \
    #       6   8
    #      / \  / \
    #     3   1 4  2
    #    / \
    #   19  4
    var n19 = arena.add_node(19)
    var n4_l = arena.add_node(4)
    var n3 = arena.add_node(3, n19, n4_l)
    var n1 = arena.add_node(1)
    var n6 = arena.add_node(6, n3, n1)

    var n4_r = arena.add_node(4)
    var n2_r = arena.add_node(2)
    var n8 = arena.add_node(8, n4_r, n2_r)

    var root = arena.add_node(2, n6, n8)

    var res = arena.max_sum_level(root)
    print("Maximum level sum:", res.max_sum, "at level:", res.max_level)
