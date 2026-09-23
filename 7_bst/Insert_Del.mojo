# Insertion and Deletion in a Binary Tree
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

    def insert(mut self, root: Int, data: Int) -> Int:
        if root == -1:
            return self.add_node(data)

        var queue = List[Int]()
        queue.append(root)
        var head = 0

        while head < len(queue):
            var curr = queue[head]
            head += 1

            if self.nodes[curr].left == -1:
                var new_node = self.add_node(data)
                self.nodes[curr].left = new_node
                break
            else:
                queue.append(self.nodes[curr].left)

            if self.nodes[curr].right == -1:
                var new_node = self.add_node(data)
                self.nodes[curr].right = new_node
                break
            else:
                queue.append(self.nodes[curr].right)

        return root

    def delete_deepest(mut self, root: Int, deepest_node: Int):
        var queue = List[Int]()
        queue.append(root)
        var head = 0

        while head < len(queue):
            var curr = queue[head]
            head += 1

            if self.nodes[curr].left != -1:
                if self.nodes[curr].left == deepest_node:
                    self.nodes[curr].left = -1
                    return
                else:
                    queue.append(self.nodes[curr].left)

            if self.nodes[curr].right != -1:
                if self.nodes[curr].right == deepest_node:
                    self.nodes[curr].right = -1
                    return
                else:
                    queue.append(self.nodes[curr].right)

    def delete_key(mut self, root: Int, key: Int) -> Int:
        if root == -1:
            return -1

        if self.nodes[root].left == -1 and self.nodes[root].right == -1:
            if self.nodes[root].val == key:
                return -1
            return root

        var queue = List[Int]()
        queue.append(root)
        var head = 0
        var key_node = -1
        var curr = -1

        while head < len(queue):
            curr = queue[head]
            head += 1

            if self.nodes[curr].val == key:
                key_node = curr

            if self.nodes[curr].left != -1:
                queue.append(self.nodes[curr].left)
            if self.nodes[curr].right != -1:
                queue.append(self.nodes[curr].right)

        if key_node != -1:
            var deepest_val = self.nodes[curr].val
            self.delete_deepest(root, curr)
            self.nodes[key_node].val = deepest_val

        return root

    def level_order(self, root: Int) -> List[Int]:
        var res = List[Int]()
        if root == -1:
            return res^

        var queue = List[Int]()
        queue.append(root)
        var head = 0

        while head < len(queue):
            var curr = queue[head]
            head += 1
            res.append(self.nodes[curr].val)

            if self.nodes[curr].left != -1:
                queue.append(self.nodes[curr].left)
            if self.nodes[curr].right != -1:
                queue.append(self.nodes[curr].right)

        return res^

def print_list(lst: List[Int]):
    print("[", end="")
    for i in range(len(lst)):
        print(lst[i], end=", " if i < len(lst) - 1 else "")
    print("]")

def main():
    var arena = TreeArena()
    # Tree:
    #         10
    #        /  \
    #       11   9
    #      /    / \
    #     7    15  8
    var n7 = arena.add_node(7)
    var n11 = arena.add_node(11, n7, -1)
    var n15 = arena.add_node(15)
    var n8 = arena.add_node(8)
    var n9 = arena.add_node(9, n15, n8)
    var root = arena.add_node(10, n11, n9)

    print("Initial level order:")
    print_list(arena.level_order(root))

    root = arena.insert(root, 12)
    print("After inserting 12:")
    print_list(arena.level_order(root))

    root = arena.delete_key(root, 11)
    print("After deleting 11:")
    print_list(arena.level_order(root))
