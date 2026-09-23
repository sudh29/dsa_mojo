# Replace Every Element with the Least Greater Element on its Right
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

    def insert_and_find_successor(
        mut self,
        root: Int,
        data: Int,
        mut successor: Int
    ) -> Int:
        if root == -1:
            return self.add_node(data)

        if data < self.nodes[root].val:
            successor = self.nodes[root].val
            var l = self.insert_and_find_successor(self.nodes[root].left, data, successor)
            self.nodes[root].left = l
        elif data >= self.nodes[root].val:
            var r = self.insert_and_find_successor(self.nodes[root].right, data, successor)
            self.nodes[root].right = r

        return root

    def replace_least_greater(mut self, mut arr: List[Int]):
        var n = len(arr)
        var root = -1

        for i in range(n - 1, -1, -1):
            var succ = -1
            root = self.insert_and_find_successor(root, arr[i], succ)
            arr[i] = succ

def main():
    var arena = TreeArena()
    var arr = List[Int]()
    arr.append(8)
    arr.append(58)
    arr.append(71)
    arr.append(18)
    arr.append(31)
    arr.append(32)
    arr.append(63)
    arr.append(92)
    arr.append(43)
    arr.append(3)
    arr.append(91)
    arr.append(93)
    arr.append(25)
    arr.append(80)
    arr.append(28)

    print("Original array:", end=" [")
    for i in range(len(arr)):
        print(arr[i], end=", " if i < len(arr) - 1 else "")
    print("]")

    arena.replace_least_greater(arr)

    print("Replaced array:", end=" [")
    for i in range(len(arr)):
        print(arr[i], end=", " if i < len(arr) - 1 else "")
    print("]")
