# Minimum Cost of connecting ropes using Min-Heap
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

    def min_cost(self, arr: List[Int], n: Int) -> Int:
        var heap = MinHeap()
        for i in range(n):
            heap.push(arr[i])

        var total_cost = 0
        while heap.size() > 1:
            var first = heap.pop()
            var second = heap.pop()
            var sum_cost = first + second
            total_cost += sum_cost
            heap.push(sum_cost)

        return total_cost

def main():
    var sol = Solution()
    var ropes1: List[Int] = [4, 3, 2, 6]
    var ropes2: List[Int] = [4, 2, 7, 6, 9]
    print("Ropes [4, 3, 2, 6] -> Min Cost:", sol.min_cost(ropes1, len(ropes1)))
    print("Ropes [4, 2, 7, 6, 9] -> Min Cost:", sol.min_cost(ropes2, len(ropes2)))
