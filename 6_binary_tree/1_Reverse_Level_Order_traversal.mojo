# Reverse Level Order Traversal of a Binary Tree
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
        queue.append(root)
        var q_head = 0

        while q_head < len(queue):
            var curr = queue[q_head]
            q_head += 1

            res.append(self.nodes[curr].val)

            # Enqueue right child first, then left child
            if self.nodes[curr].right != -1:
                queue.append(self.nodes[curr].right)
            if self.nodes[curr].left != -1:
                queue.append(self.nodes[curr].left)

        # Reverse result
        var reversed_res = List[Int]()
        var n = len(res)
        for i in range(n - 1, -1, -1):
            reversed_res.append(res[i])

        return reversed_res^

def main():
    var arena = TreeArena()

    # Construct Tree:
    #       1
    #     /   \
    #    3     2
    var n3 = arena.add_node(3)
    var n2 = arena.add_node(2)
    var root = arena.add_node(1, n3, n2)

    var order = arena.reverse_level_order(root)
    print("Reverse Level order traversal:", end=" [")
    for i in range(len(order)):
        print(order[i], end=", " if i < len(order) - 1 else "")
    print("]")
