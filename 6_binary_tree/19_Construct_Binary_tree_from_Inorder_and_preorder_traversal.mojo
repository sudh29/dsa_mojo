# Construct Binary Tree from Inorder and Preorder Traversal
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

    def build_tree_util(
        mut self,
        preorder: List[Int],
        inorder: List[Int],
        pre_start: Int,
        pre_end: Int,
        in_start: Int,
        in_end: Int
    ) -> Int:
        if pre_start > pre_end or in_start > in_end:
            return -1

        var root_val = preorder[pre_start]
        var in_idx = -1
        for i in range(in_start, in_end + 1):
            if inorder[i] == root_val:
                in_idx = i
                break

        var left_len = in_idx - in_start

        var left_child = self.build_tree_util(
            preorder, inorder,
            pre_start + 1, pre_start + left_len,
            in_start, in_idx - 1
        )
        var right_child = self.build_tree_util(
            preorder, inorder,
            pre_start + left_len + 1, pre_end,
            in_idx + 1, in_end
        )

        return self.add_node(root_val, left_child, right_child)

    def build_tree(mut self, preorder: List[Int], inorder: List[Int]) -> Int:
        if len(preorder) == 0:
            return -1
        return self.build_tree_util(preorder, inorder, 0, len(preorder) - 1, 0, len(inorder) - 1)

    def postorder(self, root: Int, mut res: List[Int]):
        if root == -1:
            return
        self.postorder(self.nodes[root].left, res)
        self.postorder(self.nodes[root].right, res)
        res.append(self.nodes[root].val)

def main():
    var arena = TreeArena()
    var preorder = List[Int]()
    preorder.append(3)
    preorder.append(9)
    preorder.append(20)
    preorder.append(15)
    preorder.append(7)

    var inorder = List[Int]()
    inorder.append(9)
    inorder.append(3)
    inorder.append(15)
    inorder.append(20)
    inorder.append(7)

    var root = arena.build_tree(preorder, inorder)

    var post = List[Int]()
    arena.postorder(root, post)
    print("Postorder of constructed tree:", end=" [")
    for i in range(len(post)):
        print(post[i], end=", " if i < len(post) - 1 else "")
    print("]")
