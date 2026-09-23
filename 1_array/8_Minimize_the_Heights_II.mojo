# Minimize the Heights I & II
# Pattern: Greedy / Sorting
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def get_min_diff_i(self, mut arr: List[Int], k: Int) -> Int:
        var n = len(arr)
        if n <= 1:
            return 0
        # Sort array
        for i in range(n):
            for j in range(i + 1, n):
                if arr[j] < arr[i]:
                    var t = arr[i]
                    arr[i] = arr[j]
                    arr[j] = t

        var diff = arr[n - 1] - arr[0]
        for i in range(1, n):
            var max_val = arr[i - 1] + k if (arr[i - 1] + k) > (arr[n - 1] - k) else (arr[n - 1] - k)
            var min_val = arr[0] + k if (arr[0] + k) < (arr[i] - k) else (arr[i] - k)
            if (max_val - min_val) < diff:
                diff = max_val - min_val
        return diff

    def get_min_diff_ii(self, mut arr: List[Int], k: Int) -> Int:
        var n = len(arr)
        if n <= 1:
            return 0
        # Sort array
        for i in range(n):
            for j in range(i + 1, n):
                if arr[j] < arr[i]:
                    var t = arr[i]
                    arr[i] = arr[j]
                    arr[j] = t

        var diff = arr[n - 1] - arr[0]
        for i in range(1, n):
            if arr[i] - k < 0:
                continue
            var max_val = arr[i - 1] + k if (arr[i - 1] + k) > (arr[n - 1] - k) else (arr[n - 1] - k)
            var min_val = arr[0] + k if (arr[0] + k) < (arr[i] - k) else (arr[i] - k)
            if (max_val - min_val) < diff:
                diff = max_val - min_val
        return diff

def main():
    var sol = Solution()
    var arr: List[Int] = [1, 5, 8, 10]
    var k = 2
    print("Array: [1, 5, 8, 10], k = 2")
    print("Min Difference (Heights II):", sol.get_min_diff_ii(arr, k))
