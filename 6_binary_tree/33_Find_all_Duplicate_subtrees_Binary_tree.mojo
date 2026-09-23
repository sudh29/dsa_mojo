# Find all Duplicate Subtrees in Binary Tree
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

    def serialize_and_find_duplicates(
        self,
        node: Int,
        mut seen_keys: List[String],
        mut seen_counts: List[Int],
        mut duplicate_roots: List[Int]
    ) -> String:
        if node == -1:
            return "null"

        var left_str = self.serialize_and_find_duplicates(
            self.nodes[node].left, seen_keys, seen_counts, duplicate_roots
        )
        var right_str = self.serialize_and_find_duplicates(
            self.nodes[node].right, seen_keys, seen_counts, duplicate_roots
        )

        var s = String(self.nodes[node].val) + "," + left_str + "," + right_str

        var found_idx = -1
        for i in range(len(seen_keys)):
            if seen_keys[i] == s:
                found_idx = i
                break

        if found_idx != -1:
            seen_counts[found_idx] += 1
            if seen_counts[found_idx] == 2:
                duplicate_roots.append(self.nodes[node].val)
        else:
            seen_keys.append(s)
            seen_counts.append(1)

        return s

    def find_duplicate_subtrees(self, root: Int) -> List[Int]:
        var seen_keys = List[String]()
        var seen_counts = List[Int]()
        var duplicate_roots = List[Int]()

        _ = self.serialize_and_find_duplicates(root, seen_keys, seen_counts, duplicate_roots)
        return duplicate_roots^

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
    var n4_1 = arena.add_node(4)
    var n2_1 = arena.add_node(2, n4_1, -1)
    var n4_2 = arena.add_node(4)
    var n2_2 = arena.add_node(2, n4_2, -1)
    var n4_3 = arena.add_node(4)
    var n3 = arena.add_node(3, n2_2, n4_3)
    var root = arena.add_node(1, n2_1, n3)

    var dups = arena.find_duplicate_subtrees(root)
    print("Roots of duplicate subtrees:", end=" [")
    for i in range(len(dups)):
        print(dups[i], end=", " if i < len(dups) - 1 else "")
    print("]")
