# Canonical MinHeap and MaxHeap implementation in Mojo 1.1

struct MinHeap(Movable):
    var data: List[Int]

    def __init__(out self):
        self.data = List[Int]()

    def push(mut self, val: Int):
        self.data.append(val)
        var idx = len(self.data) - 1
        while idx > 0:
            var parent = (idx - 1) // 2
            if self.data[idx] < self.data[parent]:
                var tmp = self.data[idx]
                self.data[idx] = self.data[parent]
                self.data[parent] = tmp
                idx = parent
            else:
                break

    def pop(mut self) -> Int:
        if len(self.data) == 0:
            return -1
        var top = self.data[0]
        var last = self.data.pop()
        if len(self.data) == 0:
            return top
        self.data[0] = last

        var idx = 0
        var n = len(self.data)
        while True:
            var left = 2 * idx + 1
            var right = 2 * idx + 2
            var smallest = idx

            if left < n and self.data[left] < self.data[smallest]:
                smallest = left
            if right < n and self.data[right] < self.data[smallest]:
                smallest = right

            if smallest != idx:
                var tmp = self.data[idx]
                self.data[idx] = self.data[smallest]
                self.data[smallest] = tmp
                idx = smallest
            else:
                break

        return top

    def size(self) -> Int:
        return len(self.data)

struct MaxHeap(Movable):
    var data: List[Int]

    def __init__(out self):
        self.data = List[Int]()

    def push(mut self, val: Int):
        self.data.append(val)
        var idx = len(self.data) - 1
        while idx > 0:
            var parent = (idx - 1) // 2
            if self.data[idx] > self.data[parent]:
                var tmp = self.data[idx]
                self.data[idx] = self.data[parent]
                self.data[parent] = tmp
                idx = parent
            else:
                break

    def pop(mut self) -> Int:
        if len(self.data) == 0:
            return -1
        var top = self.data[0]
        var last = self.data.pop()
        if len(self.data) == 0:
            return top
        self.data[0] = last

        var idx = 0
        var n = len(self.data)
        while True:
            var left = 2 * idx + 1
            var right = 2 * idx + 2
            var largest = idx

            if left < n and self.data[left] > self.data[largest]:
                largest = left
            if right < n and self.data[right] > self.data[largest]:
                largest = right

            if largest != idx:
                var tmp = self.data[idx]
                self.data[idx] = self.data[largest]
                self.data[largest] = tmp
                idx = largest
            else:
                break

        return top

    def size(self) -> Int:
        return len(self.data)
