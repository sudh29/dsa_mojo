# Bottom View of a Binary Tree (Last node at each horizontal distance)
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

    def bottom_view(self, root: Int) -> List[Int]:
        var res = List[Int]()
        if root == -1:
            return res^

        var q_node = List[Int]()
        var q_hd = List[Int]()

        q_node.append(root)
        q_hd.append(0)

        var map_hd = List[Int]()
        var map_val = List[Int]()

        var min_hd = 0
        var max_hd = 0

        var head = 0
        while head < len(q_node):
            var curr = q_node[head]
            var hd = q_hd[head]
            head += 1

            # Update or insert hd -> val mapping
            var found = False
            for j in range(len(map_hd)):
                if map_hd[j] == hd:
                    map_val[j] = self.nodes[curr].val
                    found = True
                    break

            if not found:
                map_hd.append(hd)
                map_val.append(self.nodes[curr].val)

            if hd < min_hd: min_hd = hd
            if hd > max_hd: max_hd = hd

            if self.nodes[curr].left != -1:
                q_node.append(self.nodes[curr].left)
                q_hd.append(hd - 1)
            if self.nodes[curr].right != -1:
                q_node.append(self.nodes[curr].right)
                q_hd.append(hd + 1)

        for d in range(min_hd, max_hd + 1):
            for j in range(len(map_hd)):
                if map_hd[j] == d:
                    res.append(map_val[j])
                    break

        return res^

def main():
    var arena = TreeArena()

    # Tree:
    #       20
    #      /  \
    #     8    22
    #    / \     \
    #   5   3     25
    #      / \
    #     10 14
    var n5 = arena.add_node(5)
    var n10 = arena.add_node(10)
    var n14 = arena.add_node(14)
    var n3 = arena.add_node(3, n10, n14)
    var n8 = arena.add_node(8, n5, n3)
    var n25 = arena.add_node(25)
    var n22 = arena.add_node(22, -1, n25)
    var root = arena.add_node(20, n8, n22)

    var bv = arena.bottom_view(root)
    print("Bottom View:", end=" [")
    for i in range(len(bv)):
        print(bv[i], end=", " if i < len(bv) - 1 else "")
    print("]")
