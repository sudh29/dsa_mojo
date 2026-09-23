# Check Mirror in N-ary Tree
# Reference: https://mojolang.org/docs/manual/get-started/

struct NodeAdj:
    var u: Int
    var children: List[Int]

    def __init__(out self, u: Int):
        self.u = u
        self.children = List[Int]()

def check_mirror_n_ary(n: Int, e: Int, a: List[Int], b: List[Int]) -> Bool:
    # Find max node id
    var max_node = n + 1
    for i in range(len(a)):
        if a[i] > max_node:
            max_node = a[i]
    for i in range(len(b)):
        if b[i] > max_node:
            max_node = b[i]

    # Adjacency for tree A: array of stacks/lists
    # Using a 2D list of Int
    var adj_a = List[List[Int]]()
    for _ in range(max_node + 1):
        adj_a.append(List[Int]())

    # Fill Tree A edges
    var i = 0
    while i < 2 * e:
        var u = a[i]
        var v = a[i + 1]
        adj_a[u].append(v)
        i += 2

    # Check against Tree B edges
    i = 0
    while i < 2 * e:
        var u = b[i]
        var v = b[i + 1]
        if len(adj_a[u]) == 0:
            return False
        # Last element of adj_a[u] must match v
        var last_idx = len(adj_a[u]) - 1
        var top_v = adj_a[u][last_idx]
        if top_v != v:
            return False
        # Pop from stack
        _ = adj_a[u].pop(last_idx)
        i += 2

    return True

def main():
    # Example:
    # Tree 1: 1->2, 1->3
    # Tree 2: 1->3, 1->2
    var a = List[Int]()
    a.append(1)
    a.append(2)
    a.append(1)
    a.append(3)

    var b = List[Int]()
    b.append(1)
    b.append(3)
    b.append(1)
    b.append(2)

    var res = check_mirror_n_ary(3, 2, a, b)
    print("Is Mirror N-ary Tree:", res)
