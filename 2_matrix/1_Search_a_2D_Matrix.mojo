# Search a 2D Matrix
# Pattern: Staircase Search / Binary Search on 2D
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    # Staircase search in row-wise and col-wise sorted matrix: O(m + n)
    def search_matrix(self, matrix: List[List[Int]], target: Int) -> Bool:
        var m = len(matrix)
        if m == 0:
            return False
        var n = len(matrix[0])
        if n == 0:
            return False

        var i = 0
        var j = n - 1

        while i < m and j >= 0:
            if matrix[i][j] == target:
                return True
            elif matrix[i][j] > target:
                j -= 1
            else:
                i += 1

        return False

def main():
    var sol = Solution()
    var mat = List[List[Int]]()
    mat.append([1, 3, 5, 7])
    mat.append([10, 11, 16, 20])
    mat.append([23, 30, 34, 60])

    print("Matrix 3x4:")
    print("[1, 3, 5, 7]")
    print("[10, 11, 16, 20]")
    print("[23, 30, 34, 60]")

    var target1 = 3
    print("Search target", target1, ":", sol.search_matrix(mat, target1))
    var target2 = 13
    print("Search target", target2, ":", sol.search_matrix(mat, target2))
