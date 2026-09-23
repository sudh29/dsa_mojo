# Check if Binary Tree contains Duplicate Subtrees of size 2 or more
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

    def serialize_subtrees(
        self,
        node: Int,
        mut seen: List[String],
        mut counts: List[Int],
        mut has_duplicate: Bool
    ) -> String:
        if node == -1:
            return "#"

        var left_str = self.serialize_subtrees(self.nodes[node].left, seen, counts, has_duplicate)
        var right_str = self.serialize_subtrees(self.nodes[node].right, seen, counts, has_duplicate)

        # A leaf node has both children "#"
        var s = String(self.nodes[node].val) + "," + left_str + "," + right_str

        # Only subtrees of size >= 2 (not a single leaf)
        if not (self.nodes[node].left == -1 and self.nodes[node].right == -1):
            var found = False
            for i in range(len(seen)):
                if seen[i] == s:
                    counts[i] += 1
                    if counts[i] >= 2:
                        has_duplicate = True
                    found = True
                    break
            if not found:
                seen.append(s)
                counts.append(1)

        return s

    def has_duplicate_subtrees(self, root: Int) -> Bool:
        var seen = List[String]()
        var counts = List[Int]()
        var has_duplicate = False
        _ = self.serialize_subtrees(root, seen, counts, has_duplicate)
        return has_duplicate

def main():
    var arena = TreeArena()
    # Tree:
    #         1
    #       /   \
    #      2     3
    #     /     / \
    #    4     2   4
    #         /
    #        4
    var n4_a = arena.add_node(4)
    var n2_a = arena.add_node(2, n4_a, -1)
    var n4_b = arena.add_node(4)
    var n4_c = arena.add_node(4)
    var n2_b = arena.add_node(2, n4_c, -1)
    var n3 = arena.add_node(3, n2_b, n4_b)
    var root = arena.add_node(1, n2_a, n3)

    print("Has duplicate subtree of size >= 2:", arena.has_duplicate_subtrees(root))
