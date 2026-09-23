# Find Level with Maximum Sum in Binary Tree (Recursive DFS)
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

    def dfs_level_sum(self, root: Int, level: Int, mut level_sums: List[Int]):
        if root == -1:
            return

        while len(level_sums) <= level:
            level_sums.append(0)

        level_sums[level] += self.nodes[root].val

        self.dfs_level_sum(self.nodes[root].left, level + 1, level_sums)
        self.dfs_level_sum(self.nodes[root].right, level + 1, level_sums)

    def max_level_sum(self, root: Int) -> LevelSumResult:
        if root == -1:
            return LevelSumResult(0, 0)

        var level_sums = List[Int]()
        self.dfs_level_sum(root, 1, level_sums)

        var max_sum = -2147483648
        var best_level = 1

        for i in range(1, len(level_sums)):
            if level_sums[i] > max_sum:
                max_sum = level_sums[i]
                best_level = i

        return LevelSumResult(max_sum, best_level)

def main():
    var arena = TreeArena()
    # Constructed Binary tree:
    # 			 1
    # 			 / \
    # 			 2 3
    # 		 / \ \
    # 		 4 5 8
    # 				 / \
    # 				 6 7
    var n4 = arena.add_node(4)
    var n5 = arena.add_node(5)
    var n2 = arena.add_node(2, n4, n5)

    var n6 = arena.add_node(6)
    var n7 = arena.add_node(7)
    var n8 = arena.add_node(8, n6, n7)
    var n3 = arena.add_node(3, -1, n8)

    var root = arena.add_node(1, n2, n3)

    var res = arena.max_level_sum(root)
    print("Maximum level sum (recursive DFS):", res.max_sum, "at level:", res.max_level)
