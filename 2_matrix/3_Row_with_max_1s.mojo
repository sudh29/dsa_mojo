# Row with Maximum 1s
# Pattern: Top-Right Staircase Scan / Binary Search
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    # O(n + m) time complexity
    def row_with_max_1s(self, arr: List[List[Int]], n: Int, m: Int) -> Int:
        var max_row_idx = -1
        var j = m - 1

        for i in range(n):
            while j >= 0 and arr[i][j] == 1:
                j -= 1
                max_row_idx = i

        return max_row_idx

def main():
    var sol = Solution()
    var mat = List[List[Int]]()
    mat.append([0, 1, 1, 1])
    mat.append([0, 0, 1, 1])
    mat.append([1, 1, 1, 1])
    mat.append([0, 0, 0, 0])

    print("Matrix 4x4:")
    print("[0, 1, 1, 1]")
    print("[0, 0, 1, 1]")
    print("[1, 1, 1, 1]")
    print("[0, 0, 0, 0]")

    print("Row with maximum 1s index:", sol.row_with_max_1s(mat, 4, 4))
