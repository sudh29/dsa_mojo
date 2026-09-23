# Top View of a Binary Tree (Horizontal Distance mapping)
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

    def top_view(self, root: Int) -> List[Int]:
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

            # Check if hd is already mapped
            var seen = False
            for j in range(len(map_hd)):
                if map_hd[j] == hd:
                    seen = True
                    break

            if not seen:
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
    #       1
    #     /   \
    #    2     3
    #     \
    #      4
    #       \
    #        5
    var n5 = arena.add_node(5)
    var n4 = arena.add_node(4, -1, n5)
    var n2 = arena.add_node(2, -1, n4)
    var n3 = arena.add_node(3)
    var root = arena.add_node(1, n2, n3)

    var tv = arena.top_view(root)
    print("Top View:", end=" [")
    for i in range(len(tv)):
        print(tv[i], end=", " if i < len(tv) - 1 else "")
    print("]")
