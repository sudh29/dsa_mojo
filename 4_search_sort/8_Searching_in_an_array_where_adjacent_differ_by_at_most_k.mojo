# Searching in an array where adjacent elements differ by at most k
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def search(self, arr: List[Int], n: Int, x: Int, k: Int) -> Int:
        var i = 0
        while i < n:
            if arr[i] == x:
                return i

            var diff = abs(arr[i] - x)
            var step = diff // k
            if step < 1:
                step = 1

            i += step

        return -1

def main():
    var sol = Solution()
    var arr: List[Int] = [20, 40, 50, 70, 70, 60]
    var n = len(arr)
    var k = 20
    var x = 60

    print("Array:", end=" [")
    for i in range(n):
        print(arr[i], end=", " if i < n - 1 else "")
    print("]")

    print("Searching for", x, "with diff at most", k, "-> Found at index:", sol.search(arr, n, x, k))

    var arr2: List[Int] = [10, 20, 30, 40, 50]
    print("Searching for 30 in [10, 20, 30, 40, 50] with k=5 -> Index:", sol.search(arr2, len(arr2), 30, 5))
