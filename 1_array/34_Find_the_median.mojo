# Find the Median of an Array
# Pattern: Sorting / Median Logic
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def find_median(self, mut v: List[Int]) -> Int:
        var n = len(v)
        if n == 0:
            return 0

        # Sort array
        for i in range(n):
            for j in range(i + 1, n):
                if v[j] < v[i]:
                    var t = v[i]
                    v[i] = v[j]
                    v[j] = t

        if n % 2 == 0:
            return (v[n // 2] + v[(n // 2) - 1]) // 2
        else:
            return v[n // 2]

def main():
    var sol = Solution()
    var arr1: List[Int] = [90, 100, 78, 89, 67]
    print("Array 1: [90, 100, 78, 89, 67]")
    print("Median:", sol.find_median(arr1))

    var arr2: List[Int] = [56, 67, 30, 79]
    print("Array 2: [56, 67, 30, 79]")
    print("Median:", sol.find_median(arr2))
