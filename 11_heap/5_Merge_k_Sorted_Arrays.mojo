# Merge k Sorted Arrays
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

struct Solution:
    def __init__(out self):
        pass

    def merge_k_arrays(self, arrays: List[List[Int]], k: Int) -> List[Int]:
        var heap = MinHeap()
        var total_elements = 0

        for i in range(k):
            for j in range(len(arrays[i])):
                heap.push(arrays[i][j])
                total_elements += 1

        var res = List[Int]()
        for _ in range(total_elements):
            res.append(heap.pop())

        return res^

def main():
    var sol = Solution()
    var arrays = List[List[Int]]()

    var a1: List[Int] = [1, 2, 3]
    var a2: List[Int] = [4, 5, 6]
    var a3: List[Int] = [7, 8, 9]
    arrays.append(a1^)
    arrays.append(a2^)
    arrays.append(a3^)

    var merged = sol.merge_k_arrays(arrays, 3)
    print("Merged 3 sorted arrays:", end=" [")
    for i in range(len(merged)):
        print(merged[i], end=", " if i < len(merged) - 1 else "")
    print("]")
