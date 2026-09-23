# K-th Largest Sum Contiguous Subarray
# Reference: https://mojolang.org/docs/manual/get-started/

struct MinHeap:
    var data: List[Int]

    def __init__(out self):
        self.data = List[Int]()

    def push(mut self, val: Int):
        self.data.append(val)
        var i = len(self.data) - 1
        while i > 0:
            var parent = (i - 1) // 2
            if self.data[i] < self.data[parent]:
                var tmp = self.data[i]
                self.data[i] = self.data[parent]
                self.data[parent] = tmp
                i = parent
            else:
                break

    def pop(mut self) -> Int:
        if len(self.data) == 0:
            return -1
        var root = self.data[0]
        var last = self.data[len(self.data) - 1]
        _ = self.data.pop()
        if len(self.data) > 0:
            self.data[0] = last
            self.heapify(0)
        return root

    def peek(self) -> Int:
        if len(self.data) == 0:
            return -1
        return self.data[0]

    def size(self) -> Int:
        return len(self.data)

    def heapify(mut self, i: Int):
        var smallest = i
        var l = 2 * i + 1
        var r = 2 * i + 2
        var n = len(self.data)

        if l < n and self.data[l] < self.data[smallest]:
            smallest = l
        if r < n and self.data[r] < self.data[smallest]:
            smallest = r

        if smallest != i:
            var tmp = self.data[i]
            self.data[i] = self.data[smallest]
            self.data[smallest] = tmp
            self.heapify(smallest)

struct Solution:
    def __init__(out self):
        pass

    def kth_largest_sum(self, arr: List[Int], n: Int, k: Int) -> Int:
        var prefix = List[Int]()
        prefix.append(0)
        for i in range(n):
            prefix.append(prefix[i] + arr[i])

        var min_heap = MinHeap()

        for i in range(1, n + 1):
            for j in range(i, n + 1):
                var sub_sum = prefix[j] - prefix[i - 1]
                if min_heap.size() < k:
                    min_heap.push(sub_sum)
                else:
                    if min_heap.peek() < sub_sum:
                        _ = min_heap.pop()
                        min_heap.push(sub_sum)

        return min_heap.peek()

def main():
    var sol = Solution()
    var arr1: List[Int] = [20, -5, -1]
    var k1 = 3
    print("Array: [20, -5, -1], k =", k1)
    print("3rd largest subarray sum:", sol.kth_largest_sum(arr1, len(arr1), k1))

    var arr2: List[Int] = [10, -10, 20, -40]
    var k2 = 6
    print("Array: [10, -10, 20, -40], k =", k2)
    print("6th largest subarray sum:", sol.kth_largest_sum(arr2, len(arr2), k2))
