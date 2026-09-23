# K largest elements in an array using Heap
# Reference: https://mojolang.org/docs/manual/get-started/

struct MaxHeap:
    var data: List[Int]

    def __init__(out self):
        self.data = List[Int]()

    def push(mut self, val: Int):
        self.data.append(val)
        var i = len(self.data) - 1
        while i > 0:
            var parent = (i - 1) // 2
            if self.data[i] > self.data[parent]:
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

    def heapify(mut self, i: Int):
        var largest = i
        var l = 2 * i + 1
        var r = 2 * i + 2
        var n = len(self.data)

        if l < n and self.data[l] > self.data[largest]:
            largest = l
        if r < n and self.data[r] > self.data[largest]:
            largest = r

        if largest != i:
            var tmp = self.data[i]
            self.data[i] = self.data[largest]
            self.data[largest] = tmp
            self.heapify(largest)

struct Solution:
    def __init__(out self):
        pass

    def k_largest(self, arr: List[Int], n: Int, k: Int) -> List[Int]:
        var heap = MaxHeap()
        for i in range(n):
            heap.push(arr[i])

        var res = List[Int]()
        for _ in range(min(k, n)):
            res.append(heap.pop())

        return res^

def main():
    var sol = Solution()
    var arr: List[Int] = [12, 5, 787, 1, 23]
    var k = 2

    print("Array: [12, 5, 787, 1, 23]")
    var top_k = sol.k_largest(arr, len(arr), k)

    print(k, "largest elements:", end=" [")
    for i in range(len(top_k)):
        print(top_k[i], end=", " if i < len(top_k) - 1 else "")
    print("]")
