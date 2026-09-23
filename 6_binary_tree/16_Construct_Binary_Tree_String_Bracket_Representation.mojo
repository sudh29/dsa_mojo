# Construct Binary Tree from String with Bracket Representation
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

    def tree_from_string(mut self, s: String) -> Int:
        if s.byte_length() == 0:
            return -1

        var p = -1
        for i in range(s.byte_length()):
            if s[byte=i] == '(':
                p = i
                break

        if p == -1:
            var num = 0
            var sign = 1
            var start = 0
            if s[byte=0] == '-':
                sign = -1
                start = 1
            for i in range(start, s.byte_length()):
                num = num * 10 + (Int(s.as_bytes()[i]) - 48)
            return self.add_node(sign * num)

        var root_val_str = String("")
        for i in range(p):
            root_val_str += s[byte=i]

        var num = 0
        var sign = 1
        var start = 0
        if root_val_str[byte=0] == '-':
            sign = -1
            start = 1
        for i in range(start, root_val_str.byte_length()):
            num = num * 10 + (Int(root_val_str.as_bytes()[i]) - 48)

        var root_idx = self.add_node(sign * num)

        var cnt = 0
        var left_start = -1
        var left_end = -1
        var right_start = -1
        var right_end = -1

        for i in range(p, s.byte_length()):
            if s[byte=i] == '(':
                if cnt == 0:
                    if left_start == -1:
                        left_start = i + 1
                    else:
                        right_start = i + 1
                cnt += 1
            elif s[byte=i] == ')':
                cnt -= 1
                if cnt == 0:
                    if left_end == -1:
                        left_end = i
                    else:
                        right_end = i
                        break

        if left_start != -1 and left_end != -1:
            var left_str = String("")
            for i in range(left_start, left_end):
                left_str += s[byte=i]
            var l_child = self.tree_from_string(left_str)
            self.nodes[root_idx].left = l_child

        if right_start != -1 and right_end != -1:
            var right_str = String("")
            for i in range(right_start, right_end):
                right_str += s[byte=i]
            var r_child = self.tree_from_string(right_str)
            self.nodes[root_idx].right = r_child

        return root_idx

    def inorder(self, root: Int, mut res: List[Int]):
        if root == -1:
            return
        self.inorder(self.nodes[root].left, res)
        res.append(self.nodes[root].val)
        self.inorder(self.nodes[root].right, res)

def main():
    var arena = TreeArena()
    var s = String("4(2(3)(1))(6(5))")
    var root = arena.tree_from_string(s)

    var res = List[Int]()
    arena.inorder(root, res)
    print("Constructed tree inorder:", end=" [")
    for i in range(len(res)):
        print(res[i], end=", " if i < len(res) - 1 else "")
    print("]")
