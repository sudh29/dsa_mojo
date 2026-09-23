# Find Inorder Predecessor and Successor in BST
# Reference: https://mojolang.org/docs/manual/get-started/

struct TreeNode:
    var val: Int
    var left: Int
    var right: Int

    def __init__(out self, val: Int, left: Int = -1, right: Int = -1):
        self.val = val
        self.left = left
        self.right = right

struct PreSucResult:
    var pre: Int
    var suc: Int

    def __init__(out self, pre: Int, suc: Int):
        self.pre = pre
        self.suc = suc

struct TreeArena:
    var nodes: List[TreeNode]

    def __init__(out self):
        self.nodes = List[TreeNode]()

    def add_node(mut self, val: Int, left: Int = -1, right: Int = -1) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(TreeNode(val, left, right))
        return idx

    def insert(mut self, root: Int, val: Int) -> Int:
        if root == -1:
            return self.add_node(val)
        if val < self.nodes[root].val:
            var l = self.insert(self.nodes[root].left, val)
            self.nodes[root].left = l
        elif val > self.nodes[root].val:
            var r = self.insert(self.nodes[root].right, val)
            self.nodes[root].right = r
        return root

    def find_pre_suc(self, root: Int, key: Int) -> PreSucResult:
        var pre = -1
        var suc = -1
        var curr = root

        while curr != -1:
            if self.nodes[curr].val == key:
                # Predecessor: maximum value in left subtree
                if self.nodes[curr].left != -1:
                    var temp = self.nodes[curr].left
                    while self.nodes[temp].right != -1:
                        temp = self.nodes[temp].right
                    pre = self.nodes[temp].val

                # Successor: minimum value in right subtree
                if self.nodes[curr].right != -1:
                    var temp = self.nodes[curr].right
                    while self.nodes[temp].left != -1:
                        temp = self.nodes[temp].left
                    suc = self.nodes[temp].val
                break

            elif key < self.nodes[curr].val:
                # Successor can be the current node
                suc = self.nodes[curr].val
                curr = self.nodes[curr].left
            else:
                # Predecessor can be the current node
                pre = self.nodes[curr].val
                curr = self.nodes[curr].right

        return PreSucResult(pre, suc)

def main():
    var arena = TreeArena()
    # Construct BST: 50, 30, 20, 40, 70, 60, 80
    var root = arena.add_node(50)
    _ = arena.insert(root, 30)
    _ = arena.insert(root, 20)
    _ = arena.insert(root, 40)
    _ = arena.insert(root, 70)
    _ = arena.insert(root, 60)
    _ = arena.insert(root, 80)

    var res = arena.find_pre_suc(root, 60)
    print("Predecessor of 60:", res.pre)
    print("Successor of 60:", res.suc)

    var res2 = arena.find_pre_suc(root, 50)
    print("Predecessor of 50:", res2.pre)
    print("Successor of 50:", res2.suc)
