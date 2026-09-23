# Tree Isomorphism Problem
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

    def is_isomorphic(self, root1: Int, root2: Int) -> Bool:
        if root1 == -1 and root2 == -1:
            return True
        if root1 == -1 or root2 == -1:
            return False

        if self.nodes[root1].val != self.nodes[root2].val:
            return False

        var case1 = (
            self.is_isomorphic(self.nodes[root1].left, self.nodes[root2].left)
            and self.is_isomorphic(self.nodes[root1].right, self.nodes[root2].right)
        )
        var case2 = (
            self.is_isomorphic(self.nodes[root1].left, self.nodes[root2].right)
            and self.is_isomorphic(self.nodes[root1].right, self.nodes[root2].left)
        )

        return case1 or case2

def main():
    var arena = TreeArena()
    # Tree 1:
    #       1
    #     /   \
    #    2     3
    #   /
    #  4
    var t1_n4 = arena.add_node(4)
    var t1_n2 = arena.add_node(2, t1_n4, -1)
    var t1_n3 = arena.add_node(3)
    var root1 = arena.add_node(1, t1_n2, t1_n3)

    # Tree 2 (flipped children of 1):
    #       1
    #     /   \
    #    3     2
    #           \
    #            4
    var t2_n4 = arena.add_node(4)
    var t2_n2 = arena.add_node(2, -1, t2_n4)
    var t2_n3 = arena.add_node(3)
    var root2 = arena.add_node(1, t2_n3, t2_n2)

    print("Are trees isomorphic:", arena.is_isomorphic(root1, root2))
