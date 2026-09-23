# Reverse Level Order Traversal of Binary Tree
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

    def reverse_level_order(self, root: Int) -> List[Int]:
        var res = List[Int]()
        if root == -1:
            return res^

        var queue = List[Int]()
        var stack = List[Int]()
        queue.append(root)
        var head = 0

        while head < len(queue):
            var curr = queue[head]
            head += 1
            stack.append(curr)

            # Enqueue right child before left child
            if self.nodes[curr].right != -1:
                queue.append(self.nodes[curr].right)
            if self.nodes[curr].left != -1:
                queue.append(self.nodes[curr].left)

        while len(stack) > 0:
            var idx = stack.pop(len(stack) - 1)
            res.append(self.nodes[idx].val)

        return res^

def main():
    var arena = TreeArena()
    # Tree:
    #         1
    #       /   \
    #      2     3
    #     / \   / \
    #    4   5 6   7
    var n4 = arena.add_node(4)
    var n5 = arena.add_node(5)
    var n2 = arena.add_node(2, n4, n5)
    var n6 = arena.add_node(6)
    var n7 = arena.add_node(7)
    var n3 = arena.add_node(3, n6, n7)
    var root = arena.add_node(1, n2, n3)

    var rev = arena.reverse_level_order(root)
    print("Reverse level order:", end=" [")
    for i in range(len(rev)):
        print(rev[i], end=", " if i < len(rev) - 1 else "")
    print("]")
