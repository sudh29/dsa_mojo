# Chocolate Distribution Problem
# Pattern: Sorting / Sliding Window
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def find_min_diff(self, mut a: List[Int], m: Int) -> Int:
        var n = len(a)
        if m == 0 or n == 0 or m > n:
            return 0

        # Sort array
        for i in range(n):
            for j in range(i + 1, n):
                if a[j] < a[i]:
                    var t = a[i]
                    a[i] = a[j]
                    a[j] = t

        var min_diff = a[m - 1] - a[0]
        for i in range(1, n - m + 1):
            var diff = a[i + m - 1] - a[i]
            if diff < min_diff:
                min_diff = diff

        return min_diff

def main():
    var sol = Solution()
    var packets: List[Int] = [3, 4, 1, 9, 56, 7, 9, 12]
    var m = 5
    print("Chocolate packets: [3, 4, 1, 9, 56, 7, 9, 12], m = 5")
    print("Minimum difference:", sol.find_min_diff(packets, m))

    var packets2: List[Int] = [7, 3, 2, 4, 9, 12, 56]
    var m2 = 3
    print("Chocolate packets: [7, 3, 2, 4, 9, 12, 56], m = 3")
    print("Minimum difference:", sol.find_min_diff(packets2, m2))
