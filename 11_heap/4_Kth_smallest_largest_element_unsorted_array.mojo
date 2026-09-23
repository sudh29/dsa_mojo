# Kth Smallest and Kth Largest element in an unsorted array
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

    def kth_smallest(self, arr: List[Int], k: Int) -> Int:
        var heap = MinHeap()
        for i in range(len(arr)):
            heap.push(arr[i])

        var ans = -1
        for _ in range(k):
            ans = heap.pop()
        return ans^

    def kth_largest(self, arr: List[Int], k: Int) -> Int:
        var heap = MaxHeap()
        for i in range(len(arr)):
            heap.push(arr[i])

        var ans = -1
        for _ in range(k):
            ans = heap.pop()
        return ans^

def main():
    var sol = Solution()
    var arr: List[Int] = [7, 10, 4, 3, 20, 15]
    var k = 3

    print("Array: [7, 10, 4, 3, 20, 15], k =", k)
    print("3rd Smallest:", sol.kth_smallest(arr, k))
    print("3rd Largest:", sol.kth_largest(arr, k))
