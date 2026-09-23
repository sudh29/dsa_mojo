# Find minimum and maximum element in an array
# Pattern: Linear Scan
# Reference: https://mojolang.org/docs/manual/get-started/

struct Pair:
    var min_val: Int
    var max_val: Int

    def __init__(out self, min_val: Int, max_val: Int):
        self.min_val = min_val
        self.max_val = max_val

struct Solution:
    def __init__(out self):
        pass

    def get_min_max(self, a: List[Int], n: Int) -> Pair:
        if n == 0:
            return Pair(0, 0)
        var min_val = a[0]
        var max_val = a[0]
        for i in range(1, n):
            if a[i] > max_val:
                max_val = a[i]
            if a[i] < min_val:
                min_val = a[i]
        return Pair(min_val, max_val)

def main():
    var sol = Solution()
    var arr: List[Int] = [1000, 11, 445, 1, 330, 3000]
    var result = sol.get_min_max(arr, len(arr))
    print("Array: [1000, 11, 445, 1, 330, 3000]")
    print("Minimum element:", result.min_val)
    print("Maximum element:", result.max_val)
