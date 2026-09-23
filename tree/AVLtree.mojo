# AVL Tree Implementation with Self-Balancing Insertions
# Reference: https://mojolang.org/docs/manual/get-started/

struct AVLNode:
    var val: Int
    var left: Int
    var right: Int
    var height: Int

    def __init__(out self, val: Int, left: Int = -1, right: Int = -1, height: Int = 1):
        self.val = val
        self.left = left
        self.right = right
        self.height = height

struct AVLTree:
    var nodes: List[AVLNode]

    def __init__(out self):
        self.nodes = List[AVLNode]()

    def add_node(mut self, val: Int) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(AVLNode(val, -1, -1, 1))
        return idx

    def get_height(self, node: Int) -> Int:
        if node == -1:
            return 0
        return self.nodes[node].height

    def get_balance(self, node: Int) -> Int:
        if node == -1:
            return 0
        return self.get_height(self.nodes[node].left) - self.get_height(self.nodes[node].right)

    def right_rotate(mut self, y: Int) -> Int:
        var x = self.nodes[y].left
        var t2 = self.nodes[x].right

        self.nodes[x].right = y
        self.nodes[y].left = t2

        var yh_left = self.get_height(self.nodes[y].left)
        var yh_right = self.get_height(self.nodes[y].right)
        self.nodes[y].height = 1 + (yh_left if yh_left > yh_right else yh_right)

        var xh_left = self.get_height(self.nodes[x].left)
        var xh_right = self.get_height(self.nodes[x].right)
        self.nodes[x].height = 1 + (xh_left if xh_left > xh_right else xh_right)

        return x

    def left_rotate(mut self, x: Int) -> Int:
        var y = self.nodes[x].right
        var t2 = self.nodes[y].left

        self.nodes[y].left = x
        self.nodes[x].right = t2

        var xh_left = self.get_height(self.nodes[x].left)
        var xh_right = self.get_height(self.nodes[x].right)
        self.nodes[x].height = 1 + (xh_left if xh_left > xh_right else xh_right)

        var yh_left = self.get_height(self.nodes[y].left)
        var yh_right = self.get_height(self.nodes[y].right)
        self.nodes[y].height = 1 + (yh_left if yh_left > yh_right else yh_right)

        return y

    def insert(mut self, root: Int, key: Int) -> Int:
        if root == -1:
            return self.add_node(key)

        if key < self.nodes[root].val:
            var l = self.insert(self.nodes[root].left, key)
            self.nodes[root].left = l
        elif key > self.nodes[root].val:
            var r = self.insert(self.nodes[root].right, key)
            self.nodes[root].right = r
        else:
            return root

        var lh = self.get_height(self.nodes[root].left)
        var rh = self.get_height(self.nodes[root].right)
        self.nodes[root].height = 1 + (lh if lh > rh else rh)

        var balance = self.get_balance(root)

        # Left Left Case
        if balance > 1 and key < self.nodes[self.nodes[root].left].val:
            return self.right_rotate(root)

        # Right Right Case
        if balance < -1 and key > self.nodes[self.nodes[root].right].val:
            return self.left_rotate(root)

        # Left Right Case
        if balance > 1 and key > self.nodes[self.nodes[root].left].val:
            var l = self.left_rotate(self.nodes[root].left)
            self.nodes[root].left = l
            return self.right_rotate(root)

        # Right Left Case
        if balance < -1 and key < self.nodes[self.nodes[root].right].val:
            var r = self.right_rotate(self.nodes[root].right)
            self.nodes[root].right = r
            return self.left_rotate(root)

        return root

    def preorder(self, root: Int, mut res: List[Int]):
        if root == -1:
            return
        res.append(self.nodes[root].val)
        self.preorder(self.nodes[root].left, res)
        self.preorder(self.nodes[root].right, res)

def main():
    var tree = AVLTree()
    var root = -1

    root = tree.insert(root, 10)
    root = tree.insert(root, 20)
    root = tree.insert(root, 30)
    root = tree.insert(root, 40)
    root = tree.insert(root, 50)
    root = tree.insert(root, 25)

    var pre = List[Int]()
    tree.preorder(root, pre)
    print("Preorder of balanced AVL tree:", end=" [")
    for i in range(len(pre)):
        print(pre[i], end=", " if i < len(pre) - 1 else "")
    print("]")
