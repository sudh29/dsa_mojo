# Max Heap Implementation in Mojo
# Reference: https://mojolang.org/docs/manual/get-started/

struct MaxHeap:
    var data: List[Int]

    def __init__(out self):
        self.data = List[Int]()

    def size(self) -> Int:
        return len(self.data)

    def is_empty(self) -> Bool:
        return len(self.data) == 0

    def peek(self) -> Int:
        if self.is_empty():
            return -1
        return self.data[0]

    def push(mut self, val: Int):
        self.data.append(val)
        self._sift_up(len(self.data) - 1)

    def pop(mut self) -> Int:
        if self.is_empty():
            return -1

        var top = self.data[0]
        var last = self.data.pop(len(self.data) - 1)

        if len(self.data) > 0:
            self.data[0] = last
            self._sift_down(0)

        return top

    def _sift_up(mut self, var idx: Int):
        while idx > 0:
            var parent = (idx - 1) // 2
            if self.data[idx] > self.data[parent]:
                var tmp = self.data[idx]
                self.data[idx] = self.data[parent]
                self.data[parent] = tmp
                idx = parent
            else:
                break

    def _sift_down(mut self, var idx: Int):
        var n = len(self.data)
        while True:
            var largest = idx
            var left = 2 * idx + 1
            var right = 2 * idx + 2

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

def main():
    var h = MaxHeap()
    h.push(10)
    h.push(30)
    h.push(20)
    h.push(400)

    print("Max element (peek):", h.peek())

    print("Popping elements in descending order:", end=" [")
    while not h.is_empty():
        print(h.pop(), end=", " if not h.is_empty() else "")
    print("]")
