# Find Median in a Stream of Running Integers using Two Heaps
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

    def peek(self) -> Int:
        if len(self.data) == 0:
            return -1
        return self.data[0]

    def size(self) -> Int:
        return len(self.data)

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

struct MedianFinder:
    var left_max_heap: MaxHeap
    var right_min_heap: MinHeap

    def __init__(out self):
        self.left_max_heap = MaxHeap()
        self.right_min_heap = MinHeap()

    def insert_num(mut self, num: Int):
        if self.left_max_heap.size() == 0 or num <= self.left_max_heap.peek():
            self.left_max_heap.push(num)
        else:
            self.right_min_heap.push(num)

        # Balance heaps: left can have at most 1 more element than right
        if self.left_max_heap.size() > self.right_min_heap.size() + 1:
            self.right_min_heap.push(self.left_max_heap.pop())
        elif self.right_min_heap.size() > self.left_max_heap.size():
            self.left_max_heap.push(self.right_min_heap.pop())

    def get_median(self) -> Float64:
        if self.left_max_heap.size() > self.right_min_heap.size():
            return Float64(self.left_max_heap.peek())
        else:
            var sum_two = self.left_max_heap.peek() + self.right_min_heap.peek()
            return Float64(sum_two) / 2.0

def main():
    var mf = MedianFinder()
    var stream: List[Int] = [5, 15, 1, 3]
    for i in range(len(stream)):
        var val = stream[i]
        mf.insert_num(val)
        print("Inserted:", val, "-> Running Median:", mf.get_median())
