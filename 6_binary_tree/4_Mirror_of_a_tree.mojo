# Mirror (Invert) of a Binary Tree
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

    def mirror(mut self, root: Int):
        if root == -1:
            return

        var tmp = self.nodes[root].left
        self.nodes[root].left = self.nodes[root].right
        self.nodes[root].right = tmp

        self.mirror(self.nodes[root].left)
        self.mirror(self.nodes[root].right)

    def inorder(self, root: Int):
        if root != -1:
            self.inorder(self.nodes[root].left)
            print(self.nodes[root].val, end=" ")
            self.inorder(self.nodes[root].right)

def main():
    var arena = TreeArena()

    # Tree:
    #      1
    #     / \
    #    2   3
    var n2 = arena.add_node(2)
    var n3 = arena.add_node(3)
    var root = arena.add_node(1, n2, n3)

    print("Inorder before mirror: ", end="")
    arena.inorder(root)
    print()

    arena.mirror(root)

    print("Inorder after mirror:  ", end="")
    arena.inorder(root)
    print()
