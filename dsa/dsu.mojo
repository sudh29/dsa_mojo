# Disjoint Set Union (Union-Find) with Path Compression and Union by Rank
# Complexity: O(alpha(N)) nearly constant amortized time.

struct DisjointSetUnion(Movable):
    var parent: List[Int]
    var rank: List[Int]
    var num_components: Int

    def __init__(out self, n: Int):
        self.parent = List[Int]()
        self.rank = List[Int]()
        for i in range(n):
            self.parent.append(i)
            self.rank.append(0)
        self.num_components = n

    def find(mut self, i: Int) -> Int:
        var root = i
        while self.parent[root] != root:
            root = self.parent[root]

        # Path compression
        var curr = i
        while curr != root:
            var next_node = self.parent[curr]
            self.parent[curr] = root
            curr = next_node

        return root

    def union_sets(mut self, i: Int, j: Int) -> Bool:
        var root_i = self.find(i)
        var root_j = self.find(j)

        if root_i == root_j:
            return False

        if self.rank[root_i] < self.rank[root_j]:
            self.parent[root_i] = root_j
        elif self.rank[root_i] > self.rank[root_j]:
            self.parent[root_j] = root_i
        else:
            self.parent[root_j] = root_i
            self.rank[root_i] += 1

        self.num_components -= 1
        return True

    def connected(mut self, i: Int, j: Int) -> Bool:
        return self.find(i) == self.find(j)

    def count(self) -> Int:
        return self.num_components
