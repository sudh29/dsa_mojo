# Find Maximum Element in a Binary Tree
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

    def max_element(self, root: Int) -> Int:
        if root == -1:
            return -2147483648

        var queue = List[Int]()
        queue.append(root)
        var head = 0
        var max_val = self.nodes[root].val

        while head < len(queue):
            var curr = queue[head]
            head += 1

            if self.nodes[curr].val > max_val:
                max_val = self.nodes[curr].val

            if self.nodes[curr].left != -1:
                queue.append(self.nodes[curr].left)
            if self.nodes[curr].right != -1:
                queue.append(self.nodes[curr].right)

        return max_val

def main():
    var arena = TreeArena()
    # Tree:
    #         2
    #        / \
    #       6   8
    #      / \  / \
    #     3   1 4  2
    #    / \
    #   11  4
    var n11 = arena.add_node(11)
    var n4_left = arena.add_node(4)
    var n3 = arena.add_node(3, n11, n4_left)
    var n1 = arena.add_node(1)
    var n6 = arena.add_node(6, n3, n1)

    var n4_right = arena.add_node(4)
    var n2_leaf = arena.add_node(2)
    var n8 = arena.add_node(8, n4_right, n2_leaf)

    var root = arena.add_node(2, n6, n8)

    print("Maximum element in tree:", arena.max_element(root))
