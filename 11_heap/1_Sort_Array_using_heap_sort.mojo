# Sort an Array using Heap Sort
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def heapify(self, mut arr: List[Int], n: Int, i: Int):
        var largest = i
        var left = 2 * i + 1
        var right = 2 * i + 2

        if left < n and arr[left] > arr[largest]:
            largest = left
        if right < n and arr[right] > arr[largest]:
            largest = right

        if largest != i:
            var tmp = arr[i]
            arr[i] = arr[largest]
            arr[largest] = tmp
            self.heapify(arr, n, largest)

    def build_heap(self, mut arr: List[Int], n: Int):
        var idx = (n - 1) // 2
        for i in range(idx, -1, -1):
            self.heapify(arr, n, i)

    def heap_sort(self, mut arr: List[Int], n: Int):
        self.build_heap(arr, n)

        for i in range(n - 1, 0, -1):
            var tmp = arr[0]
            arr[0] = arr[i]
            arr[i] = tmp
            self.heapify(arr, i, 0)

def main():
    var sol = Solution()
    var arr: List[Int] = [12, 11, 13, 5, 6, 7]
    var n = len(arr)

    print("Unsorted Array:", end=" [")
    for i in range(n):
        print(arr[i], end=", " if i < n - 1 else "")
    print("]")

    sol.heap_sort(arr, n)

    print("Sorted Array (Heap Sort):", end=" [")
    for i in range(n):
        print(arr[i], end=", " if i < n - 1 else "")
    print("]")
