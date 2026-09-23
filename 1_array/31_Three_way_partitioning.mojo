# Three Way Partitioning
# Pattern: Dutch National Flag / Three Pointer
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def three_way_partition(self, mut array: List[Int], a: Int, b: Int):
        var n = len(array)
        var low = 0
        var high = n - 1
        var i = 0

        while i <= high:
            if array[i] < a:
                var temp = array[i]
                array[i] = array[low]
                array[low] = temp
                i += 1
                low += 1
            elif array[i] > b:
                var temp = array[i]
                array[i] = array[high]
                array[high] = temp
                high -= 1
            else:
                i += 1

def main():
    var sol = Solution()
    var arr: List[Int] = [1, 14, 5, 20, 4, 2, 54, 20, 87, 98, 3, 1, 32]
    var a = 10
    var b = 20
    print("Original array: [1, 14, 5, 20, 4, 2, 54, 20, 87, 98, 3, 1, 32], Range: [10, 20]")
    sol.three_way_partition(arr, a, b)
    print("Partitioned array:", end=" [")
    for i in range(len(arr)):
        print(arr[i], end=", " if i < len(arr) - 1 else "")
    print("]")
