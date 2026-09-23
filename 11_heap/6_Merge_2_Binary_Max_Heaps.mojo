# Merge two binary Max-Heaps
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def max_heapify(self, mut arr: List[Int], n: Int, i: Int):
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
            self.max_heapify(arr, n, largest)

    def build_max_heap(self, mut arr: List[Int], n: Int):
        var start_idx = n // 2 - 1
        for i in range(start_idx, -1, -1):
            self.max_heapify(arr, n, i)

    def merge_heaps(self, a: List[Int], b: List[Int]) -> List[Int]:
        var merged = List[Int]()
        for i in range(len(a)):
            merged.append(a[i])
        for j in range(len(b)):
            merged.append(b[j])

        self.build_max_heap(merged, len(merged))
        return merged^

def main():
    var sol = Solution()
    var a: List[Int] = [10, 5, 6, 2]
    var b: List[Int] = [12, 7, 9]
    print("Heap A: [10, 5, 6, 2]")
    print("Heap B: [12, 7, 9]")

    var merged = sol.merge_heaps(a, b)
    print("Merged Max-Heap:", end=" [")
    for i in range(len(merged)):
        print(merged[i], end=", " if i < len(merged) - 1 else "")
    print("]")
