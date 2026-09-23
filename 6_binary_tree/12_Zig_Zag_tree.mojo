# Zig-Zag (Spiral) Level Order Traversal of a Binary Tree
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

    def zig_zag_traversal(self, root: Int) -> List[Int]:
        var res = List[Int]()
        if root == -1:
            return res^

        var queue = List[Int]()
        queue.append(root)
        var left_to_right = True

        while len(queue) > 0:
            var size = len(queue)
            var level = List[Int]()

            for _ in range(size):
                var curr = queue[0]
                var new_q = List[Int]()
                for k in range(1, len(queue)):
                    new_q.append(queue[k])
                queue = new_q^

                level.append(self.nodes[curr].val)

                if self.nodes[curr].left != -1:
                    queue.append(self.nodes[curr].left)
                if self.nodes[curr].right != -1:
                    queue.append(self.nodes[curr].right)

            if left_to_right:
                for i in range(len(level)):
                    res.append(level[i])
            else:
                for i in range(len(level) - 1, -1, -1):
                    res.append(level[i])

            left_to_right = not left_to_right

        return res^

def main():
    var arena = TreeArena()

    # Tree:
    #         1
    #       /   \
    #      2     3
    #     / \   / \
    #    7   6 5   4
    var n7 = arena.add_node(7)
    var n6 = arena.add_node(6)
    var n5 = arena.add_node(5)
    var n4 = arena.add_node(4)
    var n2 = arena.add_node(2, n7, n6)
    var n3 = arena.add_node(3, n5, n4)
    var root = arena.add_node(1, n2, n3)

    var zz = arena.zig_zag_traversal(root)
    print("Zig-Zag traversal:", end=" [")
    for i in range(len(zz)):
        print(zz[i], end=", " if i < len(zz) - 1 else "")
    print("]")
