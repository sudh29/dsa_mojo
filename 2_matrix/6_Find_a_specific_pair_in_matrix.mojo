# Find a Specific Pair in Matrix (mat[c][d] - mat[a][b] with c > a and d > b)
# Pattern: 2D Dynamic Programming / Suffix Maximum Table
# Reference: https://mojolang.org/docs/manual/get-started/

struct Solution:
    def __init__(out self):
        pass

    def find_max_value(self, mat: List[List[Int]]) -> Int:
        var n = len(mat)
        if n < 2:
            return 0

        # Initialize max_matrix with zeros
        var max_matrix = List[List[Int]]()
        for i in range(n):
            var row = List[Int]()
            for j in range(n):
                row.append(0)
            max_matrix.append(row^)

        # Last element
        max_matrix[n - 1][n - 1] = mat[n - 1][n - 1]

        # Fill last row
        var max_val = mat[n - 1][n - 1]
        for j in range(n - 2, -1, -1):
            if mat[n - 1][j] > max_val:
                max_val = mat[n - 1][j]
            max_matrix[n - 1][j] = max_val

        # Fill last column
        max_val = mat[n - 1][n - 1]
        for i in range(n - 2, -1, -1):
            if mat[i][n - 1] > max_val:
                max_val = mat[i][n - 1]
            max_matrix[i][n - 1] = max_val

        # Fill rest of max_matrix from bottom-right
        for i in range(n - 2, -1, -1):
            for j in range(n - 2, -1, -1):
                var m1 = max_matrix[i + 1][j]
                var m2 = max_matrix[i][j + 1]
                var m3 = max_matrix[i + 1][j + 1]
                var curr = mat[i][j]

                var cell_max = curr
                if m1 > cell_max:
                    cell_max = m1
                if m2 > cell_max:
                    cell_max = m2
                if m3 > cell_max:
                    cell_max = m3

                max_matrix[i][j] = cell_max

        # Find max diff
        var max_diff = -1000000000
        for a in range(n - 1):
            for b in range(n - 1):
                var diff = max_matrix[a + 1][b + 1] - mat[a][b]
                if diff > max_diff:
                    max_diff = diff

        return max_diff

def main():
    var sol = Solution()
    var mat = List[List[Int]]()
    mat.append([1, 2, -1, -4, -20])
    mat.append([-8, -3, 4, 2, 1])
    mat.append([3, 8, 6, 1, 3])
    mat.append([-4, -1, 1, 7, -6])
    mat.append([0, -4, 10, -5, 1])

    print("Matrix 5x5 initialized.")
    print("Maximum value of mat[c][d] - mat[a][b]:", sol.find_max_value(mat))
