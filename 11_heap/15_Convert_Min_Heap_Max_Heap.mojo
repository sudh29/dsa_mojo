# Convert Min Heap to Max Heap in-place in O(N) time
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
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

    def convert_min_to_max_heap(self, mut arr: List[Int], n: Int):
        var start_idx = (n // 2) - 1
        for i in range(start_idx, -1, -1):
            self.max_heapify(arr, n, i)

def main():
    var sol = Solution()
    var arr: List[Int] = [3, 5, 9, 6, 8, 20, 10, 12, 18, 9]
    var n = len(arr)

    print("Min Heap array: ", end="[")
    for i in range(n):
        print(arr[i], end=", " if i < n - 1 else "")
    print("]")

    sol.convert_min_to_max_heap(arr, n)

    print("Converted Max Heap array: ", end="[")
    for i in range(n):
        print(arr[i], end=", " if i < n - 1 else "")
    print("]")
