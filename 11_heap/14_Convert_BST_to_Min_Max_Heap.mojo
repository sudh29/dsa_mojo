# Convert BST to Min-Heap (Inorder traversal to sorted array, then Preorder traversal)
# Reference: https://mojolang.org/docs/manual/get-started/

struct BSTNode:
    var data: Int
    var left: Int
    var right: Int

    def __init__(out self, data: Int, left: Int = -1, right: Int = -1):
        self.data = data
        self.left = left
        self.right = right

struct BSTHeapConverter:
    var nodes: List[BSTNode]

    def __init__(out self):
        self.nodes = List[BSTNode]()

    def add_node(mut self, data: Int, left: Int = -1, right: Int = -1) -> Int:
        var idx = len(self.nodes)
        self.nodes.append(BSTNode(data, left, right))
        return idx

    def inorder(self, root: Int, mut arr: List[Int]):
        if root != -1:
            self.inorder(self.nodes[root].left, arr)
            arr.append(self.nodes[root].data)
            self.inorder(self.nodes[root].right, arr)

    def preorder_fill(mut self, root: Int, arr: List[Int], mut idx: Int):
        if root != -1:
            self.nodes[root].data = arr[idx]
            idx += 1
            self.preorder_fill(self.nodes[root].left, arr, idx)
            self.preorder_fill(self.nodes[root].right, arr, idx)

    def convert_bst_to_min_heap(mut self, root: Int):
        var sorted_vals = List[Int]()
        self.inorder(root, sorted_vals)
        var idx = 0
        self.preorder_fill(root, sorted_vals, idx)

    def print_preorder(self, root: Int):
        if root != -1:
            print(self.nodes[root].data, end=" ")
            self.print_preorder(self.nodes[root].left)
            self.print_preorder(self.nodes[root].right)

def main():
    var conv = BSTHeapConverter()

    # BST:
    #         4
    #       /   \
    #      2     6
    #     / \   / \
    #    1   3 5   7
    var n1 = conv.add_node(1)
    var n3 = conv.add_node(3)
    var n2 = conv.add_node(2, n1, n3)

    var n5 = conv.add_node(5)
    var n7 = conv.add_node(7)
    var n6 = conv.add_node(6, n5, n7)

    var root = conv.add_node(4, n2, n6)

    print("Preorder of original BST: ", end="")
    conv.print_preorder(root)
    print()

    conv.convert_bst_to_min_heap(root)

    print("Preorder of converted Min-Heap: ", end="")
    conv.print_preorder(root)
    print()
