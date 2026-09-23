# Level Order Traversal (BFS) of a Binary Tree
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

    def level_order(self, root: Int) -> List[Int]:
        var res = List[Int]()
        if root == -1:
            return res^

        var queue = List[Int]()
        queue.append(root)
        var q_head = 0

        while q_head < len(queue):
            var curr = queue[q_head]
            q_head += 1

            res.append(self.nodes[curr].val)

            if self.nodes[curr].left != -1:
                queue.append(self.nodes[curr].left)
            if self.nodes[curr].right != -1:
                queue.append(self.nodes[curr].right)

        return res^

def main():
    var arena = TreeArena()

    # Construct Tree:
    #       1
    #     /   \
    #    2     3
    #   / \
    #  4   5
    var n4 = arena.add_node(4)
    var n5 = arena.add_node(5)
    var n2 = arena.add_node(2, n4, n5)
    var n3 = arena.add_node(3)
    var root = arena.add_node(1, n2, n3)

    var order = arena.level_order(root)
    print("Level order traversal:", end=" [")
    for i in range(len(order)):
        print(order[i], end=", " if i < len(order) - 1 else "")
    print("]")
