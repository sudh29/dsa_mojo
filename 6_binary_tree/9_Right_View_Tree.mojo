# Right View of a Binary Tree
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

    def right_view(self, root: Int) -> List[Int]:
        var res = List[Int]()
        if root == -1:
            return res^

        var queue = List[Int]()
        queue.append(root)

        while len(queue) > 0:
            var level_size = len(queue)
            for i in range(level_size):
                var curr = queue[0]
                var new_q = List[Int]()
                for k in range(1, len(queue)):
                    new_q.append(queue[k])
                queue = new_q^

                # If last node in level, append to result
                if i == level_size - 1:
                    res.append(self.nodes[curr].val)

                if self.nodes[curr].left != -1:
                    queue.append(self.nodes[curr].left)
                if self.nodes[curr].right != -1:
                    queue.append(self.nodes[curr].right)

        return res^

def main():
    var arena = TreeArena()

    # Tree:
    #         1
    #       /   \
    #      2     3
    #     / \     \
    #    4   5     6
    var n4 = arena.add_node(4)
    var n5 = arena.add_node(5)
    var n6 = arena.add_node(6)
    var n2 = arena.add_node(2, n4, n5)
    var n3 = arena.add_node(3, -1, n6)
    var root = arena.add_node(1, n2, n3)

    var view = arena.right_view(root)
    print("Right view:", end=" [")
    for i in range(len(view)):
        print(view[i], end=", " if i < len(view) - 1 else "")
    print("]")
