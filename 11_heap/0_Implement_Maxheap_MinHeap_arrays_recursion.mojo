# Implement MaxHeap and MinHeap from arrays using recursion
# Reference: https://mojolang.org/docs/manual/get-started/

struct Heap:
    def __init__(out self):
        pass

    def max_heapify(self, mut arr: List[Int], n: Int, i: Int):
        var largest = i
        var l = 2 * i + 1
        var r = 2 * i + 2

        if l < n and arr[l] > arr[largest]:
            largest = l
        if r < n and arr[r] > arr[largest]:
            largest = r

        if largest != i:
            var tmp = arr[i]
            arr[i] = arr[largest]
            arr[largest] = tmp
            self.max_heapify(arr, n, largest)

    def min_heapify(self, mut arr: List[Int], n: Int, i: Int):
        var smallest = i
        var l = 2 * i + 1
        var r = 2 * i + 2

        if l < n and arr[l] < arr[smallest]:
            smallest = l
        if r < n and arr[r] < arr[smallest]:
            smallest = r

        if smallest != i:
            var tmp = arr[i]
            arr[i] = arr[smallest]
            arr[smallest] = tmp
            self.min_heapify(arr, n, smallest)

    def build_max_heap(self, mut arr: List[Int], n: Int):
        var start_idx = n // 2 - 1
        for i in range(start_idx, -1, -1):
            self.max_heapify(arr, n, i)

    def build_min_heap(self, mut arr: List[Int], n: Int):
        var start_idx = n // 2 - 1
        for i in range(start_idx, -1, -1):
            self.min_heapify(arr, n, i)

    def print_heap(self, arr: List[Int], n: Int):
        print("[", end="")
        for i in range(n):
            print(arr[i], end=", " if i < n - 1 else "")
        print("]")

def main():
    var h = Heap()
    var arr1: List[Int] = [1, 3, 5, 4, 6, 13, 10, 9, 8, 15, 17]
    var n1 = len(arr1)

    print("Original Array:")
    h.print_heap(arr1, n1)

    h.build_max_heap(arr1, n1)
    print("Array representation of Max-Heap:")
    h.print_heap(arr1, n1)

    var arr2: List[Int] = [1, 3, 5, 4, 6, 13, 10, 9, 8, 15, 17]
    var n2 = len(arr2)
    h.build_min_heap(arr2, n2)
    print("Array representation of Min-Heap:")
    h.print_heap(arr2, n2)
