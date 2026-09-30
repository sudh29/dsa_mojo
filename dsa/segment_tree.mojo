# Segment Tree for Range Sum and Point Update Queries
# Complexity: Build O(N), Query O(log N), Update O(log N)

struct SegmentTree(Movable):
    var tree: List[Int]
    var n: Int

    def __init__(out self, arr: List[Int]):
        self.n = len(arr)
        self.tree = List[Int]()
        for _ in range(4 * self.n + 1):
            self.tree.append(0)
        if self.n > 0:
            self._build(arr, 1, 0, self.n - 1)

    def _build(mut self, arr: List[Int], node: Int, start: Int, end: Int):
        if start == end:
            self.tree[node] = arr[start]
            return
        var mid = (start + end) // 2
        var left_child = 2 * node
        var right_child = 2 * node + 1
        self._build(arr, left_child, start, mid)
        self._build(arr, right_child, mid + 1, end)
        self.tree[node] = self.tree[left_child] + self.tree[right_child]

    def update(mut self, idx: Int, val: Int):
        self._update(1, 0, self.n - 1, idx, val)

    def _update(mut self, node: Int, start: Int, end: Int, idx: Int, val: Int):
        if start == end:
            self.tree[node] = val
            return
        var mid = (start + end) // 2
        var left_child = 2 * node
        var right_child = 2 * node + 1
        if idx <= mid:
            self._update(left_child, start, mid, idx, val)
        else:
            self._update(right_child, mid + 1, end, idx, val)
        self.tree[node] = self.tree[left_child] + self.tree[right_child]

    def query(self, l: Int, r: Int) -> Int:
        return self._query(1, 0, self.n - 1, l, r)

    def _query(self, node: Int, start: Int, end: Int, l: Int, r: Int) -> Int:
        if r < start or end < l:
            return 0
        if l <= start and end <= r:
            return self.tree[node]
        var mid = (start + end) // 2
        var left_sum = self._query(2 * node, start, mid, l, r)
        var right_sum = self._query(2 * node + 1, mid + 1, end, l, r)
        return left_sum + right_sum
