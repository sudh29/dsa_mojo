# Search Data in Binary Tree
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

    def search_element(self, root: Int, data: Int) -> Bool:
        if root == -1:
            return False

        var queue = List[Int]()
        queue.append(root)
        var head = 0

        while head < len(queue):
            var curr = queue[head]
            head += 1

            if self.nodes[curr].val == data:
                return True

            if self.nodes[curr].left != -1:
                queue.append(self.nodes[curr].left)
            if self.nodes[curr].right != -1:
                queue.append(self.nodes[curr].right)

        return False

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
    var n4_l = arena.add_node(4)
    var n3 = arena.add_node(3, n11, n4_l)
    var n1 = arena.add_node(1)
    var n6 = arena.add_node(6, n3, n1)

    var n4_r = arena.add_node(4)
    var n2_r = arena.add_node(2)
    var n8 = arena.add_node(8, n4_r, n2_r)

    var root = arena.add_node(2, n6, n8)

    print("Search 11 in tree:", arena.search_element(root, 11))
    print("Search 81 in tree:", arena.search_element(root, 81))
