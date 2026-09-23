# Minimum Cost of Connecting Ropes
# Reference: https://mojolang.org/docs/manual/get-started/

struct MinHeap:
    var data: List[Int]

    def __init__(out self):
        self.data = List[Int]()

    def size(self) -> Int:
        return len(self.data)

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
            return 0
        var top = self.data[0]
        var last = self.data.pop(len(self.data) - 1)
        if len(self.data) > 0:
            self.data[0] = last
            var idx = 0
            var n = len(self.data)
            while True:
                var smallest = idx
                var left = 2 * idx + 1
                var right = 2 * idx + 2
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

def min_cost_ropes(arr: List[Int]) -> Int:
    var heap = MinHeap()
    for i in range(len(arr)):
        heap.push(arr[i])

    var total_cost = 0
    while heap.size() > 1:
        var first = heap.pop()
        var second = heap.pop()
        var cost = first + second
        total_cost += cost
        heap.push(cost)

    return total_cost

def main():
    var arr = List[Int]()
    arr.append(4)
    arr.append(3)
    arr.append(2)
    arr.append(6)

    print("Minimum cost of connecting ropes:", min_cost_ropes(arr))

    var arr2 = List[Int]()
    arr2.append(4)
    arr2.append(2)
    arr2.append(7)
    arr2.append(6)
    arr2.append(9)
    print("Minimum cost 2:", min_cost_ropes(arr2))
