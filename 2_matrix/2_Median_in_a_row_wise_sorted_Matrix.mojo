# Median in a Row-wise Sorted Matrix
# Pattern: Binary Search on Answer / Upper Bound
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    # Count elements <= mid in row using binary search
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

    def median(self, matrix: List[List[Int]], r: Int, c: Int) -> Int:
        if r == 0 or c == 0:
            return 0

        var min_val = matrix[0][0]
        var max_val = matrix[0][c - 1]

        for i in range(1, r):
            if matrix[i][0] < min_val:
                min_val = matrix[i][0]
            if matrix[i][c - 1] > max_val:
                max_val = matrix[i][c - 1]

        var desired = (r * c + 1) // 2

        while min_val < max_val:
            var mid = min_val + (max_val - min_val) // 2
            var count = 0
            for i in range(r):
                count += self.count_less_equal(matrix[i], mid)

            if count < desired:
                min_val = mid + 1
            else:
                max_val = mid

        return min_val

def main():
    var sol = Solution()
    var mat = List[List[Int]]()
    mat.append([1, 3, 5])
    mat.append([2, 6, 9])
    mat.append([3, 6, 9])

    print("Matrix 3x3:")
    print("[1, 3, 5]")
    print("[2, 6, 9]")
    print("[3, 6, 9]")

    print("Median is:", sol.median(mat, 3, 3))
