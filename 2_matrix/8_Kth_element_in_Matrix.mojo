# Kth Element in Matrix
# Pattern: Binary Search on Matrix Range
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def count_less_equal(self, row: List[Int], mid: Int) -> Int:
        var l = 0
        var h = len(row) - 1
        while l <= h:
            var m = l + (h - l) // 2
            if row[m] <= mid:
                l = m + 1
            else:
                h = m - 1
        return l

    def kth_smallest(self, mat: List[List[Int]], n: Int, k: Int) -> Int:
        var low = mat[0][0]
        var high = mat[n - 1][n - 1]

        while low <= high:
            var mid = (high + low) // 2
            var count = 0
            for i in range(n):
                count += self.count_less_equal(mat[i], mid)

            if count < k:
                low = mid + 1
            else:
                high = mid - 1

        return low

def main():
    var sol = Solution()
    var mat = List[List[Int]]()
    mat.append([16, 28, 60, 64])
    mat.append([22, 41, 63, 91])
    mat.append([27, 50, 87, 93])
    mat.append([36, 78, 87, 94])

    print("Matrix 4x4:")
    print("[16, 28, 60, 64]")
    print("[22, 41, 63, 91]")
    print("[27, 50, 87, 93]")
    print("[36, 78, 87, 94]")

    var k = 3
    print("3rd smallest element is:", sol.kth_smallest(mat, 4, k))
